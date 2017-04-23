#!/bin/bash

# grab current kernel version
kernelver=$(uname -r | sed -r 's/-[a-z]+//')

# keep the previous, current, and next kernel and headers
dpkg -l linux-image-"[0-9]*" | awk '/ii/{print $2}' | sort | grep -B 1 -A 1 -e $kernelver > /tmp/keep-images
dpkg -l linux-headers-"[0-9]*" | awk '/ii/{print $2}' | grep -ve generic | sort | grep -B 1 -A 1 -e $kernelver > /tmp/keep-headers

# get a list of all installed kernel and headers
dpkg -l linux-image-"[0-9]*" | awk '/ii/{print $2}' | sort > /tmp/all-images
dpkg -l linux-headers-"[0-9]*" | awk '/ii/{print $2}' | grep -ve generic | sort > /tmp/all-headers

# heads up to user about actions to take
echo "Current kernel: $kernelver"
echo "Kernel images to keep:"
cat /tmp/keep-images
echo "Kernel headers to keep:"
cat /tmp/keep-headers

# calculate images and headers to purge based on diffs from files above
IMAGES=`diff --side-by-side --suppress-common-lines /tmp/all-images /tmp/keep-images | awk '{ print $1 }' | tr '\n' ' '`
HEADERS=`diff --side-by-side --suppress-common-lines /tmp/all-headers /tmp/keep-headers | awk '{ print $1 }' | tr '\n' ' '`

# purge images
echo "Removing images: $IMAGES"
sudo apt-get purge -y $IMAGES

# purge headers
echo "Removing headers: $HEADERS"
sudo apt-get purge -y $HEADERS

# OPTIONAL TASKS

# complete any installs that may have been unable to complete
# sudo apt-get install -f -y

# clean up any old packages
# sudo apt-get autoremove -y
