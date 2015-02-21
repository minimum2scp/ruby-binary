#! /bin/bash -l
set -x
set -e

sed -i -e 's@http.debian.net@ftp.jp.debian.org@' /etc/apt/sources.list

apt-get update
apt-get install -y --no-install-recommends pigz

rbenv update

for version in ${RUBY_BINARY_VERSIONS//,/ }; do
  rbenv install -v ${version} | tee ${RUBY_BINARY_LOG_DIR}/${version}.log
done

for version in ${RUBY_BINARY_VERSIONS//,/ }; do
  tarball=${RUBY_BINARY_DEST}/opt-rbenv-ruby-${version}.tar.gz
  tar -Ipigz -cf ${tarball} -C /opt/rbenv/versions ${version}
done

