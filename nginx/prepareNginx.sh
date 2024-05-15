#!/bin/bash

if [ ! -d "./templates" ]; then
   mkdir "./templates"
fi

sourceDir="../"
targetDir="./templates/"

for i in "$sourceDir"/*Service; do
    if [ -f "$i/nginx.conf.template" ]; then
        cp "$i/nginx.conf.template" "$targetDir/$(basename "$i")_Nginx.conf.template"
    fi
done
