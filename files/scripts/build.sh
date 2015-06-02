#! /bin/bash -l

set -x
set -e

version=$1
tarball=$2
log=$3
gems=$4

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get dist-upgrade -y
unset DEBIAN_FRONTEND

## remove rbenv-default-gems plugin if exists
if [ -d /opt/rbenv/plugins/rbenv-default-gems ]; then
  rm -fr /opt/rbenv/plugins/rbenv-default-gems
fi

## update rbenv, and plugins
rbenv update

## build and install ruby
rbenv install -v ${version} | tee $log

## install gems
while read gem_name gem_version; do
  case ${gem_version} in
    --pre)
      RBENV_VERSION=$version rbenv exec gem install "${gem_name}" --pre
      ;;
    ?*)
      RBENV_VERSION=$version rbenv exec gem install "${gem_name}" --version "${gem_version}"
      ;;
    *)
      RBENV_VERSION=$version rbenv exec gem install "${gem_name}"
      ;;
  esac
done < $gems

## archive binary
tar cfz ${tarball} -C /opt/rbenv/versions ${version}

