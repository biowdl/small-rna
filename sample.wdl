version 1.0

# MIT License
#
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
import "tasks/htseq.wdl" as htseq

workflow SampleWorkflow {
    input {
        Sample sample
        String outputDir = "."
        Array[File]+ bowtieIndexFiles
        String? platform = "illumina"
        Array[File]+ gtfFiles
        String stranded = "no"
    }

    Array[Readgroup] readgroups = sample.readgroups

    scatter (readgroup in readgroups) {
        String readgroupIdentifier = readgroup.lib_id + "-" + readgroup.id
        call QC.QC as QualityControl {
            input:
                read1 = readgroup.R1,
                read2 = readgroup.R2,
                readgroupName = readgroup.id,
                outputDir = outputDir + "/" + readgroupIdentifier,
        }


        call bowtie.Bowtie as Bowtie {
            input:
                readsUpstream = [QualityControl.qcRead1],
                readsDownstream = if defined(readgroup.R2) then select_all([QualityControl.qcRead2]) else readgroup.R2,  # FIXME: else None
                indexFiles = bowtieIndexFiles,
                samRG = "ID:~{sample.id}-~{readgroup.lib_id}-~{readgroup.id}\tLB:~{readgroup.lib_id}\tSM:~{sample.id}\tPL:~{platform}",
                outputPath = outputDir + "/" + readgroupIdentifier  + "/" + readgroupIdentifier + ".bam"
        }
    }

    scatter (gtfFile in gtfFiles) {
        call htseq.HTSeqCount as HTSeqCount {
            input:
                inputBams = Bowtie.outputBam,
                inputBamsIndex = Bowtie.outputBamIndex,
                gtfFile = gtfFile,
                stranded = stranded,
                outputTable = outputDir + "/" + basename(gtfFile) + ".tsv"
        }
    }

    output {
        Array[File] countTables = HTSeqCount.counts
    }
}