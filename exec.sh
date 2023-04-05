#!/bin/bash

. common.sh

get_last_container=(
    podman container list -l --noheading
    -f ancestor="$image,status=running"
    --format="{{.ID}}"
)
last_container=$("${get_last_container[@]}")

if [ -n "$last_container" ]; then
    $container_runner exec -it "$last_container" /bin/bash
else
    echo "'$image' container not running."
    exit 1
fi
