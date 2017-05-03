#!/bin/sh

name=ngint-mysql

if [ $# -eq 1 ]; then

	vers=$1 
	
	# Ce conteneur est-il déjà lancé ?
	running=`docker ps --all --quiet --filter name=$name-$vers`
	
	# Si c'est le cas, l'arrêter et le détruire
	if [ -n "$running" ]; then
		echo "Suppression du conteneur $name existant..."
		docker stop $running
		docker rm --volumes $running
	fi
	
	echo "Démarrage de $name-$vers..."
	docker run --name $name-$vers \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=password \
	-e MYSQL_DATABASE=app \
	-e MYSQL_USER=app \
	-e MYSQL_PASSWORD=password \
	-d $name-1.0.0.dev
	
else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 