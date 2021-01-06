#!/bin/sh

export ES_LOG_DIR="${ES_HOME}/logs"
export ES_DATA_DIR="${ES_HOME}/data"
export ES_TMP_DIR="${ES_HOME}/tmp"
export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-armhf"
export ES_JAVA_OPTS="-Djava.io.tmpdir=${ES_TMP_DIR} -Djna.tmpdir=${ES_TMP_DIR}"
export PATH="${PATH}:/usr/share/elasticsearch/bin"
