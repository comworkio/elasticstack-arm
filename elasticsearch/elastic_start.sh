#!/bin/bash

source /elastic_env.sh

mkdir -p "${ES_LOG_DIR}"
mkdir -p "${ES_DATA_DIR}"
mkdir -p "${ES_TMP_DIR}"

sudo chown -R elasticsearch:elasticsearch docker_data
sudo chmod -R 755 $ES_HOME

/usr/share/elasticsearch/es_start.sh
