@echo off

if NOT exist "./InitFiles" (
   mkdir "./InitFiles"
)

set "sourceDir=../"
set "targetDir=./InitFiles/"

for /D %%i in ("%sourceDir%\*Service") do (
    if exist "%%i\dbInitialization.sql" (
        copy "%%i\dbInitialization.sql" "%targetDir%\%%~ni_DBInit.sql"
    )
)