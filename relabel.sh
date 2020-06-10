#!/bin/bash

LABEL=$(matchpathcon -n /usr/bin/osbuild)

echo "osbuild label: ${LABEL}"

chcon ${LABEL} osbuild-ostree

find osbuild/ -maxdepth 2 -type f -executable -name 'org.osbuild.*' -print0 |
    while IFS= read -r -d '' module; do
	chcon ${LABEL} ${module}
    done
