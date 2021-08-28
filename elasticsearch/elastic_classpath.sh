#!/bin/bash

set_es_classpath() {
  ES_CLASSPATH=""
  for jar in "${ES_HOME}"/lib/*.jar; do
    ES_CLASSPATH="${ES_CLASSPATH}:${jar}"
  done
  export ES_CLASSPATH="${ES_HOME}/lib/*:${ES_CLASSPATH}"
}
