@echo off
setlocal enabledelayedexpansion

set "folder=%cd%"
for %%I in ("%~dp0.") do (
    set "folderName=%%~nxI"
    
)
set "outputFile=%folder%\%folderName%.txt"
if exist "%outputFile%" del "%outputFile%"
for %%F in ("%folder%\*") do (
    if not "%%~xF"==".bat" (
        certutil -hashfile "%%F" MD5 | findstr /i /v "MD5" | findstr /r /v "^$" >> "%outputFile%"
    )
)



