#!/bin/bash

REPO_PATH="${PROJECT_HOME}/elasticstack-arm/"

cd "${REPO_PATH}" && git pull origin master || :
git push github master 
git push pgitlab master
exit 0
