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
import "sample.wdl" as SampleWorkflow
import "tasks/multiqc.wdl" as multiqc
import "tasks/common.wdl" as common
import "tasks/biowdl.wdl" as biowdl
import "tasks/collect-columns.wdl" as collect_columns

workflow SmallRna {
    input {
        File sampleConfigFile
        String outputDir = "."
        Array[File]+ bowtieIndexFiles
        String? platform = "illumina"
        Array[GTF]+ gtfFiles
        String stranded = "no"
        Boolean umiDeduplication  = false
        String umiSeparator = "_"
        Boolean runMultiQC = if (outputDir == ".") then false else true
        File dockerImagesFile
    }

    # Parse docker Tags configuration and sample sheet
    call common.YamlToJson as ConvertDockerImagesFile {
        input:
            yaml = dockerImagesFile,
            outputJson = outputDir + "/dockerImages.json"
    }
    Map[String, String] dockerImages = read_json(ConvertDockerImagesFile.json)

    call biowdl.InputConverter as ConvertSampleConfig {
        input:
            samplesheet = sampleConfigFile
    }

    SampleConfig sampleConfig = read_json(ConvertSampleConfig.json)
    Array[Sample] allSamples = sampleConfig.samples

    scatter (sample in allSamples) {
        call SampleWorkflow.SampleWorkflow as sampleWorkflow {
            input:
                sample = sample,
                outputDir = outputDir + "/" + sample.id,
                bowtieIndexFiles = bowtieIndexFiles,
                platform = platform,
                gtfFiles = gtfFiles,
                stranded = stranded,
                umiDeduplication = umiDeduplication,
                umiSeparator = umiSeparator,
                dockerImages = dockerImages
        }
        # Create a list of sampleIds
        String sampleIds = sample.id
    }

    # Transpose turns a list of count tables per sample in a list of samples per count table.
    # This is necessary since we want to merge counttables on a per gtf bases.
    # Not on a per sample basis.
    Array[Array[File]] countTablesTransposed = transpose(sampleWorkflow.countTables)

    scatter (index in range(length(gtfFiles))) {
        String gtfName = "merged_counts_" + basename(gtfFiles[index].path)

        call collect_columns.CollectColumns as CollectColumns {
            input:
                inputTables = countTablesTransposed[index],
                outputPath = outputDir + "/~{gtfName}.tsv",
                sampleNames = sampleIds,
                featureColumn = 0,
                valueColumn = 1
        }
    }

    if (runMultiQC) {
        call multiqc.MultiQC as multiqcTask {
            input:
                # Multiqc will only run if these files are created.
                finished = sampleWorkflow.finished,
                dependencies = CollectColumns.outputTable,
                outDir = outputDir,
                analysisDirectory = outputDir,
                dockerImage = dockerImages["multiqc"],
                fullNames = true  # Otherwise multiqc thinks there is a 'Merged' sample
        }
    }

    output {
        Array[File] mergedCountTable = CollectColumns.outputTable
        Array[File] countTables = flatten(sampleWorkflow.countTables)
        Array[File] bamFiles = sampleWorkflow.bam
        Array[File] bamIndexes = sampleWorkflow.bamIndex
        Array[File] qcReports = flatten(sampleWorkflow.qcReports)
        Array[File?] umiEditDistance = sampleWorkflow.umiEditDistance
        Array[File?] umiStats = sampleWorkflow.umiStats
        Array[File?] umiPositionStats = sampleWorkflow.umiPositionStats
    }

    parameter_meta {
        sampleConfigFile: {description: "The samplesheet, including sample ids, library ids, readgroup ids and fastq file locations.",
                           category: "required"}
        outputDir: {description: "The directory the output should be written to.", category: "common"}
        bowtieIndexFiles: {description: "The bowtie index files.", category: "required"}
        platform: {description: "The platform used for sequencing.", category: "advanced"}
        gtfFiles: {description: "The GTF files containing the gene annotations to use for expression quantification.",
                   category: "required"}
        stranded: {description: "Whether or not the data is stranded: yes, no or reverse.", category: "common"}
        umiDeduplication: {description: "Whether or not UMI based deduplication should be performed.", category: "common"}
        umiSeparator: {description: "Seperator for UMI sequence, default with '_'", category: "advanced"}
        runMultiQC: {description: "Whether or not MultiQC should be run.", category: "advanced"}
        dockerImagesFile: {description: "A YAML file describing the docker image used for the tasks. The dockerImages.yml provided with the pipeline is recommended.",
                           category: "advanced"}
    }
}
