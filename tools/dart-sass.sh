#!/bin/sh
set -eu
HERE=$(dirname "$0")
version=$1
repo=sass
formula=dart-sass
prefix="https://github.com/${repo}/${formula}/releases/download"
for arch in macos-x64 macos-arm64 linux-x64
do
  "${HERE}/sha256.sh" "${prefix}/${version}/${formula}-${version}-${arch}.tar.gz"
done
