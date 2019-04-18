#!/usr/bin/env bash

RootPath=$(cd $(dirname $0) ; pwd)
CfsBuild="20181126103126/cfs-build:latest"

docker build -t ${CfsBuild} ${RootPath}

