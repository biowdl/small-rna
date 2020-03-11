---
layout: default
title: "Inputs: SmallRna"
---

# Inputs for SmallRna

The following is an overview of all available inputs in
SmallRna.


## Required inputs
<dl>
<dt id="SmallRna.bowtieIndexFiles"><a href="#SmallRna.bowtieIndexFiles">SmallRna.bowtieIndexFiles</a></dt>
<dd>
    <i>Array[File]+ </i><br />
    The bowtie index files.
</dd>
<dt id="SmallRna.dockerImagesFile"><a href="#SmallRna.dockerImagesFile">SmallRna.dockerImagesFile</a></dt>
<dd>
    <i>File </i><br />
    A YAML file describing the docker image used for the tasks. The dockerImages.yml provided with the pipeline is recommended.
</dd>
<dt id="SmallRna.gtfFiles"><a href="#SmallRna.gtfFiles">SmallRna.gtfFiles</a></dt>
<dd>
    <i>Array[struct(featureType : String?, idattr : String?, path : File)]+ </i><br />
    The GTF files containing the gene annotations to use for expression quantification.
</dd>
<dt id="SmallRna.sampleConfigFile"><a href="#SmallRna.sampleConfigFile">SmallRna.sampleConfigFile</a></dt>
<dd>
    <i>File </i><br />
    The samplesheet, including sample ids, library ids, readgroup ids and fastq file locations.
</dd>
</dl>

## Other common inputs
<dl>
<dt id="SmallRna.outputDir"><a href="#SmallRna.outputDir">SmallRna.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    The directory the output should be written to.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.adapterForward"><a href="#SmallRna.sampleWorkflow.QualityControl.adapterForward">SmallRna.sampleWorkflow.QualityControl.adapterForward</a></dt>
<dd>
    <i>String? </i><i>&mdash; Default:</i> <code>"AGATCGGAAGAG"</code><br />
    The adapter to be removed from the reads first or single end reads.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.adapterReverse"><a href="#SmallRna.sampleWorkflow.QualityControl.adapterReverse">SmallRna.sampleWorkflow.QualityControl.adapterReverse</a></dt>
<dd>
    <i>String? </i><i>&mdash; Default:</i> <code>"AGATCGGAAGAG"</code><br />
    The adapter to be removed from the reads second end reads.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.contaminations"><a href="#SmallRna.sampleWorkflow.QualityControl.contaminations">SmallRna.sampleWorkflow.QualityControl.contaminations</a></dt>
<dd>
    <i>Array[String]+? </i><br />
    Contaminants/adapters to be removed from the reads.
</dd>
<dt id="SmallRna.sampleWorkflow.samtoolsSort.outputBamPath"><a href="#SmallRna.sampleWorkflow.samtoolsSort.outputBamPath">SmallRna.sampleWorkflow.samtoolsSort.outputBamPath</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"namesorted.bam"</code><br />
    The location the sorted BAM file should be written to.
</dd>
<dt id="SmallRna.stranded"><a href="#SmallRna.stranded">SmallRna.stranded</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"no"</code><br />
    Whether or not the data is stranded: yes, no or reverse.
</dd>
<dt id="SmallRna.umiDeduplication"><a href="#SmallRna.umiDeduplication">SmallRna.umiDeduplication</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not UMI based deduplication should be performed.
</dd>
</dl>

## Advanced inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="SmallRna.CollectColumns.additionalAttributes"><a href="#SmallRna.CollectColumns.additionalAttributes">SmallRna.CollectColumns.additionalAttributes</a></dt>
<dd>
    <i>Array[String]? </i><br />
    Equivalent to the -a option of collect-columns.
</dd>
<dt id="SmallRna.CollectColumns.dockerImage"><a href="#SmallRna.CollectColumns.dockerImage">SmallRna.CollectColumns.dockerImage</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"quay.io/biocontainers/collect-columns:0.2.0--py_1"</code><br />
    The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="SmallRna.CollectColumns.featureAttribute"><a href="#SmallRna.CollectColumns.featureAttribute">SmallRna.CollectColumns.featureAttribute</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to the -F option of collect-columns.
