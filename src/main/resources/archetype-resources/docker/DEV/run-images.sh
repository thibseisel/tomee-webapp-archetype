#!/bin/bash

version=${version}

echo 'Lancement du conteneur MySQL...'
cd mysql/
./run-image.sh $version
cd ..

echo 'Lancement du conteneur Tomee...'
cd tomee/
./run-image.sh $version
cd ..
