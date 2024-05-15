@echo off

if NOT exist "./templates" (
   mkdir "./templates"
)

set "sourceDir=../"
set "targetDir=./templates/"

for /D %%i in ("%sourceDir%/*Service") do (
    if exist "%sourceDir%/%%i\nginx.conf.template" (
        copy "%sourceDir%/%%i\nginx.conf.template" "%targetDir%\%%~ni_Nginx.conf.template"
    )
)