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
import "tasks/collect-columns.wdl" as collect_columns

workflow SmallRna {
    input {
        File sampleConfigFile
        String outputDir = "."
        Array[File]+ bowtieIndexFiles
        String? platform = "illumina"
        Array[File]+ gtfFiles
        String stranded = "no"
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

    call SampleConfigToSampleReadgroupLists as ConvertSampleConfig {
        input:
            yaml = sampleConfigFile,
            outputJson = outputDir + "/samples.json"
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
                dockerImages = dockerImages
        }
    }

    call collect_columns.CollectColumns as CollectColumns {
        input:
            inputTables = flatten(sampleWorkflow.countTables),
            outputPath = outputDir + "/merged_counts.tsv",
            featureColumn = 0,
            valueColumn = 1
    }

    if (runMultiQC) {
        call multiqc.MultiQC as multiqcTask {
            input:
                # Multiqc will only run if these files are created.
                finished = sampleWorkflow.finished,
                outDir = outputDir,
                analysisDirectory = outputDir,
                dockerImage = dockerImages["multiqc"]
        }
    }

    output {
        File countTable = CollectColumns.outputTable
        Array[File] countTables = flatten(sampleWorkflow.countTables)
        Array[File] bamFiles = sampleWorkflow.bam
        Array[File] bamIndexes = sampleWorkflow.bamIndex
        Array[File] qcReports = flatten(sampleWorkflow.qcReports)
    }
}

task SampleConfigToSampleReadgroupLists {
    input {
        File yaml
        String outputJson = "samples.json"
        String dockerImage = "biowdl/pyyaml:3.13-py37-slim"
    }

    command <<<
        set -e
        mkdir -p $(dirname ~{outputJson})
        python <<CODE
        import json
        import yaml
        with open("~{yaml}", "r") as input_yaml:
            sample_config = yaml.load(input_yaml)

        sample_rg_lists = []
        for sample in sample_config["samples"]:
            new_sample = {"readgroups": [], "id": sample['id']}
            for library in sample["libraries"]:
                for readgroup in library["readgroups"]:
                    new_readgroup = {'lib_id': library['id'], 'id': readgroup['id']}
                    # Having a nested "reads" struct does not make any sense.
                    new_readgroup.update(readgroup["reads"])
                    new_sample['readgroups'].append(new_readgroup)
            sample_rg_lists.append(new_sample)
        sample_mod_config = {"samples": sample_rg_lists}
        with open("~{outputJson}", "w") as output_json:
            json.dump(sample_mod_config, output_json)
        CODE
    >>>

    output {
        File json = outputJson
    }

    runtime {
        docker: dockerImage
    }
}