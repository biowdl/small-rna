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

workflow SampleWorkflow {
    input {
        Sample sample
        String outputDir = "."
        Array[File]+ bowtieIndexFiles
        String? platform = "illumina"
        Array[GTF]+ gtfFiles
        String stranded
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
    }

    call samtools.Merge as samtoolsMerge {
        input:
            bamFiles = Bowtie.outputBam,
            outputBamPath = outputDir + "/" + sample.id + ".bam",
            dockerImage = dockerImages["samtools"]
    }

    call samtools.SortByName as samtoolsSort {
        input:
            bamFile = samtoolsMerge.outputBam,
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
        File bam = samtoolsMerge.outputBam
        File bamIndex = samtoolsMerge.outputBamIndex
        Array[File] qcReports = flatten(QualityControl.reports)
        Boolean finished = true
    }
}
