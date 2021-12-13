#!/bin/bash

export ES_HOME="VAL_ES_HOME"
export JAVA_VERSION="VAL_JAVA_VERSION"

export ES_LOG_DIR="${ES_HOME}/logs"
export ES_DATA_DIR="${ES_HOME}/data"
export ES_TMP_DIR="${ES_HOME}/tmp"

export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-armhf"
export ES_JAVA_HOME="${JAVA_HOME}"
export ES_JAVA_OPTS="-Djava.io.tmpdir=${ES_TMP_DIR} -Djna.tmpdir=${ES_TMP_DIR}"
export PATH="${PATH}:${ES_HOME}/bin"
