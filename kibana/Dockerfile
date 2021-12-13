ARG BALENA_DEBIAN_TAG=buster
ARG BALENA_DEBIAN_DIGEST=sha256:b32c2579e735f8257211c9b2c2eeab6db199907e138380833dbe2515cc6878e3

FROM balenalib/raspberrypi3-debian:${BALENA_DEBIAN_TAG}@${BALENA_DEBIAN_DIGEST} AS base

ENV ES_VERSION=7.16.1 \
    ES_OS=linux \
    ES_ARCH=x86_64 \
    JAVA_VERSION=11 \
    KIBANA_HOME=/usr/share/kibana \
    ES_HOST=192.168.100.180 \
    SERVER_HOST=0.0.0.0 \
    ES_PORT=9200 \
    ES_PROTO=http \
    NODE_HOME=/usr/share/nodejs \
    NODE_VERSION=14.16.1 \
    NODE_ARCH=armv7l

COPY ./kibana_env.sh ./kibana_start.sh ./re2.tgz /

RUN chmod +x /kibana_env.sh && \
  chmod +x /kibana_start.sh && \
  apt-get update && \
  apt-get -qy install bash curl ca-certificates openjdk-$JAVA_VERSION-jdk openjdk-$JAVA_VERSION-jre telnet net-tools && \
  curl -fsSL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.gz  -o node.tgz && \
  curl -fsSL https://artifacts.elastic.co/downloads/kibana/kibana-$ES_VERSION-$ES_OS-$ES_ARCH.tar.gz -o kibana.tgz && \
  tar xvzf kibana.tgz > /dev/null 2>&1 && \
  tar xvzf node.tgz > /dev/null 2>&1 && \
  mv kibana-$ES_VERSION-$ES_OS-$ES_ARCH $KIBANA_HOME && \
  mv node-v$NODE_VERSION-linux-$NODE_ARCH $NODE_HOME && \
  ln -s $NODE_HOME/bin/node /usr/bin && \
  ln -s $NODE_HOME/bin/npm /usr/bin && \
  rm -rf $KIBANA_HOME/node_modules/re2 && \
  tar xvzf re2.tgz > /dev/null 2>&1 && \
  mv node_modules/re2 $KIBANA_HOME/node_modules && \
  rm -rf node_modules && \
  rm -rf re2.tgz && \
  rm -rf node.tgz && \
  rm -rf kibana.tgz && \
  sed -i "s/.*NODE\=.*/NODE=\/usr\/bin\/node/g" $KIBANA_HOME/bin/kibana && \
  echo $KIBANA_HOME/bin/kibana --allow-root > $KIBANA_HOME/kibana_start.sh && \
  chmod +x $KIBANA_HOME/kibana_start.sh && \
  echo "xpack.apm.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.grokdebugger.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.searchprofiler.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.graph.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.ml.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.monitoring.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.reporting.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "xpack.security.enabled: false" >> $KIBANA_HOME/config/kibana.yml && \
  echo "server.host: KIBANA_HOST" >> $KIBANA_HOME/config/kibana.yml && \
  echo "elasticsearch.hosts: [\"ES_PROTO://ES_HOST:ES_PORT\"]" >> $KIBANA_HOME/config/kibana.yml

EXPOSE 5601

CMD [ "/kibana_start.sh" ]
