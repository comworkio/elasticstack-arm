#!/bin/bash

elastalert-create-index || :
elastalert --verbose --config /config.yaml
