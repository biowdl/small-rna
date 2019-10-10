Changelog
==========

<!--

Newest changes should be on top.

This document is user facing. Please word the changes in such a way
that users understand how the changes affect the new version.
-->
version 1.1.0
---------------------------
+ Update tasks so they pass the correct memory requirements to the 
  execution engine. Memory requirements are set on a per-task (not
  per-core) basis.
+ Allow using csv table format samplesheet as input format.
  
version 1.0.0
---------------------------
+ Update cutadapt version to 2.4
+ Allow more than one gtf/gff file for annotation. Set up inputs so each
  htseqcount run can be configured from the inputs.
+ Created a miRNA pipeline
+ Use name sorted bam for HTseq-count step
