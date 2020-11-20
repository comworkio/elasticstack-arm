#!/bin/bash

REPO_PATH="/home/centos/elasticstack-arm/"

cd "${REPO_PATH}" && git pull origin master || :
git push github master 
exit 0
