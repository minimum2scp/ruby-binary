#! /bin/sh
set -x
set -e

version=$1
tarball=$2
log=$3

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y
unset DEBIAN_FRONTEND

bash -lc "rbenv update"
bash -lc "rbenv install -v ${version}" | tee $log

tar cfz ${tarball} -C /opt/rbenv/versions ${version}

