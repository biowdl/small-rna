---
layout: default
title: Home
---

This pipeline can be used to process small RNA data (~20-60bp short reads)
 starting from FastQ files.
It will perform adapter clipping (using cutadapt), mapping (using bowtie) and expression
quantification (using HTSeq-Count).

This pipeline is part of [BioWDL](https://biowdl.github.io/)
developed by the SASC team at [Leiden University Medical Center](https://www.lumc.nl/).

## Usage
This pipeline can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```bash
java -jar cromwell-<version>.jar run -i inputs.json small-rna.wdl
```

### Dependency requirements and tool versions
Biowdl pipelines use docker images to ensure  reproducibility. This
means that biowdl pipelines will run on any system that has docker
installed. Alternatively they can be run with singularity.

For more advanced configuration of docker or singularity please check
the [cromwell documentation on containers](
https://cromwell.readthedocs.io/en/stable/tutorials/Containers/).

Images from [biocontainers](https://biocontainers.pro) are preferred for
biowdl pipelines. The list of default images for this pipeline can be
found in the default for the `dockerImages` input.

### Inputs
Inputs are provided through a JSON file. The minimally required inputs are
described below, but additional inputs are available.
A template containing all possible inputs can be generated using
Womtool as described in the
[WOMtool documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).
See [this page](/inputs.html) for some additional general notes and information
about pipeline inputs.

```JSON
{
  "SmallRna.bowtieIndexFiles": "A list of all files that belong to the bowtie index",
  "SmallRna.gtfFiles": "A list of structs containing the GTF Files and information about ID and feature attributes",
  "SmallRna.dockerImagesFile": "A file containing all the docker images used in the workflow. A default is provided as 'dockerImages.yml'.",
  "SmallRna.sampleConfigFile": "The sample configuration file. See below for more details.",
  "SmallRna.stranded": "The input for the stranded parameter of HtSeqCount. Default: 'no'"
}
```

#### Sample configuration
The sample configuration should be a YML file which adheres to the following
structure:
```YML
samples:
  - id: <sampleId>
    libraries:
      - id: <libId>
        readgroups:
          - id: <rgId>
            reads:
              R1: <Path to first-end FastQ file.>
              R1_md5: <MD5 checksum of first-end FastQ file.>
              R2: <Path to second-end FastQ file.>
              R2_md5: <MD5 checksum of second-end FastQ file.>
```
Replace the text between `< >` with appropriate values. MD5 values may be
omitted and R2 values may be omitted in the case of single-end data.
Multiple readgroups can be added per library and multiple libraries may be
given per sample.

#### Example

The following is an example of what an inputs JSON might look like:
```JSON
{
  "SmallRna.sampleConfigFile": "/samplesheets/PairedEnd.yml",
  "SmallRna.bowtieIndexFiles": [
    "/data/reference/bowtie/reference.1.ebwt",
    "/data/reference/bowtie/reference.2.ebwt",
    "/data/reference/bowtie/reference.3.ebwt",
    "/data/reference/bowtie/reference.4.ebwt",
    "/data/reference/bowtie/reference.rev.1.ebwt",
    "/data/reference/bowtie/reference.rev.2.ebwt"
  ],
  "SmallRna.gtfFiles": [
    {"path": "/data/ensembl.gtf",
      "idattr": "gene_id"},
    {"path": "/data/hsa.gff3",
      "featureType": "miRNA"}
  ],
  "SmallRna.sampleWorkflow.SampleWorkflow.QualityControl.adapterForward": "AGATCGGAAGAG",
  "SmallRna.sampleWorkflow.SampleWorkflow.QualityControl.adapterReverse": "GATCGTCGGACT",
  "SmallRna.dockerImagesFile": "dockerImages.yml"
}
```

And the associated sample configuration YML might look like this:
```YAML
samples:
  - id: patient1:
    libraries:
      - id: lib1:
        readgroups:
          - id: lane1:
            reads:
              R1: /home/user/data/patient1/R1.fq.gz
              R1_md5: /home/user/data/patient1/R1.fq.gz.md5
              R2: /home/user/data/patient1/R2.fq.gz
              R2_md5: /home/user/data/patient1/R2.fq.gz.md5
  - id: patient2:
    libraries:
      - id: lib1:
        readgroups:
          - id: lane1:
            reads:
              R1: /home/user/data/patient2/lane1_R1.fq.gz
              R1_md5: /home/user/data/patient2/lane1_R1.fq.gz.md5
              R2: /home/user/data/patient2/lane1_R2.fq.gz
              R2_md5: /home/user/data/patient2/lane1_R2.fq.gz.md5
          - id: lane2:
            reads:
              R1: /home/user/data/patient2/lane2_R1.fq.gz
              R1_md5: /home/user/data/patient2/lane2_R1.fq.gz.md5
              R2: /home/user/data/patient2/lane2_R2.fq.gz
              R2_md5: /home/user/data/patient2/lane2_R2.fq.gz.md5
```


### Output
This workflow will output the trimmed fastq files, bam files  and
count files in a separate folder per sample. 
It will also output a merged counts file in the output directory.

## Contact
<p>
  <!-- Obscure e-mail address for spammers -->
For any question about running this pipeline and feature requests, please use
the
<a href='https://github.com/biowdl/rna-seq/issues'>github issue tracker</a>
or contact
the SASC team
 directly at: 
<a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;'>
&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;</a>.
</p>
