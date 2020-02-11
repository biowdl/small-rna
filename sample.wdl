version 1.0

# Copyright (c) 2018 Leiden University Medical Center
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import "structs.wdl" as structs
import "QC/QC.wdl" as QC
import "tasks/bowtie.wdl" as bowtie
import "tasks/samtools.wdl" as samtools
import "tasks/htseq.wdl" as htseq
import "tasks/umi-tools.wdl" as umiTools

workflow SampleWorkflow {
    input {
        Sample sample
        String outputDir = "."
        Array[File]+ bowtieIndexFiles
        String? platform = "illumina"
        Array[GTF]+ gtfFiles
        String stranded
        Boolean umiDeduplication  = false
        Map[String, String] dockerImages
    }

    Array[Readgroup] readgroups = sample.readgroups

    scatter (readgroup in readgroups) {

        String readgroupName = "~{sample.id}-~{readgroup.lib_id}-~{readgroup.id}"
        String readgroupIdentifier = readgroup.lib_id + "-" + readgroup.id

        call QC.QC as QualityControl {
            input:
                read1 = readgroup.R1,
                read2 = readgroup.R2,
                readgroupName = readgroupName,
                outputDir = outputDir + "/" + readgroupIdentifier,
                dockerImages = dockerImages
        }


        call bowtie.Bowtie as Bowtie {
            input:
                readsUpstream = [QualityControl.qcRead1],
                readsDownstream = if defined(readgroup.R2)
                    then select_all([QualityControl.qcRead2])
                    else [],
                indexFiles = bowtieIndexFiles,
                samRG = "ID:~{readgroupName}\tLB:~{readgroup.lib_id}\tSM:~{sample.id}\tPL:~{platform}",
                outputPath = outputDir + "/" + readgroupIdentifier  + "/" + readgroupIdentifier + ".bam",
                dockerImage = dockerImages["bowtie"]
        }

        Boolean paired = defined(readgroup.R2)
    }

    call samtools.Merge as samtoolsMerge {
        input:
            bamFiles = Bowtie.outputBam,
            outputBamPath = outputDir + "/" + sample.id + ".bam",
            dockerImage = dockerImages["samtools"]
    }

    if (umiDeduplication) {
        call umiTools.Dedup as umiDedup {
            input:
                inputBam = samtoolsMerge.outputBam,
                inputBamIndex = samtoolsMerge.outputBamIndex,
                outputBamPath = outputDir + "/" + sample.id + ".dedup.bam",
                statsPrefix = outputDir + "/" + sample.id,
                paired = paired[0], # Assumes that if one readgroup is paired, all are
                dockerImage = dockerImages["umi-tools"]
        }
    }

    call samtools.SortByName as samtoolsSort {
        input:
            bamFile = select_first([umiDedup.deduppedBam, samtoolsMerge.outputBam]),
            dockerImage = dockerImages["samtools"]
    }

    scatter (gtfFile in gtfFiles) {
        call htseq.HTSeqCount as HTSeqCount {
            input:
                inputBams = [samtoolsSort.outputBam],
                gtfFile = gtfFile.path,
                order = "name",
                featureType = gtfFile.featureType,
                idattr = gtfFile.idattr,
                stranded = stranded,
                outputTable = outputDir + "/" + sample.id + "-" + basename(gtfFile.path) + ".tsv",
                dockerImage = dockerImages["htseq"]
        }
    }

    output {
        Array[File] countTables = HTSeqCount.counts
        File bam = select_first([umiDedup.deduppedBam, samtoolsMerge.outputBam])
        File bamIndex = select_first([umiDedup.deduppedBamIndex, samtoolsMerge.outputBamIndex])
        File? umiEditDistance = umiDedup.editDistance
        File? umiStats = umiDedup.umiStats
        File? umiPositionStats = umiDedup.positionStats
        Array[File] qcReports = flatten(QualityControl.reports)
        Boolean finished = true
    }

    parameter_meta {
        sample: {description: "The sample data", category: "required"}
        outputDir: {description: "The directory where the output should be written.", category: "common"}
        bowtieIndexFiles: {description: "The bowtie index files.", category: "required"}
        platform: {description: "The platform used for sequencing.", category: "advanced"}
        gtfFiles: {description: "The reference GTF files.", category: "required"}
        stranded: {description: "Whether or not the data is stranded: yes, no or reverse.", category: "required"}
        umiDeduplication: {description: "Whether or not UMI based deduplication should be performed.", category: "common"}
        dockerImages: {description: "The docker image used for this task. Changing this may result in errors which the developers may choose not to address.",
                       category: "advanced"}
    }
}
