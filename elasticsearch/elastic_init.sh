#!/bin/bash

chown -R elasticsearch:elasticsearch "${ES_HOME}"
chmod -R 755 "${ES_HOME}"
su - elasticsearch -c /elastic_start.sh
