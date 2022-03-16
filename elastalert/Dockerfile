ARG BALENA_DEBIAN_TAG=buster
ARG BALENA_DEBIAN_DIGEST=sha256:b32c2579e735f8257211c9b2c2eeab6db199907e138380833dbe2515cc6878e3

FROM balenalib/raspberrypi3-debian:${BALENA_DEBIAN_TAG}@${BALENA_DEBIAN_DIGEST} AS base

COPY ./elastalert_start.sh ./config.yaml /

RUN apt-get update -y && \
    apt-get install curl telnet net-tools wget python3 python3-pip python3-setuptools libmagic1 libmagic-dev libmagic-mgc -y && \
    pip3 install wheel && \
    pip3 install python-magic && \
    pip3 install elastalert && \
    sed -i "s/\(from jira\..*\)/#\1\nJIRAError = KeyError/g" /usr/local/lib/python3.7/dist-packages/elastalert/alerts.py && \
    mkdir -p /rules && \
    chmod +x /elastalert_start.sh

VOLUME /rules

CMD ["/elastalert_start.sh"]
