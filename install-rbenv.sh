#! /bin/sh

set -e
set -x

RBENV_ROOT=/opt/rbenv

## install rbenv into /opt/rbenv, with git
if [ ! -d ${RBENV_ROOT} ]; then
  sudo git clone https://github.com/sstephenson/rbenv.git ${RBENV_ROOT}
fi

## install /etc/profile.d/rbenv.sh
if [ ! -f /etc/profile.d/rbenv.sh ]; then
  profile=`mktemp`
  cat <<PROFILE > $profile
export RBENV_ROOT=${RBENV_ROOT}
export PATH=\$RBENV_ROOT/bin:\$PATH
eval "\$(rbenv init -)"
PROFILE
  sudo install -m 644 -o root -g root -p $profile  /etc/profile.d/rbenv.sh
  if dpkg-query -s etckeeper 1>/dev/null 2>/dev/null; then
    sudo etckeeper commit "add /etc/profile.d/rbenv.sh to use ${RBENV_ROOT}"
  fi
  rm $profile
fi

## install ruby-build
if [ ! -d ${RBENV_ROOT}/plugins/ruby-build ]; then
  sudo git clone https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
fi

## install rbenv-default-gems
if [ ! -d ${RBENV_ROOT}/plugins/rbenv-default-gems ]; then
  sudo git clone https://github.com/sstephenson/rbenv-default-gems.git ${RBENV_ROOT}/plugins/rbenv-default-gems
fi

## install /opt/rbenv/default-gems
if [ ! -f ${RBENV_ROOT}/default-gems ]; then
  default_gems=`mktemp`
  cat <<DEFAULT_GEMS > $default_gems
bundler 1.9.9
pry
DEFAULT_GEMS
  sudo install -m 644 -o root -g root -p $default_gems ${RBENV_ROOT}/default-gems
  rm $default_gems
fi

## install rbenv-update
if [ ! -d ${RBENV_ROOT}/plugins/rbenv-update ]; then
  sudo git clone https://github.com/rkh/rbenv-update.git ${RBENV_ROOT}/plugins/rbenv-update
fi

## enable rbenv (creates shims, versions)
sudo bash -l -c "rbenv rehash"

