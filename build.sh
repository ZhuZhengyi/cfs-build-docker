#!/usr/bin/env bash

RootPath=$(cd $(dirname $0) ; pwd)
CfsClient="chubaofs/centos-ltp:1.0"
CfsServer="chubaofs/cfs-build:1.0"

build_client() {
    docker build -t ${CfsClient} -f ${RootPath}/Dockerfile-client ${RootPath}
}

build_server() {
    docker build -t ${CfsServer} -f ${RootPath}/Dockerfile-server ${RootPath}
}

push_server() {
    docker push ${CfsServer}
}

push_client() {
    docker push ${CfsClient}
}

cmd=${1:-"all"}

help() {
    cat <<EOF
./build.sh [build | build_server | build_client | push | push_client | push_server]
EOF
}

case "$cmd" in
    "build_client") build_client ;;
    "build_server") build_server ;;
    "push_server") push_server ;;
    "push_client") push_client ;;
    "build") build_server build_client ;;
    "push") push_server; push_client ;;
    *) help ;;
esac

