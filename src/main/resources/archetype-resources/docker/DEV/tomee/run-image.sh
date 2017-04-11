#!/bin/sh

name=${artifactId}-tomee

if [ $# -eq 1 ]; then

	vers=$1
	
	# Ce conteneur est-il déjà lancé ?
	running=`docker ps --all --quiet --filter name=$name-$vers`
	
	# Si c'est le cas, l'arreter et le détruire
	if [ -n "$running" ]; then
		echo "Suppression du conteneur $name existant..."
		docker stop $running
		docker rm --volumes $running
	fi
	
	echo "Démarrage de $name-$vers..."
	docker run --name $name-$vers \
		-p 8080:8080 \
		--link ${artifactId}-mysql-$vers:${artifactId}-mysql \
		-d $name-$vers

else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 