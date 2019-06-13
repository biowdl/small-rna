

workflow SmallRna {
    input {

    }

    call common.YamlToJson as ConvertSampleConfig {
        input:
            yaml = sampleConfigFile,
            outputJson = outputDir + "/samples.json"
    }
    SampleConfig sampleConfig = read_json(ConvertSampleConfig.json)
    Array[Sample] allSamples = flatten([samples, sampleConfig.samples])

    output {

    }

}