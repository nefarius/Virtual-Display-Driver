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

REM Paths to the XML input and temporary output files
set inputFile=vdd_settings.xml
set tempFile=temp.xml

REM Counter for line number
set lineNumber=0

REM Read the file and replace the fourth line if it contains only "1"
(
    for /f "delims=" %%a in ('type "%inputFile%"') do (
        set /a lineNumber+=1
        set "line=%%a"
        setlocal enabledelayedexpansion
        
        if !lineNumber! equ 4 (
            if "!line!"=="        <count>1</count>" (
                echo         ^<count^>%newNumber%^</count^>
            ) else (
                echo:!line!
            )
        ) else (
            echo:!line!
        )
        
        endlocal
    )
) > "%tempFile%"

REM Replace the original file with the modified version and suppress output
move /Y "%tempFile%" "%inputFile%" >nul 2>&1