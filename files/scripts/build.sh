#! /bin/bash -l
set -x
set -e

version=$1
tarball=$2
log=$3

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y
unset DEBIAN_FRONTEND

rbenv update
rbenv install -v ${version} | tee $log
tar cfz ${tarball} -C /opt/rbenv/versions ${version}

