#!/bin/bash

export ES_LOG_DIR="${ES_HOME}/logs"
export ES_DATA_DIR="${ES_HOME}/data"
export ES_TMP_DIR="${ES_HOME}/tmp"

if [[ $JAVA_VERSION =~ ^1\.[0-9]+\.*$ ]]; then
  jversion="${JAVA_VERSION}"
elif [[ $JAVA_VERSION =~ ^[0-9]+$ ]]
  jversion="1.${JAVA_VERSION}.0"
else
  echo "Bad java version: ${JAVA_VERSION}" >&2
  exit 1
fi

export JAVA_HOME="/usr/lib/jvm/java-${jversion}-openjdk-armhf"
export ES_JAVA_HOME="${JAVA_HOME}"
export ES_JAVA_OPTS="-Djava.io.tmpdir=${ES_TMP_DIR} -Djna.tmpdir=${ES_TMP_DIR} -Des.insecure.allow.root=true"
export PATH="${PATH}:${ES_HOME}/bin"

mkdir -p "${ES_LOG_DIR}"
mkdir -p "${ES_DATA_DIR}"
mkdir -p "${ES_TMP_DIR}"
