#!/bin/bash

version=1.0.0.dev

echo 'Construction de MySQL...'
cd mysql/
./build-image.sh 1.0.0.dev
cd ..

echo 'Construction de Tomee...'
cd tomee/
./build-image.sh 1.0.0.dev
cd ..	
