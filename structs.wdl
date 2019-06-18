version 1.0

import "tasks/common.wdl" as common

struct Readgroup {
    String id
    String lib_id
    FastqPair reads
}

struct Sample {
    String id
    Array[Readgroup] readgroups
}

struct SampleConfig {
    Array[Sample] samples
}

