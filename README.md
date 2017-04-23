# ubuntu-cleanup-images-headers
For those pesky times when the `/boot` volume fills up

## Overview
Removes all kernel images and headers except for the following:
* previous kernel
* current kernel
* next kernel (if installed)

Previous and next are determined by getting a list of installed kernels and sorting ASCIIbetical

### Example
*coming soon*

## Usage
1. Reboot machine so it is running the latest installed kernel
2. Run `sudo bash cleaupboot.sh` to remove all old kernel images and headers
