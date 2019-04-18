FROM golang:1.12-alpine
MAINTAINER Justice <zhuzhengyi@jd.com>

RUN apk add --update --no-cache build-base linux-headers git wget cmake bash
RUN apk add --no-cache bzip2-dev coreutils fuse-dev gcc g++ curl make musl-dev perl snappy-dev zlib-dev

RUN mkdir -p /tmp/rdb \
    && (cd /tmp/rdb; curl -L https://github.com/facebook/rocksdb/archive/v6.0.1.tar.gz | tar xzf -) \
    && (cd /tmp/rdb/rocksdb-6.0.1; INSTALL_PATH=/usr make -j4 install-shared) \
    && rm -r /tmp/rdb

