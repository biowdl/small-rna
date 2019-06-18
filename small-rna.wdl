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
import "sample.wdl" as SampleWorkflow

workflow SmallRna {
    input {
        File sampleConfigFile
        String outputDir = "."
        Array[File] bowtieIndexFiles
        String? platform = "illumina"
        Array[File] gtfFiles
    }

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
                gtfFiles = gtfFiles
        }
    }

    output {
        Array[File] countTables = flatten(sampleWorkflow.countTables)
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
        print(sample_mod_config)
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