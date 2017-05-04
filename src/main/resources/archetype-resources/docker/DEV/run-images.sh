#!/bin/bash

vers=${version}

echo 'Lancement du conteneur MySQL...'
cd mysql/
./run-image.sh $vers
cd ..

echo 'Lancement du conteneur Tomee...'
cd tomee/
./run-image.sh $vers
cd ..
