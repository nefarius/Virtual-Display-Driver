@echo off
setlocal

set CERTIFICATE="%~dp0Virtual_Display_Driver.cer"

IF "%1"=="install" (
    rem Run install
    C:\IddSampleDriver\nefconw.exe --remove-device-node --hardware-id ROOT\iddsampledriver --class-guid 4d36e968-e325-11ce-bfc1-08002be10318
    certutil -addstore -f root %CERTIFICATE%
    certutil -addstore -f TrustedPublisher %CERTIFICATE%
    C:\IddSampleDriver\nefconw.exe --create-device-node --hardware-id ROOT\iddsampledriver --class-name Display --class-guid 4D36E968-E325-11CE-BFC1-08002BE10318
    C:\IddSampleDriver\nefconw.exe --install-driver --inf-path C:\IddSampleDriver\IddSampleDriver.inf
)

IF "%1"=="uninstall" (
    rem Run uninstall commands
    C:\IddSampleDriver\nefconw.exe --remove-device-node --hardware-id ROOT\iddsampledriver --class-guid 4d36e968-e325-11ce-bfc1-08002be10318
    del "%~dp0option.txt"
)

IF "%1"=="" (
    echo Missing argument! Valid arguments are "install" or "uninstall".
)

endlocal