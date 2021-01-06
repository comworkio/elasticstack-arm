FROM balenalib/raspberrypi3-debian:latest

ENV ES_VERSION=7.9.1 \
    ES_OS=linux \
    ES_ARCH=x86_64 \
    JAVA_VERSION=11 \
    KIBANA_HOME=/usr/share/kibana \
    ES_HOST=192.168.100.180 \
    SERVER_HOST=0.0.0.0 \
    ES_PORT=9200 \
    ES_PROTO=http \
    NODE_VERSION=10.*

COPY ./kibana_env.sh /

RUN chmod +x /kibana_env.sh && \
  apt-get update && \
  apt-get -qy install nodejs=$NODE_VERSION bash curl ca-certificates openjdk-$JAVA_VERSION-jdk openjdk-$JAVA_VERSION-jre telnet net-tools && \
  curl -fsSL https://artifacts.elastic.co/downloads/kibana/kibana-$ES_VERSION-$ES_OS-$ES_ARCH.tar.gz -o kibana.tgz && \
  tar xvzf kibana.tgz && \
  mv kibana-$ES_VERSION-$ES_OS-$ES_ARCH $KIBANA_HOME && \
  rm -rf kibana-$ES_VERSION-$ES_OS-$ES_ARCH && \
  sed -i "s/.*NODE\=.*/NODE=\/usr\/bin\/node/g" $KIBANA_HOME/bin/kibana && \
  echo $KIBANA_HOME/bin/kibana --allow-root > $KIBANA_HOME/kibana_start.sh && \
  chmod +x $KIBANA_HOME/kibana_start.sh && \
  echo "server.host: ES_HOST" >> $KIBANA_HOME/config/kibana.yml && \
  echo "elasticsearch.hosts: [\"ES_PROTO:ES_HOST:ES_PORT\"]" >> $KIBANA_HOME/config/kibana.yml

EXPOSE 5601

CMD [ "/bin/bash", "-c", "source /kibana_env.sh && sed -i \"s/ES_PROTO/\$ES_PROTO/g;s/ES_HOST/\$ES_HOST/g;s/ES_PORT/\$ES_PORT/g\" \$KIBANA_HOME/config/kibana.yml && /usr/share/kibana/kibana_start.sh" ]
