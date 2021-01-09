# ElasticStack images for ARM

This project aims to provide docker images that will run on ARM achitecture (like raspberry pi for example).

The docker images are built on a raspberry pi gitlab runner.

## Available apps

* Kibana v7.9.1
* ElasticSearch v7.9.1
* ElastAlert
* Elastic Indices Lifecyle : the [elastic-indices-lifecycle](https://gitlab.comwork.io/oss/elasticstack/elastic-indices-lifecycle)

# Git repositories

* main repo: https://gitlab.comwork.io/oss/elasticstack/elasticstack-arm
* github backup mirror: https://github.com/idrissneumann/elasticstack-arm
## Docker repositories

The images are available on docker hub:
* ElasticSearch: https://hub.docker.com/repository/docker/comworkio/elasticsearch
* Kibana: https://hub.docker.com/repository/docker/comworkio/kibana
* ElastAlert: https://hub.docker.com/r/comworkio/elastalert

Here's an example of docker-compose file to have an instance of ElasticSearch and Kibana on your raspberrypi: [here](./docker-compose-example.yml).
