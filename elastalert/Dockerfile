FROM balenalib/raspberrypi3-debian:latest

RUN apt-get update -y && \
    apt-get install curl telnet net-tools wget python3 python3-pip libmagic1 libmagic-dev libmagic-mgc -y && \
    pip3 install python-magic && \
    pip3 install elastalert && \
    sed -i "s/\(from jira\..*\)/#\1\nJIRAError = KeyError/g" /usr/local/lib/python3.7/dist-packages/elastalert/alerts.py

CMD ["/elastalert_start.sh"]
