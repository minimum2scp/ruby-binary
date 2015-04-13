#! /bin/bash
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
add_definition (){
  if [ ! -f /opt/rbenv/plugins/ruby-build/share/ruby-build/${1} ]; then
		cat > "/opt/rbenv/plugins/ruby-build/share/ruby-build/${1}" <<-DEFINITION
			install_package "openssl-1.0.1m" "https://www.openssl.org/source/openssl-1.0.1m.tar.gz#095f0b7b09116c0c5526422088058dc7e6e000aa14d22acca6a4e2babcdfef74" mac_openssl --if has_broken_mac_openssl
			install_package "ruby-${1}" "http://cache.ruby-lang.org/pub/ruby/${1:0:3}/ruby-${1}.tar.gz#${2}" ldflags_dirs standard verify_openssl
		DEFINITION
  fi
}
add_definition 2.0.0-p645 5e9f8effffe97cba5ef0015feec6e1e5f3bacf6ace78cd1cdf72708cd71cf4ab
add_definition 2.1.6      1e1362ae7427c91fa53dc9c05aee4ee200e2d7d8970a891c5bd76bee28d28be4
add_definition 2.2.2      5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44
bash -lc "rbenv install -v ${version}" | tee $log

tar cfz ${tarball} -C /opt/rbenv/versions ${version}

