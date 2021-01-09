#!/bin/bash

source /kibana_env.sh

sed -i "s/ES_PROTO/${ES_PROTO}/g;s/ES_HOST/${ES_HOST}/g;s/ES_PORT/${ES_PORT}/g;s/KIBANA_HOST/${SERVER_HOST}/g" "${KIBANA_HOME}/config/kibana.yml"

/usr/share/kibana/kibana_start.sh
