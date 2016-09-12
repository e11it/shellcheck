#!/bin/bash

set -o pipefail -ue
SHELLCHECK_EXCLUDE=${SHELLCHECK_EXCLUDE:=""}

if [ ! -f "/tmp/FileToBeChecked" ]; then
    echo "File not found /tmp/FileToBeChecked"
    exit 1
fi

tr -cd '\11\12\15\40-\176' < /tmp/FileToBeChecked > /tmp/fixfile2
LC_CTYPE=C sed '1s/^...//' < /tmp/fixfile2 > /tmp/fixfile

shellcheck -e "${SHELLCHECK_EXCLUDE}" /tmp/fixfile