</dd>
<dt id="SmallRna.CollectColumns.header"><a href="#SmallRna.CollectColumns.header">SmallRna.CollectColumns.header</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to the -H flag of collect-columns.
</dd>
<dt id="SmallRna.CollectColumns.referenceGtf"><a href="#SmallRna.CollectColumns.referenceGtf">SmallRna.CollectColumns.referenceGtf</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to the -g option of collect-columns.
</dd>
<dt id="SmallRna.CollectColumns.separator"><a href="#SmallRna.CollectColumns.separator">SmallRna.CollectColumns.separator</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to the -s option of collect-columns.
</dd>
<dt id="SmallRna.ConvertDockerImagesFile.dockerImage"><a href="#SmallRna.ConvertDockerImagesFile.dockerImage">SmallRna.ConvertDockerImagesFile.dockerImage</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"quay.io/biocontainers/biowdl-input-converter:0.2.1--py_0"</code><br />
    The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="SmallRna.ConvertSampleConfig.checkFileMd5sums"><a href="#SmallRna.ConvertSampleConfig.checkFileMd5sums">SmallRna.ConvertSampleConfig.checkFileMd5sums</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not the MD5 sums of the files mentioned in the samplesheet should be checked.
</dd>
<dt id="SmallRna.ConvertSampleConfig.dockerImage"><a href="#SmallRna.ConvertSampleConfig.dockerImage">SmallRna.ConvertSampleConfig.dockerImage</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"quay.io/biocontainers/biowdl-input-converter:0.2.1--py_0"</code><br />
    The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="SmallRna.ConvertSampleConfig.old"><a href="#SmallRna.ConvertSampleConfig.old">SmallRna.ConvertSampleConfig.old</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Whether or not the old samplesheet format should be used.
</dd>
<dt id="SmallRna.ConvertSampleConfig.outputFile"><a href="#SmallRna.ConvertSampleConfig.outputFile">SmallRna.ConvertSampleConfig.outputFile</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"samplesheet.json"</code><br />
    The location the JSON representation of the samplesheet should be written to.
