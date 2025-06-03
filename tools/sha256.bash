#!/bin/bash
set -eu
URL=$1
sha256url=$(echo -n "$URL" | sha256sum | hck -f1)
FILE="$(brew --cache)/downloads/${sha256url}--${URL##*/}"
echo "$FILE" 1>&2
[[ -s "${FILE}" ]] || curl -L -o "${FILE}" "${URL}"
sha256sum "${FILE}" | hck -f1
