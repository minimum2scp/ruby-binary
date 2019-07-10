#! /bin/sh

set -e
set -x

branch=master
tag=
platform=
version=
while getopts b:t:v: OPT; do
  case $OPT in
    b)
      branch=${OPTARG};;
    t)
      tag=${OPTARG};;
    v)
      version=${OPTARG};;
    p)
      platform=${OPTARG};;
    *)
      echo "Usage: install.sh [-t tag] [-v version] [-p platform]" 1>&2
      exit 1
      ;;
  esac
done

tmpdir=`mktemp -d`
trap "
set +e
cd $tmpdir && rm -rf ruby-binary && cd / && rmdir $tmpdir
" 0

## download Rakefile (https://github.com/minimum2scp/ruby-binary/blob/master/Rakefile)
git clone https://github.com/minimum2scp/ruby-binary -b ${branch} $tmpdir/ruby-binary

## detect platform
if [ -z "${platform}" ]; then
  if [ ! -f /etc/debian_version ]; then
    echo "/etc/debian_version not found"
    exit 1
  fi

  arch=
  eval $(apt-config shell arch APT::Architecture)
  if [ $arch != 'amd64' ]; then
    echo "arch ${arch} is not supported"
    exit 1
  fi

  debian_version=`cat /etc/debian_version`
  case ${debian_version} in
    9.*)
      platform=stretch-${arch};;
    10.*)
      platform=buster-${arch};;
    11.0|*/sid)
      platform=sid-${arch};;
    *)
      echo "debian_version ${debian_version} is not supported"
      exit 1
      ;;
  esac
  unset arch debian_version
fi

## install ruby binary by rake task
## empty tag means latest release
cd $tmpdir/ruby-binary
if [ -n "${version}" ]; then
  rake "install:github_release:install[${tag},${platform},${version}]"
else
  rake "install:github_release:install_all[${tag},${platform}]"
fi

