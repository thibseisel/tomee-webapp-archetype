#!/bin/bash

version=1.0.0.dev

echo 'Lancement du conteneur MySQL...'
cd mysql/
./run-image.sh 1.0.0.dev
cd ..

echo 'Lancement du conteneur Tomee...'
cd tomee/
./run-image.sh 1.0.0.dev
cd ..
