#!/bin/bash

export JAVA_VERSION="VAL_JAVA_VERSION"
export ES_HOME="VAL_ES_HOME"
export ES_HOST="VAL_ES_HOST"
export ES_DISCOVERY_TYPE="VAL_ES_DISCOVERY_TYPE"
export ES_VERSION="VAL_ES_VERSION"
export ES_ARCH="VAL_ES_ARCH"
export ES_OS="VAL_ES_OS"
export ES_NODE_NAME="VAL_ES_NODE_NAME"
export ES_HEAP="VAL_ES_HEAP"
export ES_TRANSPORT_PORT="VAL_ES_TRANSPORT_PORT"
export ES_HTTP_PORT="VAL_ES_HTTP_PORT"
export ES_EXEC="VAL_ES_EXEC"

export ES_LOG_DIR="${ES_HOME}/logs"
export ES_DATA_DIR="${ES_HOME}/data"
export ES_TMP_DIR="${ES_HOME}/tmp"

export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-armhf"
export ES_JAVA_HOME="${JAVA_HOME}"
export ES_JAVA_OPTS="-Djava.io.tmpdir=${ES_TMP_DIR} -Djna.tmpdir=${ES_TMP_DIR}"
export PATH="${PATH}:${ES_HOME}/bin"
