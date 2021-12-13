#!/bin/bash

source /elastic_env.sh

mkdir -p "${ES_LOG_DIR}"
mkdir -p "${ES_DATA_DIR}"
mkdir -p "${ES_TMP_DIR}"

/usr/share/elasticsearch/es_start.sh
