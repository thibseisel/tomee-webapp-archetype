#!/bin/sh

name=${artifactId}-mariadb

if [ $# -eq 1 ]; then

	vers=$1 
	
	# Is there already a container with this name ?
	running=`docker ps --all --quiet --filter name=$name-$vers`
	
	# If it's the case, stop it and delete it
	if [ -n "$running" ]; then
		echo "Deleting existing $name container ..."
		docker stop $running
		docker rm --volumes $running
	fi
	
	echo "Starting $name-$vers..."
	docker run --name $name-$vers \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=${dbRootPassword} \
	-e MYSQL_DATABASE=${dbName} \
	-e MYSQL_USER=${dbUser} \
	-e MYSQL_PASSWORD=${dbPassword} \
	-d $name-$version
	
else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 