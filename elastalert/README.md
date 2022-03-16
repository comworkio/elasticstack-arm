# Getting started

You'll have to put your elastalert yaml rules in a volume mounted as `/rules` directory.

You also have to override the `ES_HOST` ip adress or container name (and the `ES_PORT` if you change 9200 by something else).

No https and no authentication for now (everything is designed for local raspberrypi) but you can override the `/config.yaml` with a volume if you need to overide the default configuration more.
