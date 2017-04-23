# ubuntu-cleanup-images-headers
For those pesky times when the `/boot` volume fills up

## Overview
Removes all kernel images and headers except for the following:
* previous kernel
* current kernel
* next kernel (if installed)

Previous and next are determined by getting a list of installed kernels and sorting ASCIIbetical

### Example
ASCIIbetical list of kernels found on system:
```
linux-image-3.19.0-47-generic
linux-image-3.19.0-66-generic
linux-image-4.4.0-67-generic
linux-image-4.4.0-70-generic
linux-image-4.4.0-71-generic
linux-image-4.4.0-72-generic
```
If the current kernel is `linux-image-4.4.0-71-generic` then the following kernels are kept and all others removed:
```
linux-image-4.4.0-70-generic
linux-image-4.4.0-71-generic
linux-image-4.4.0-72-generic
```
Same logic applies for headers

## Usage
1. Reboot machine so it is running the latest installed kernel
2. Run `sudo bash cleaupboot.sh` to remove all old kernel images and headers
