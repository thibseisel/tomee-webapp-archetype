#!/bin/sh

name=${artifactId}-mysql

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
	-e MYSQL_ROOT_PASSWORD=${dbRootPassword} \
	-e MYSQL_DATABASE=${dbName} \
	-e MYSQL_USER=${dbUser} \
	-e MYSQL_PASSWORD=${dbPassword} \
	-d $name-$version
	
else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 