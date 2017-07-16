#!/bin/bash

set -euo pipefail

function get-shasum {
    local url=$1
    local file=$(mktemp /tmp/s3-file.XXXXXX)

    curl --silent --output "${file}" "${url}"
    shasum -a 256 "${file}" | awk '{print $1}'
}

url=$1
sha=$(get-shasum ${url})

echo "url \"${url}\""
echo "sha256 \"${sha}\""
