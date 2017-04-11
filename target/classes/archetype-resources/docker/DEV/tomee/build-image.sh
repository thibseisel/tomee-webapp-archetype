#!/bin/sh

name=app-tomee

if [ $# -eq 1 ]; then
	version=$1
	docker build -t $name-$version .
else
	echo 'Usage: build-image.sh <version>'
	exit 1
fi 