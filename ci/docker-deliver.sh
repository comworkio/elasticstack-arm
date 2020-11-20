#!/bin/bash

BASE_DIR="$(dirname $0)"
REPO_PATH="${BASE_DIR}/.."
ARCH="${1}"
IMAGE="${2}"
VERSION="${3}"

[[ $ARCH ]] || ARCH="x86"

tag_and_push() {
  docker tag "comworkio/${2}:latest" "comworkio/${2}:${1}"
  docker push "comworkio/${2}:${1}"
}

cd "${REPO_PATH}" && git pull origin master || : 

COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build "${IMAGE}"

echo "${DOCKER_ACCESS_TOKEN}" | docker login --username comworkio --password-stdin

if [[ $ARCH == "x86" ]]; then
  docker-compose push "rollup_${ARCH}"
  tag_and_push "${VERSION}" "${IMAGE}"
  tag_and_push "${VERSION}-${CI_COMMIT_SHORT_SHA}" "${IMAGE}"
fi

tag_and_push "latest-${ARCH}" "${IMAGE}"
tag_and_push "${VERSION}-${ARCH}" "${IMAGE}"
tag_and_push "${VERSION}-${ARCH}-${CI_COMMIT_SHORT_SHA}" "${IMAGE}"
