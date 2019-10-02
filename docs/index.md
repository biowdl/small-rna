---
layout: default
title: Home
---

This pipeline can be used to process small RNAs (with a transcipt length of 20-60bp)
 starting from FastQ files.
It will perform quality control (using FastQC and MultiQC), adapter clipping (using cutadapt), mapping (using bowtie) and expression
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

##### CSV Format
The sample configuration can be given as a csv file with the following 
columns: sample, library, readgroup, R1, R1_md5, R2, R2_md5.

column name | function
---|---
sample | sample ID
library | library ID. These are the DNA libraries that are sequenced. Usually there is only one library per sample
readgroup | readgroup ID. Usually a library is sequenced on multiple lanes in the sequencer, which gives multiple fastq files. Each readgroup pair should have an ID.
R1| The fastq file containing the forward reads 
R1_md5 | Optional: md5sum for the R1 file.
R2| Optional: The fastq file containing the reverse reads
R2_md5| Optional: md5sum for the R2 file

The easiest way to create a samplesheet is to use a spreadsheet program
such as LibreOffice Calc or Microsoft Excel, and create a table:

sample | library | read | R1 | R1_md5 | R2 | R2_md5
-------|---------|------|----|--------|----|-------
sample1|lib1|rg1|data/s1-l1-rg1-r1.fastq|||
sample2|lib1|rg1|data/s1-l1-rg1-r2.fastq|||

NOTE: R1_md5, R2 and R2_md5 are optional do not have to be filled.

After creating the table in a spreadsheet program it can be saved in 
csv format.
 
##### YAML format
The sample configuration can also be a YML file which adheres to the following
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

And the associated samplesheet might look like this:

sample | library | read | R1 | R1_md5 | R2 | R2_md5
-------|---------|------|----|--------|----|-------
patient1|lib1|lane1|/home/user/data/patient1/R1.fq.gz|181a657e3f9c3cde2d3bb14ee7e894a3|/home/user/data/patient1/R2.fq.gz|ebe473b62926dcf6b38548851715820e
patient2|lib1|lane1|/home/user/data/patient2/lane1_R1.fq.gz|7e79b87d95573b06ff2c5e49508e9dbf|/home/user/data/patient2/lane1_R2.fq.gz|dc2776dc3a07c4f468455bae1a8ff872
patient2|lib1|lane2|/home/user/data/patient2/lane2_R1.fq.gz|18e9b2fef67f6c69396760c09af8e778|/home/user/data/patient2/lane2_R2.fq.gz|72209cc64510827bc3f849bab00dfe7d

Saved as csv format it will look like this.
```csv
"sample","library","read","R1","R1_md5","R2","R2_md5"
"patient1","lib1","lane1","/home/user/data/patient1/R1.fq.gz","181a657e3f9c3cde2d3bb14ee7e894a3","/home/user/data/patient1/R2.fq.gz","ebe473b62926dcf6b38548851715820e"
"patient2","lib1","lane1","/home/user/data/patient2/lane1_R1.fq.gz","7e79b87d95573b06ff2c5e49508e9dbf","/home/user/data/patient2/lane1_R2.fq.gz","dc2776dc3a07c4f468455bae1a8ff872"
"patient2","lib1","lane2","/home/user/data/patient2/lane2_R1.fq.gz","18e9b2fef67f6c69396760c09af8e778","/home/user/data/patient2/lane2_R2.fq.gz","72209cc64510827bc3f849bab00dfe7d"
```
The pipeline also supports tab- and ;-delimited files.

### Output
This workflow will output the trimmed fastq files, bam files  and
count files in a separate folder per sample. 
It will also output a merged counts file in the output directory.

## Contact
<p>
  <!-- Obscure e-mail address for spammers -->
For any question about running this pipeline and feature requests, please use
the
<a href='https://github.com/biowdl/small-rna/issues'>github issue tracker</a>
or contact
the SASC team
 directly at: 
<a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;'>
&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;</a>.
</p>