</dd>
<dt id="SmallRna.ConvertSampleConfig.skipFileCheck"><a href="#SmallRna.ConvertSampleConfig.skipFileCheck">SmallRna.ConvertSampleConfig.skipFileCheck</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Whether or not the existance of the files mentioned in the samplesheet should be checked.
</dd>
<dt id="SmallRna.multiqcTask.clConfig"><a href="#SmallRna.multiqcTask.clConfig">SmallRna.multiqcTask.clConfig</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--cl-config` option.
</dd>
<dt id="SmallRna.multiqcTask.comment"><a href="#SmallRna.multiqcTask.comment">SmallRna.multiqcTask.comment</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--comment` option.
</dd>
<dt id="SmallRna.multiqcTask.config"><a href="#SmallRna.multiqcTask.config">SmallRna.multiqcTask.config</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to MultiQC's `--config` option.
</dd>
<dt id="SmallRna.multiqcTask.dataDir"><a href="#SmallRna.multiqcTask.dataDir">SmallRna.multiqcTask.dataDir</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--data-dir` flag.
</dd>
<dt id="SmallRna.multiqcTask.dataFormat"><a href="#SmallRna.multiqcTask.dataFormat">SmallRna.multiqcTask.dataFormat</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--data-format` option.
</dd>
<dt id="SmallRna.multiqcTask.dirs"><a href="#SmallRna.multiqcTask.dirs">SmallRna.multiqcTask.dirs</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--dirs` flag.
</dd>
<dt id="SmallRna.multiqcTask.dirsDepth"><a href="#SmallRna.multiqcTask.dirsDepth">SmallRna.multiqcTask.dirsDepth</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to MultiQC's `--dirs-depth` option.
</dd>
<dt id="SmallRna.multiqcTask.exclude"><a href="#SmallRna.multiqcTask.exclude">SmallRna.multiqcTask.exclude</a></dt>
<dd>
    <i>Array[String]+? </i><br />
    Equivalent to MultiQC's `--exclude` option.
</dd>
<dt id="SmallRna.multiqcTask.export"><a href="#SmallRna.multiqcTask.export">SmallRna.multiqcTask.export</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--export` flag.
</dd>
<dt id="SmallRna.multiqcTask.fileList"><a href="#SmallRna.multiqcTask.fileList">SmallRna.multiqcTask.fileList</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to MultiQC's `--file-list` option.
</dd>
<dt id="SmallRna.multiqcTask.fileName"><a href="#SmallRna.multiqcTask.fileName">SmallRna.multiqcTask.fileName</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--filename` option.
</dd>
<dt id="SmallRna.multiqcTask.flat"><a href="#SmallRna.multiqcTask.flat">SmallRna.multiqcTask.flat</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--flat` flag.
</dd>
<dt id="SmallRna.multiqcTask.force"><a href="#SmallRna.multiqcTask.force">SmallRna.multiqcTask.force</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--force` flag.
</dd>
<dt id="SmallRna.multiqcTask.ignore"><a href="#SmallRna.multiqcTask.ignore">SmallRna.multiqcTask.ignore</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--ignore` option.
</dd>
<dt id="SmallRna.multiqcTask.ignoreSamples"><a href="#SmallRna.multiqcTask.ignoreSamples">SmallRna.multiqcTask.ignoreSamples</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--ignore-samples` option.
</dd>
<dt id="SmallRna.multiqcTask.ignoreSymlinks"><a href="#SmallRna.multiqcTask.ignoreSymlinks">SmallRna.multiqcTask.ignoreSymlinks</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--ignore-symlinks` flag.
</dd>
<dt id="SmallRna.multiqcTask.interactive"><a href="#SmallRna.multiqcTask.interactive">SmallRna.multiqcTask.interactive</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to MultiQC's `--interactive` flag.
</dd>
<dt id="SmallRna.multiqcTask.lint"><a href="#SmallRna.multiqcTask.lint">SmallRna.multiqcTask.lint</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--lint` flag.
</dd>
<dt id="SmallRna.multiqcTask.megaQCUpload"><a href="#SmallRna.multiqcTask.megaQCUpload">SmallRna.multiqcTask.megaQCUpload</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Opposite to MultiQC's `--no-megaqc-upload` flag.
</dd>
<dt id="SmallRna.multiqcTask.memory"><a href="#SmallRna.multiqcTask.memory">SmallRna.multiqcTask.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SmallRna.multiqcTask.module"><a href="#SmallRna.multiqcTask.module">SmallRna.multiqcTask.module</a></dt>
<dd>
    <i>Array[String]+? </i><br />
    Equivalent to MultiQC's `--module` option.
</dd>
<dt id="SmallRna.multiqcTask.noDataDir"><a href="#SmallRna.multiqcTask.noDataDir">SmallRna.multiqcTask.noDataDir</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--no-data-dir` flag.
</dd>
<dt id="SmallRna.multiqcTask.pdf"><a href="#SmallRna.multiqcTask.pdf">SmallRna.multiqcTask.pdf</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--pdf` flag.
</dd>
<dt id="SmallRna.multiqcTask.sampleNames"><a href="#SmallRna.multiqcTask.sampleNames">SmallRna.multiqcTask.sampleNames</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to MultiQC's `--sample-names` option.
</dd>
<dt id="SmallRna.multiqcTask.tag"><a href="#SmallRna.multiqcTask.tag">SmallRna.multiqcTask.tag</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--tag` option.
</dd>
<dt id="SmallRna.multiqcTask.template"><a href="#SmallRna.multiqcTask.template">SmallRna.multiqcTask.template</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--template` option.
</dd>
<dt id="SmallRna.multiqcTask.title"><a href="#SmallRna.multiqcTask.title">SmallRna.multiqcTask.title</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to MultiQC's `--title` option.
</dd>
<dt id="SmallRna.multiqcTask.zipDataDir"><a href="#SmallRna.multiqcTask.zipDataDir">SmallRna.multiqcTask.zipDataDir</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to MultiQC's `--zip-data-dir` flag.
</dd>
<dt id="SmallRna.platform"><a href="#SmallRna.platform">SmallRna.platform</a></dt>
<dd>
    <i>String? </i><i>&mdash; Default:</i> <code>"illumina"</code><br />
    The platform used for sequencing.
</dd>
<dt id="SmallRna.runMultiQC"><a href="#SmallRna.runMultiQC">SmallRna.runMultiQC</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>if outputDir == "." then false else true</code><br />
    Whether or not MultiQC should be run.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.allowContain"><a href="#SmallRna.sampleWorkflow.Bowtie.allowContain">SmallRna.sampleWorkflow.Bowtie.allowContain</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to bowtie's `--allow-contain` flag.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.best"><a href="#SmallRna.sampleWorkflow.Bowtie.best">SmallRna.sampleWorkflow.Bowtie.best</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to bowtie's `--best` flag.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.k"><a href="#SmallRna.sampleWorkflow.Bowtie.k">SmallRna.sampleWorkflow.Bowtie.k</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to bowtie's `-k` option.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.memory"><a href="#SmallRna.sampleWorkflow.Bowtie.memory">SmallRna.sampleWorkflow.Bowtie.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"16G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.picardXmx"><a href="#SmallRna.sampleWorkflow.Bowtie.picardXmx">SmallRna.sampleWorkflow.Bowtie.picardXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the picard (used for sorting the output). Should be lower than `memory` to accommodate JVM overhead and bowtie's memory usage.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.seedlen"><a href="#SmallRna.sampleWorkflow.Bowtie.seedlen">SmallRna.sampleWorkflow.Bowtie.seedlen</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to bowtie's `--seedlen` option.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.seedmms"><a href="#SmallRna.sampleWorkflow.Bowtie.seedmms">SmallRna.sampleWorkflow.Bowtie.seedmms</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to bowtie's `--seedmms` option.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.strata"><a href="#SmallRna.sampleWorkflow.Bowtie.strata">SmallRna.sampleWorkflow.Bowtie.strata</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to bowtie's `--strata` flag.
</dd>
<dt id="SmallRna.sampleWorkflow.Bowtie.threads"><a href="#SmallRna.sampleWorkflow.Bowtie.threads">SmallRna.sampleWorkflow.Bowtie.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of threads to use.
</dd>
<dt id="SmallRna.sampleWorkflow.HTSeqCount.additionalAttributes"><a href="#SmallRna.sampleWorkflow.HTSeqCount.additionalAttributes">SmallRna.sampleWorkflow.HTSeqCount.additionalAttributes</a></dt>
<dd>
    <i>Array[String] </i><i>&mdash; Default:</i> <code>[]</code><br />
    Equivalent to the --additional-attr option of htseq-count.
</dd>
<dt id="SmallRna.sampleWorkflow.HTSeqCount.format"><a href="#SmallRna.sampleWorkflow.HTSeqCount.format">SmallRna.sampleWorkflow.HTSeqCount.format</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"bam"</code><br />
    Equivalent to the -f option of htseq-count.
</dd>
<dt id="SmallRna.sampleWorkflow.HTSeqCount.memory"><a href="#SmallRna.sampleWorkflow.HTSeqCount.memory">SmallRna.sampleWorkflow.HTSeqCount.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"40G"</code><br />
    The amount of memory the job requires in GB.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.bwa"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.bwa">SmallRna.sampleWorkflow.QualityControl.Cutadapt.bwa</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --bwa flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.colorspace"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.colorspace">SmallRna.sampleWorkflow.QualityControl.Cutadapt.colorspace</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --colorspace flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.cores"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.cores">SmallRna.sampleWorkflow.QualityControl.Cutadapt.cores</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.cut"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.cut">SmallRna.sampleWorkflow.QualityControl.Cutadapt.cut</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --cut option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.discardTrimmed"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.discardTrimmed">SmallRna.sampleWorkflow.QualityControl.Cutadapt.discardTrimmed</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --quality-cutoff option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.discardUntrimmed"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.discardUntrimmed">SmallRna.sampleWorkflow.QualityControl.Cutadapt.discardUntrimmed</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --discard-untrimmed option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.doubleEncode"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.doubleEncode">SmallRna.sampleWorkflow.QualityControl.Cutadapt.doubleEncode</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --double-encode flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.errorRate"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.errorRate">SmallRna.sampleWorkflow.QualityControl.Cutadapt.errorRate</a></dt>
<dd>
    <i>Float? </i><br />
    Equivalent to cutadapt's --error-rate option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.front"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.front">SmallRna.sampleWorkflow.QualityControl.Cutadapt.front</a></dt>
<dd>
    <i>Array[String] </i><i>&mdash; Default:</i> <code>[]</code><br />
    A list of 5' ligated adapter sequences to be cut from the given first or single end fastq file.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.frontRead2"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.frontRead2">SmallRna.sampleWorkflow.QualityControl.Cutadapt.frontRead2</a></dt>
<dd>
    <i>Array[String] </i><i>&mdash; Default:</i> <code>[]</code><br />
    A list of 5' ligated adapter sequences to be cut from the given second end fastq file.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.infoFilePath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.infoFilePath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.infoFilePath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --info-file option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.interleaved"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.interleaved">SmallRna.sampleWorkflow.QualityControl.Cutadapt.interleaved</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --interleaved flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.length"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.length">SmallRna.sampleWorkflow.QualityControl.Cutadapt.length</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.lengthTag"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.lengthTag">SmallRna.sampleWorkflow.QualityControl.Cutadapt.lengthTag</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --length-tag option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.maq"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.maq">SmallRna.sampleWorkflow.QualityControl.Cutadapt.maq</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --maq flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.maskAdapter"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.maskAdapter">SmallRna.sampleWorkflow.QualityControl.Cutadapt.maskAdapter</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --mask-adapter flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.matchReadWildcards"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.matchReadWildcards">SmallRna.sampleWorkflow.QualityControl.Cutadapt.matchReadWildcards</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --match-read-wildcards flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.maximumLength"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.maximumLength">SmallRna.sampleWorkflow.QualityControl.Cutadapt.maximumLength</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --maximum-length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.maxN"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.maxN">SmallRna.sampleWorkflow.QualityControl.Cutadapt.maxN</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --max-n option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.memory"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.memory">SmallRna.sampleWorkflow.QualityControl.Cutadapt.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.minimumLength"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.minimumLength">SmallRna.sampleWorkflow.QualityControl.Cutadapt.minimumLength</a></dt>
<dd>
    <i>Int? </i><i>&mdash; Default:</i> <code>2</code><br />
    Equivalent to cutadapt's --minimum-length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.nextseqTrim"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.nextseqTrim">SmallRna.sampleWorkflow.QualityControl.Cutadapt.nextseqTrim</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --nextseq-trim option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.noIndels"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.noIndels">SmallRna.sampleWorkflow.QualityControl.Cutadapt.noIndels</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --no-indels flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.noMatchAdapterWildcards"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.noMatchAdapterWildcards">SmallRna.sampleWorkflow.QualityControl.Cutadapt.noMatchAdapterWildcards</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --no-match-adapter-wildcards flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.noTrim"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.noTrim">SmallRna.sampleWorkflow.QualityControl.Cutadapt.noTrim</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --no-trim flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.noZeroCap"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.noZeroCap">SmallRna.sampleWorkflow.QualityControl.Cutadapt.noZeroCap</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --no-zero-cap flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.overlap"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.overlap">SmallRna.sampleWorkflow.QualityControl.Cutadapt.overlap</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --overlap option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.pairFilter"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.pairFilter">SmallRna.sampleWorkflow.QualityControl.Cutadapt.pairFilter</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --pair-filter option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.prefix"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.prefix">SmallRna.sampleWorkflow.QualityControl.Cutadapt.prefix</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --prefix option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.qualityBase"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.qualityBase">SmallRna.sampleWorkflow.QualityControl.Cutadapt.qualityBase</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --quality-base option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.qualityCutoff"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.qualityCutoff">SmallRna.sampleWorkflow.QualityControl.Cutadapt.qualityCutoff</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --quality-cutoff option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.restFilePath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.restFilePath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.restFilePath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --rest-file option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.stripF3"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.stripF3">SmallRna.sampleWorkflow.QualityControl.Cutadapt.stripF3</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --strip-f3 flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.stripSuffix"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.stripSuffix">SmallRna.sampleWorkflow.QualityControl.Cutadapt.stripSuffix</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --strip-suffix option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.suffix"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.suffix">SmallRna.sampleWorkflow.QualityControl.Cutadapt.suffix</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --suffix option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.times"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.times">SmallRna.sampleWorkflow.QualityControl.Cutadapt.times</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to cutadapt's --times option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooLongOutputPath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooLongOutputPath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooLongOutputPath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --too-long-output option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooLongPairedOutputPath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooLongPairedOutputPath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooLongPairedOutputPath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --too-long-paired-output option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooShortOutputPath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooShortOutputPath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooShortOutputPath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --too-short-output option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooShortPairedOutputPath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooShortPairedOutputPath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.tooShortPairedOutputPath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --too-short-paired-output option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.trimN"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.trimN">SmallRna.sampleWorkflow.QualityControl.Cutadapt.trimN</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --trim-n flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.untrimmedOutputPath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.untrimmedOutputPath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.untrimmedOutputPath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --untrimmed-output option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.untrimmedPairedOutputPath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.untrimmedPairedOutputPath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.untrimmedPairedOutputPath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --untrimmed-paired-output option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.wildcardFilePath"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.wildcardFilePath">SmallRna.sampleWorkflow.QualityControl.Cutadapt.wildcardFilePath</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to cutadapt's --wildcard-file option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.Z"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.Z">SmallRna.sampleWorkflow.QualityControl.Cutadapt.Z</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to cutadapt's -Z flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.Cutadapt.zeroCap"><a href="#SmallRna.sampleWorkflow.QualityControl.Cutadapt.zeroCap">SmallRna.sampleWorkflow.QualityControl.Cutadapt.zeroCap</a></dt>
<dd>
    <i>Boolean? </i><br />
    Equivalent to cutadapt's --zero-cap flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.adapters"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.adapters">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.adapters</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --adapters option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.casava"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.casava">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.casava</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --casava flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.contaminants"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.contaminants">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.contaminants</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --contaminants option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.dir"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.dir">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.dir</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --dir option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.extract"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.extract">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.extract</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --extract flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.format"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.format">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.format</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --format option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.kmers"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.kmers">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.kmers</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --kmers option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.limits"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.limits">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.limits</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --limits option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.minLength"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.minLength">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.minLength</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --min_length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.nano"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.nano">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.nano</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nano flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.noFilter"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.noFilter">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.noFilter</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nofilter flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.nogroup"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.nogroup">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.nogroup</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nogroup flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1.threads"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1.threads">SmallRna.sampleWorkflow.QualityControl.FastqcRead1.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.adapters"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.adapters">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.adapters</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --adapters option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.casava"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.casava">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.casava</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --casava flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.contaminants"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.contaminants">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.contaminants</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --contaminants option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.dir"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.dir">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.dir</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --dir option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.extract"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.extract">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.extract</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --extract flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.format"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.format">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.format</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --format option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.kmers"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.kmers">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.kmers</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --kmers option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.limits"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.limits">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.limits</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --limits option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.minLength"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.minLength">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.minLength</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --min_length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.nano"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.nano">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.nano</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nano flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.noFilter"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.noFilter">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.noFilter</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nofilter flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.nogroup"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.nogroup">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.nogroup</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nogroup flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.threads"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.threads">SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.adapters"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.adapters">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.adapters</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --adapters option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.casava"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.casava">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.casava</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --casava flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.contaminants"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.contaminants">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.contaminants</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --contaminants option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.dir"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.dir">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.dir</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --dir option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.extract"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.extract">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.extract</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --extract flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.format"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.format">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.format</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --format option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.kmers"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.kmers">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.kmers</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --kmers option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.limits"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.limits">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.limits</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --limits option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.minLength"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.minLength">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.minLength</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --min_length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.nano"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.nano">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.nano</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nano flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.noFilter"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.noFilter">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.noFilter</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nofilter flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.nogroup"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.nogroup">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.nogroup</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nogroup flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2.threads"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2.threads">SmallRna.sampleWorkflow.QualityControl.FastqcRead2.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.adapters"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.adapters">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.adapters</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --adapters option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.casava"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.casava">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.casava</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --casava flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.contaminants"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.contaminants">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.contaminants</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --contaminants option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.dir"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.dir">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.dir</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --dir option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.extract"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.extract">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.extract</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --extract flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.format"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.format">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.format</a></dt>
<dd>
    <i>String? </i><br />
    Equivalent to fastqc's --format option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.kmers"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.kmers">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.kmers</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --kmers option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.limits"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.limits">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.limits</a></dt>
<dd>
    <i>File? </i><br />
    Equivalent to fastqc's --limits option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.minLength"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.minLength">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.minLength</a></dt>
<dd>
    <i>Int? </i><br />
    Equivalent to fastqc's --min_length option.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.nano"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.nano">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.nano</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nano flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.noFilter"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.noFilter">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.noFilter</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nofilter flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.nogroup"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.nogroup">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.nogroup</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>false</code><br />
    Equivalent to fastqc's --nogroup flag.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.threads"><a href="#SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.threads">SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.threads</a></dt>
<dd>
    <i>Int </i><i>&mdash; Default:</i> <code>1</code><br />
    The number of cores to use.
</dd>
<dt id="SmallRna.sampleWorkflow.QualityControl.runAdapterClipping"><a href="#SmallRna.sampleWorkflow.QualityControl.runAdapterClipping">SmallRna.sampleWorkflow.QualityControl.runAdapterClipping</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>defined(adapterForward) || defined(adapterReverse) || length(select_first([contaminations, []])) > 0</code><br />
    Whether or not adapters should be removed from the reads.
</dd>
<dt id="SmallRna.sampleWorkflow.samtoolsMerge.force"><a href="#SmallRna.sampleWorkflow.samtoolsMerge.force">SmallRna.sampleWorkflow.samtoolsMerge.force</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to samtools merge's `-f` flag.
</dd>
<dt id="SmallRna.sampleWorkflow.umiDedup.memory"><a href="#SmallRna.sampleWorkflow.umiDedup.memory">SmallRna.sampleWorkflow.umiDedup.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"20G"</code><br />
    The amount of memory required for the task.
</dd>
</dl>
</details>





## Do not set these inputs!
The following inputs should ***not*** be set, even though womtool may
show them as being available inputs.

* SmallRna.sampleWorkflow.QualityControl.FastqcRead1.NoneFile
* SmallRna.sampleWorkflow.QualityControl.FastqcRead1.NoneArray
* SmallRna.sampleWorkflow.QualityControl.FastqcRead2.NoneFile
* SmallRna.sampleWorkflow.QualityControl.FastqcRead2.NoneArray
* SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.NoneFile
* SmallRna.sampleWorkflow.QualityControl.FastqcRead1After.NoneArray
* SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.NoneFile
* SmallRna.sampleWorkflow.QualityControl.FastqcRead2After.NoneArray
* SmallRna.multiqcTask.finished
* SmallRna.multiqcTask.dependencies
