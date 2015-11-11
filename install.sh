#! /bin/sh

set -e
set -x

tmpdir=`mktemp -d`
trap "
set +e
cd $tmpdir && rm -rf ruby-binary && cd / && rmdir $tmpdir
" 0

tag=$1

## download Rakefile (https://github.com/minimum2scp/ruby-binary/blob/master/Rakefile)
git clone https://github.com/minimum2scp/ruby-binary -b master $tmpdir/ruby-binary

if [ ! -f /etc/debian_version ]; then
  echo "/etc/debian_version not found"
  exit 1
fi

## detect platform
arch=
eval $(apt-config shell arch APT::Architecture)
if [ $arch != 'amd64' ]; then
  echo "arch ${arch} is not supported"
  exit 1
fi

debian_version=`cat /etc/debian_version`
case ${debian_version} in
  7.*)
    platform=wheezy-${arch};;
  8.*)
    platform=jessie-${arch};;
  */sid)
    platform=sid-${arch};;
  *)
    echo "debian_version ${debian_version} is not supported"
    exit 1
    ;;
esac
unset arch debian_version

## install ruby binary by rake task
## empty tag means latest release
cd $tmpdir/ruby-binary
rake "install:github_release:install_all[${tag},${platform}]"

