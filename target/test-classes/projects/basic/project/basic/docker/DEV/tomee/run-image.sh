#!/bin/sh

name='app-tomee'

if [ $# -eq 1 ]; then

	version=$1
	
	# Ce conteneur est-il déjà lancé ?
	running=`docker ps --all --quiet --filter name=$name-0.1-SNAPSHOT`
	
	# Si c'est le cas, l'arreter et le détruire
	if [ -n "$running" ]; then
		echo "Suppression du conteneur $name existant..."
		docker stop $running
		docker rm --volumes $running
	fi
	
	echo "Démarrage de $name-0.1-SNAPSHOT..."
	docker run --name $name-0.1-SNAPSHOT \
		-p 8080:8080 \
		--link app-mysql-0.1-SNAPSHOT:app-mysql \
		-d $name-0.1-SNAPSHOT

else
	echo 'Usage: run-image.sh <version>'
	exit 1
fi 