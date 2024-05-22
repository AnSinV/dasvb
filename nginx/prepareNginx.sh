#!/bin/bash

if [ ! -d "./templates" ]; then
   mkdir "./templates"
fi

sourceDir="../"
targetDir="./templates/"

sudo cp "./nginx.conf.template" "$targetDir/nginx.conf.template"

for i in "$sourceDir"/*Service; do
    if [ -f "$i/nginx.conf.template" ]; then
        sudo cp "$i/nginx.conf.template" "$targetDir/$(basename "$i")_Nginx.conf.template"
    fi
done
