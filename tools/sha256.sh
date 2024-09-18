#!/bin/sh
set -eu
HERE=$(dirname "$0")
URL=$1
FILE=${HERE}/${URL##*/}
[[ -s "${FILE}" ]] || curl -LO "${URL}" --output-dir "${HERE}"
shasum -a 256 "${FILE}"
