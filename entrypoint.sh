#!/bin/bash

set -o pipefail -ue

readonly SHELLCHECK_EXCLUDE=${SHELLCHECK_EXCLUDE:=""}

if [ ! -f "/tmp/FileToBeChecked" ]; then
    echo "File not found /tmp/FileToBeChecked"
    exit 1
fi

tr -cd '\11\12\15\40-\176' < /tmp/FileToBeChecked > /tmp/fixfile

shellcheck -e "${SHELLCHECK_EXCLUDE}" /tmp/fixfile
