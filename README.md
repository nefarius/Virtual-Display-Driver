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

> Based on Microsoft Indirect Display Driver Sample. This creates a virtual display in Windows that acts and functions just like a real one. It's useful for streaming, virtual reality applications, recording, headless servers, etc. The benefit over a physical display is the ability to adjust resolutions and refresh rates beyond the physical displays capabilities. For example, this would enable the ability to stream a game from your home PC using game streaming software at 240hz at 8K while owning a 60hz 1080p monitor (unrealistic, but explains the abilities well). For servers without displays, this enabled remote desktop and screen streaming to other systems as if there were a display installed.

> Supports emulating resolutions from 640 x 480 to 7680 x 4320 (8K), and refresh rates including 60hz, 75hz, 90hz, 120hz, 144hz, 165hz, 240hz, 480hz, and 500hz.

> This project uses the official Windows Indirect Display Driver combined with the IddCx class extension driver.

This project adds an easy to follow setup wizard and installer to install your Virtual Display. The setup wizard also lets you specify how many displays you want to add to your system without having to change any config file yourself.
  
I hope you enjoy this project and if you do i would appreciate a star rating :-)

## Download Stable Version

> [!IMPORTANT]
> Please make sure you download the correct version for your operating system!

- [Windows 10 and 11 (no HDR)](https://github.com/timminator/Virtual-Display-Driver/releases/tag/v1.0.1)
- [Windows 11 23H2+ (HDR)](https://github.com/timminator/Virtual-Display-Driver/releases/tag/v1.0.1)

## Download Beta
- [Universal Driver - 24.10.27 (Windows 10/11)](https://github.com/timminator/Virtual-Display-Driver/releases/tag/24.11.01)

## Steps to get it running:

1. Download the latest release and follow the instructions of the Setup Wizard.

That's all you have to do! A Virtual Display should be added to your system!

## Notes:

- If you receive a Windows Defender Smartscreen prompt when executing the setup, click on "More info" and then on "Run anyway".

## Acknowledgements

- Huge shootout to the project [nefcon](https://github.com/nefarius/nefcon) by [nefarius](https://github.com/nefarius) and his contributors.
Without this project this unattended installer would not have been possible!  
Please check it out aswell.

## Further notes for building the installer yourself  

- The installer does not use the latest version of the nefconw.exe because the Virtual Display Driver was not uninstalled correctly using version v1.11.0. Instead version v1.10.0 is used while building the installer using Inno Setup.


## Acknowledgements of the original repo:

Shoutout to **[Bud](https://github.com/bud3699)** and **[zjoasan](https://github.com/zjoasan)** for jumping on the team and helping with not just support, but lots of great new features!

Shoutout to **[Roshkins](https://github.com/roshkins/IddSampleDriver)** for the original repo.

Shoutout to **[Baloukj](https://github.com/baloukj/IddSampleDriver)** for the 8-bit / 10-bit support. (Also, first to push the new Microsoft Driver public!)

Shoutout to **[Anakngtokwa](https://github.com/Anakngtokwa)** for assisting with finding driver sources.

**[Microsoft](https://github.com/microsoft/Windows-driver-samples/tree/master/video/IndirectDisplay)** Indirect Display Driver/Sample (Driver code)

Thanks to **[AKATrevorJay](https://github.com/akatrevorjay/edid-generator)** for the hi-res EDID.