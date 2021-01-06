FROM balenalib/raspberrypi3-debian:latest

ENV ES_VERSION=7.9.1 \
    ES_OS=linux \
    ES_ARCH=x86_64 \
    ES_EXEC=elasticsearch \
    ES_HOST=0.0.0.0 \
    ES_NODE_NAME=elasticsearch \
    ES_DISCOVERY_TYPE=single-node \
    ES_HEAP=2g \
    ES_TRANSPORT_PORT=9300 \
    ES_HTTP_PORT=9200 \
    JAVA_VERSION=11 \
    ES_HOME=/usr/share/elasticsearch

COPY ./elastic_env.sh /

RUN chmod +x /elastic_env.sh && \
  apt-get update && \
  apt-get -qy install bash curl ca-certificates openjdk-$JAVA_VERSION-jdk openjdk-$JAVA_VERSION-jre telnet net-tools && \
  curl -fsSL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION-$ES_OS-$ES_ARCH.tar.gz -o elasticsearch.tgz && \
  tar xvzf elasticsearch.tgz && \
  mv elasticsearch-$ES_VERSION $ES_HOME && \
  rm -rf elasticsearch.tgz && \
  sed -i "s/Xms1g/Xms$ES_HEAP/g;s/Xmx1g/Xmx$ES_HEAP/g" $ES_HOME/config/jvm.options && \
  echo $ES_EXEC -E node.name=$ES_NODE_NAME -E cluster.name=$ES_NODE_NAME -E transport.tcp.port=$ES_TRANSPORT_PORT -E transport.host=$ES_HOST -E http.port=$ES_HTTP_PORT -E network.host=$ES_HOST -E discovery.type=$ES_DISCOVERY_TYPE -E xpack.security.enabled=false -E xpack.ml.enabled=false -E xpack.graph.enabled=false -E xpack.monitoring.enabled=false -E xpack.enrich.enabled=false -E xpack.watcher.enabled=false > $ES_HOME/es_start.sh && \
  chmod +x $ES_HOME/es_start.sh

VOLUME [ "/usr/share/elasticsearch/data" ]

EXPOSE 9200 9300

CMD [ "/bin/bash", "-c", "source /elastic_env.sh && /usr/share/elasticsearch/es_start.sh" ]
