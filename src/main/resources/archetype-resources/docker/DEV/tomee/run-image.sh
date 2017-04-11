#!/bin/sh

name='app-tomee'

if [ $# -eq 1 ]; then

	version=$1
	
	# Ce conteneur est-il déjà lancé ?
	running=`docker ps --all --quiet --filter name=$name-$version`
	
	# Si c'est le cas, l'arreter et le détruire
	if [ -n "$running" ]; then
		echo "Suppression du conteneur $name existant..."
		docker stop $running
		docker rm --volumes $running
	fi
	
	echo "Démarrage de $name-$version..."
	docker run --name $name-$version \
		-p 8080:8080 \
		--link app-mysql-$version:app-mysql \
		-d $name-$version

else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 