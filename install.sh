#! /bin/sh

set -e
set -x

tmpdir=`mktemp -d`
trap "
set +e
rm $tmpdir/Rakefile
rmdir $tmpdir
" 0

cd $tmpdir

tag=$1

## download Rakefile (https://github.com/minimum2scp/ruby-binary/blob/master/Rakefile)
git clone https://github.com/minimum2scp/ruby-binary -b master $tmpdir

## detect platform
arch=`dpkg-architecture -q DEB_HOST_ARCH`
if [ $arch != 'amd64' ]; then
  echo "DEB_HOST_ARCH ${arch} is not supported"
  exit 1
fi

version_id=`sh -c '. /etc/os-release && echo $VERSION_ID'`
case $version_id in
  7)
    platform=wheezy-${arch};;
  8)
    platform=sid-${arch};;
  *)
    echo "VERSION_ID ${version_id} is not supported"
esac
unset arch version_id

## install ruby binary by rake task
## empty tag means latest release
rake "install:github_release:install_all[${tag},${platform}]"

