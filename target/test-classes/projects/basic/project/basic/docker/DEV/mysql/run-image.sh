#!/bin/sh

name='app-mysql'

if [ $# -eq 1 ]; then

	version=$1 
	
	# Ce conteneur est-il déjà lancé ?
	running=`docker ps --all --quiet --filter name=$name-0.1-SNAPSHOT`
	
	# Si c'est le cas, l'arrêter et le détruire
	if [ -n "$running" ]; then
		echo "Suppression du conteneur $name existant..."
		docker stop $running
		docker rm --volumes $running
	fi
	
	echo "Démarrage de $name-0.1-SNAPSHOT..."
	docker run --name $name-0.1-SNAPSHOT \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=password \
	-e MYSQL_DATABASE=dbname \
	-e MYSQL_USER=app \
	-e MYSQL_PASSWORD=password \
	-d $name-0.1-SNAPSHOT
	
else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 