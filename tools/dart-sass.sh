#!/bin/sh
set -eu
HERE=$(dirname "$0")
repo=sass
formula=dart-sass
version=1.79.1
prefix="https://github.com/${repo}/${formula}/releases/download"
for arch in macos-x64 macos-arm64 linux-x64
do
  "${HERE}/sha256.sh" "${prefix}/${version}/${formula}-${version}-${arch}.tar.gz"
done
