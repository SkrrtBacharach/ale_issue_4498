#!/bin/bash

. common.sh

$container_runner build -f Containerfile -t $image context
