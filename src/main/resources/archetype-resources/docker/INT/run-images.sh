#!/bin/bash

if [ $# -eq 1 ]; then

	vers=$1
	
	echo 'Starting Mariadb ...'
	cd mariadb/
	./run-image.sh $vers
	cd ..
	
	echo 'Starting TomEE ...'
	cd tomee/
	./run-image.sh $vers
	cd ..
else
	echo 'Usage: run-images.sh <version>'
	exit 1
fi
