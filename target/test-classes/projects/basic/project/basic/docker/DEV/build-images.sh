#!/bin/bash

version=1.0.0.dev

echo 'Construction de MySQL...'
cd mysql/
./build-image.sh 0.1-SNAPSHOT
cd ..

echo 'Construction de Tomee...'
cd tomee/
./build-image.sh 0.1-SNAPSHOT
cd ..	
