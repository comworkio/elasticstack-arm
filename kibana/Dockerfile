FROM balenalib/raspberrypi3-debian:latest

ENV ES_VERSION=7.13.2 \
    ES_OS=linux \
    ES_ARCH=x86_64 \
    JAVA_VERSION=11 \
    KIBANA_HOME=/usr/share/kibana \
    ES_HOST=192.168.100.180 \
    SERVER_HOST=0.0.0.0 \
    ES_PORT=9200 \
    ES_PROTO=http \
    NODE_HOME=/usr/share/nodejs \
    NODE_BUILD_HOME=/usr/share/nodebuild \
    NODE_VERSION=14.16.1 \
    NODE_ARCH=armv7l

COPY ./kibana_env.sh ./kibana_start.sh /

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
  mkdir -p $NODE_BUILD_HOME && \
  cd $NODE_BUILD_HOME && \
  npm init && \
  npm ci re2 --save && \
  cd - && \
  mv $NODE_BUILD_HOME/node_modules/re2 $KIBANA_HOME/node_modules && \
  rm -rf node.tgz && \
  rm -rf kibana.tgz && \
  sed -i "s/.*NODE\=.*/NODE=\/usr\/bin\/node/g" $KIBANA_HOME/bin/kibana && \
  echo $KIBANA_HOME/bin/kibana --allow-root > $KIBANA_HOME/kibana_start.sh && \
  chmod +x $KIBANA_HOME/kibana_start.sh && \
  echo "server.host: KIBANA_HOST" >> $KIBANA_HOME/config/kibana.yml && \
  echo "elasticsearch.hosts: [\"ES_PROTO://ES_HOST:ES_PORT\"]" >> $KIBANA_HOME/config/kibana.yml

EXPOSE 5601

CMD [ "/kibana_start.sh" ]
