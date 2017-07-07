#!/bin/bash

if [ $# -eq 1 ]; then
	vers=$1

	echo 'Constructing Mariadb's image ...'
	cd mariadb/
	./build-image.sh $vers
	cd ..
	
	echo 'Constructing TomEE's image ...'
	cd tomee/
	./build-image.sh $vers
	cd ..	
else
	echo 'Usage: build-images.sh <version>'
	exit 1
fi