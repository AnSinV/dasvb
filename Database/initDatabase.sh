#!/bin/bash

if [ ! -d "./InitFiles" ]; then
   mkdir "./InitFiles"
fi

sourceDir="../"
targetDir="./InitFiles/"

for i in "$sourceDir"/*Service; do
    if [ -e "$i/dbInitialization.sql" ]; then
        cp "$i/dbInitialization.sql" "$targetDir/$(basename "$i")_DBInit.sql"
    fi
done