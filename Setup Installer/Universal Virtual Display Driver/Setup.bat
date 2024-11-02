@echo off
setlocal

set CERTIFICATE="%~dp0Virtual_Display_Driver.cer"

IF "%1"=="install" (
    rem Run install
    C:\VirtualDisplayDriver\nefconw.exe --remove-device-node --hardware-id Root\MttVDD --class-guid 4d36e968-e325-11ce-bfc1-08002be10318
    certutil -addstore -f root %CERTIFICATE%
    certutil -addstore -f TrustedPublisher %CERTIFICATE%
    C:\VirtualDisplayDriver\nefconw.exe --create-device-node --hardware-id Root\MttVDD --class-name Display --class-guid 4D36E968-E325-11CE-BFC1-08002BE10318
    C:\VirtualDisplayDriver\nefconw.exe --install-driver --inf-path C:\VirtualDisplayDriver\MttVDD.inf
)

IF "%1"=="uninstall" (
    rem Run uninstall commands
    C:\VirtualDisplayDriver\nefconw.exe --remove-device-node --hardware-id Root\MttVDD --class-guid 4d36e968-e325-11ce-bfc1-08002be10318
)

IF "%1"=="" (
    echo Missing argument! Valid arguments are "install" or "uninstall".
)

endlocal