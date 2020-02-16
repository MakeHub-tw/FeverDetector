# FeverDetector

Detect people who have fevers with FLIR Lepton + PureThermal Smart I/O Module

## Hardware requirements


  - PC or Raspberry Pi which can run Linux
  - FLIR Lepton 2.5 or 3.5
  - PureThermal 1/2/Mini
  - A USB cord with appropriate length

## Quick Start

Any Linux (including Raspbian on Raspberry Pi 3B or above) based on Debian/Ubuntu distributions should be good enough

1. clone this respository by
2. Execute `setup_linux_env.sh` to set up libraries and dependencies.
3. cd to src and launch the application by `python3 FeverDetector.py`

## Useful Links:

- This application is modified from <https://github.com/Kheirlb/purethermal1-uvc-capture>
- A more complete and complex application implemented in CPP and Qt: <https://github.com/groupgets/GetThermal>

## Additional Comments:

Special thanks to Parabilis Space Technologies, Jerry Pierre, the developers of GroupGets GetThermal and purethermal1-uvc-capture, and the Flir Community Forum who helped me achieve my goals in this project.
