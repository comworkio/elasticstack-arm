FROM balenalib/raspberrypi3-debian:latest

ENV ES_VERSION 7.5.1
ENV ES_OS linux
ENV ES_ARCH x86_64
ENV JAVA_VERSION 11
ENV PATH /usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/sbin:/usr/sbin:/usr/share/elasticsearch/bin
ENV JAVA_HOME /usr/lib/jvm/java-$JAVA_VERSION-openjdk-armhf
ENV KIBANA_HOME /usr/share/kibana
ENV ES_HOST 192.168.100.180
ENV ES_PORT 9200
ENV ES_PROTO http
ENV NODE_VERSION 10.15.2*

RUN apt-get update && \
  apt-get -qy install curl ca-certificates openjdk-$JAVA_VERSION-jdk openjdk-$JAVA_VERSION-jre telnet net-tools nodejs=$NODE_VERSION && \
  curl -fsSL https://artifacts.elastic.co/downloads/kibana/kibana-$ES_VERSION-$ES_OS-$ES_ARCH.tar.gz -o kibana.tgz && \
  tar xvzf kibana.tgz && \
  mv kibana-$ES_VERSION-$ES_OS-$ES_ARCH $KIBANA_HOME && \
  rm -rf kibana-$ES_VERSION-$ES_OS-$ES_ARCH && \
  sed -i "s/.*NODE\=.*/NODE=\/usr\/bin\/node/g" $KIBANA_HOME/bin/kibana && \
  echo $KIBANA_HOME/bin/kibana --allow-root > $KIBANA_HOME/kibana_start.sh && \
  chmod +x $KIBANA_HOME/kibana_start.sh

RUN echo "server.host: 0.0.0.0" >> $KIBANA_HOME/config/kibana.yml && \
echo "elasticsearch.hosts: [\"$ES_PROTO://$ES_HOST:$ES_PORT\"]" >> $KIBANA_HOME/config/kibana.yml

EXPOSE 5601

CMD [ "/bin/sh", "-c", "/usr/share/kibana/kibana_start.sh" ]
