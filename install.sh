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
curl -L -o Rakefile https://raw.githubusercontent.com/minimum2scp/ruby-binary/master/Rakefile

## install ruby binary by rake task
## empty tag means latest release
rake "install:github_release:install_all[${tag}]"

