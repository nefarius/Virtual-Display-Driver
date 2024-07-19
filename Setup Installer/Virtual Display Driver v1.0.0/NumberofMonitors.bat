@echo off
REM Check if the user has provided an argument
if "%~1"=="" (
    echo Usage: %0 [number between 1 and 9]
    exit /b 1
)

REM Get the new number from the command line argument
set newNumber=%~1

REM Validate the new number (must be between 1 and 9)
if "%newNumber%" lss "1" (
    echo Error: The number must be between 1 and 9.
    exit /b 1
)
if "%newNumber%" gtr "9" (
    echo Error: The number must be between 1 and 9.
    exit /b 1
)

REM Path to the input and temporary files
set inputFile=option.txt
set tempFile=temp.txt

REM Read the first line and replace it with the new number
> %tempFile% (
    echo %newNumber%
    more +1 %inputFile%
)

REM Replace the original file with the updated file and suppress output
move /Y %tempFile% %inputFile% >nul 2>&1