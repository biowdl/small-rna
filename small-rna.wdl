

workflow SmallRna {
    input {
        File sampleConfigFile
        String outputDir = "."
    }

    call common.YamlToJson as ConvertSampleConfig {
        input:
            yaml = sampleConfigFile,
            outputJson = outputDir + "/samples.json"
    }
    SampleConfig sampleConfig = read_json(ConvertSampleConfig.json)
    Array[Sample] allSamples = sampleConfig.samples
    output {

    }

}

task SampleConfigToFastQLists {
    input {
        File sampleConfig
    }

    command <<<
    python <<CODE
    import yaml

    sample_config = yaml.load("~{sampleConfig}")
    samples = sample_config.get("samples", [])

    CODE
    >>>
}