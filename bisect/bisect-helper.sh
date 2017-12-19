#! /bin/bash

set -x
set -e

case "$1" in
  prepare)
    mkdir log
    git clone https://github.com/ruby/ruby.git
    docker pull minimum2scp/ruby:latest
    ;;
  build)
    commit=$(GIT_PAGER= git log -1 --format=format:%h)
    cd ..
    log=log/build-${commit}.log
    touch ${log}
    exec 1> >(tee -a ${log})
    exec 2> >(tee -a ${log})
    docker build -t ruby:${commit} .
    ;;
esac

