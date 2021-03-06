#!/bin/sh

name=${artifactId}-tomee

if [ $# -eq 1 ]; then
	vers=$1
	docker build -t $name-$vers .
else
	echo 'Usage: build-image.sh <version>'
	exit 1
fi 