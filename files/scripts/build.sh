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

## update rbenv
bash -lc "rbenv update"

## update default-gems
default_gems=`mktemp`
cat <<DEFAULT_GEMS > $default_gems
bundler 1.9.9
pry
DEFAULT_GEMS
install -m 644 -o root -g root -p $default_gems ${RBENV_ROOT}/default-gems
rm $default_gems

## build and install ruby
bash -lc "rbenv install -v ${version}" | tee $log

## archive binary
tar cfz ${tarball} -C /opt/rbenv/versions ${version}

