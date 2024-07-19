<p align="center">
  <h1 align="center">Virtual Display Driver</h1>
  <p align="center">
    Add virtual monitors to your windows 10/11 device!
    <br />
    Works with VR, OBS, Sunshine, and/or any desktop sharing software.
    <br />
    Now with an easy to follow setup wizard!
  </p>
</p>

<br>

## ℹ About

This project is based on the "Virtual Display Driver" project and tries to improve on it.

> based on Microsoft Indirect Display Driver Sample. This creates a virtual display in Windows that acts and functions just like a real one. It's useful for streaming, virtual reality applications, recording, headless servers, etc. The benefit over a physical display is the ability to adjust resolutions and refresh rates beyond the physical displays capabilities. For example, this would enable the ability to stream a game from your home PC using game streaming software at 240hz at 8K while owning a 60hz 1080p monitor (unrealistic, but explains the abilities well). For servers without displays, this enabled remote desktop and screen streaming to other systems as if there were a display installed. 

> Supports emulating resolutions from **640 x 480** to **7680 x 4320 (8K)**, and refresh rates including **60hz, 75hz, 90hz, 120hz, 144hz, 165hz, 240hz, 480hz,** and **500hz.**

> This project uses the official Windows Indirect Display Driver combined with the IddCx class extension driver.

This project adds an easy to follow setup wizard and installer to install your Virtual Display. The setup wizard also lets you specify how many displays you want to add to your system without having to change any config file yourself.
  
I hope you enjoy this project and if you do i would appreciate a star rating :-)


## Prerequisites:

* Version without HDR: Windows 10 and Windows 11
* Version with HDR: Windows 11 23H2+ (HDR)


## Steps to get it running:

1. Download the latest release and follow the instructions of the Setup Wizard.

That's all you have to do! A Virtual Display should be added to your system!

## Notes:

- If you receive a Windows Defender Smartscreen prompt when executing the setup, click on "More info" and then on "Run anyway".

## Acknowledgements

- Huge shootout to the project [nefcon](https://github.com/nefarius/nefcon by nefarius and his contributors.
Without this project this unattended installer would not have been possible!  
Please check it out aswell.


## Acknowledgements of the original repo:

- Shoutout to **Roshkins** for the original repo:
https://github.com/roshkins/IddSampleDriver

- Shoutout to **Baloukj** for the 8-bit / 10-bit support. (Also, first to push the new Microsoft Driver public!)
https://github.com/baloukj/IddSampleDriver

- Shoutout to **Anakngtokwa** for assisting with finding driver sources.

- **Microsoft** Indirect Display Driver/Sample (Driver code): 
https://github.com/microsoft/Windows-driver-samples/tree/master/video/IndirectDisplay

- Thanks to **AKATrevorJay** https://github.com/akatrevorjay/edid-generator for the hi-res EDID.

- Shoutout to **zjoasan** and **Bud** for the helper scripts and build support!


### Resolutions:

    640 x 480
    800 x 600
    1024 x 768
    1152 x 864
    1280 x 720
    1280 x 768
    1280 x 800
    1280 x 960
    1280 x 1024
    1360 x 768
    1366 x 768
    1440 x 900
    1400 x 1050
    1440 x 1440
    1600 x 900
    1600 x 1024
    1680 x 1050
    1920 x 1080
    1920 x 1200
    2560 x 1440
    2560 x 1600
    2732 x 2048
    2880 x 1620
    2880 x 1800
    3008 x 1692
    3840 x 2160
    3840 x 2400
    4096 x 2304
    5120 x 2880
    6016 x 3384
    7680 x 4320

### Just Added!

    2732 x 2048
    2560 x 1080
    2880 x 1200
    3440 x 1440
    3840 x 1600
    4320 x 1800
    5120 x 2160
    5760 x 2400
    6880 x 2880
    7680 x 3200
    8640 x 3600
    10240 x 432
    2880 x 900
    3840 x 1080
    3840 x 1200
    4320 x 1200
    5120 x 1440
    5120 x 1600
    5760 x 1600
    5760 x 1800
    6400 x 1800
    6480 x 1800
    7680 x 2160
    7680 x 2400
    8640 x 2400
    2388 x 1668
    2400 x 1080
    3456 x 2234
    3456 x 2234

### Refresh Rates:

    30Hz
    60Hz
    75Hz
    90Hz (Great for VR!)
    120Hz
    144Hz
    165Hz
    240Hz
    480Hz
    500Hz