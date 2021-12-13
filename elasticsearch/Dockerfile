ARG BALENA_DEBIAN_TAG=buster
ARG BALENA_DEBIAN_DIGEST=sha256:b32c2579e735f8257211c9b2c2eeab6db199907e138380833dbe2515cc6878e3

FROM balenalib/raspberrypi3-debian:${BALENA_DEBIAN_TAG}@${BALENA_DEBIAN_DIGEST} AS base

ENV ES_VERSION=7.16.1 \
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

COPY ./elastic_env.sh ./elastic_start.sh /

RUN groupadd elasticsearch && \
  useradd -rm -d /home/elasticsearch -s /bin/bash -g elasticsearch -G sudo -u 1001 elasticsearch && \
  chmod +x /elastic_env.sh && \
  chmod +x /elastic_start.sh && \
  apt-get update && \
  apt-get -qy install bash curl ca-certificates openjdk-$JAVA_VERSION-jdk openjdk-$JAVA_VERSION-jre telnet net-tools && \
  curl -fsSL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ES_VERSION-$ES_OS-$ES_ARCH.tar.gz -o elasticsearch.tgz && \
  tar xvzf elasticsearch.tgz > /dev/null 2>&1 && \
  mv elasticsearch-$ES_VERSION $ES_HOME && \
  echo "-Xlog:disable" >> $ES_HOME/gc.options && \
  rm -rf elasticsearch.tgz && \
  sed -i "s/Xms1g/Xms$ES_HEAP/g;s/Xmx1g/Xmx$ES_HEAP/g" $ES_HOME/config/jvm.options && \
  echo $ES_EXEC -E node.name=$ES_NODE_NAME -E cluster.name=$ES_NODE_NAME -E transport.tcp.port=$ES_TRANSPORT_PORT -E transport.host=$ES_HOST -E http.port=$ES_HTTP_PORT -E network.host=$ES_HOST -E discovery.type=$ES_DISCOVERY_TYPE -E xpack.security.enabled=false -E xpack.ml.enabled=false -E xpack.graph.enabled=false -E xpack.monitoring.enabled=false -E xpack.enrich.enabled=false -E xpack.watcher.enabled=false > $ES_HOME/es_start.sh && \
  chmod +x $ES_HOME/es_start.sh && \
  chown -R elasticsearch:elasticsearch $ES_HOME && \
  chmod -R 755 $ES_HOME

VOLUME [ "/usr/share/elasticsearch/data" ]

EXPOSE 9200 9300

USER elasticsearch

CMD [ "/elastic_start.sh" ]
