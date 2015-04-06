#!/bin/bash
# mount-iso.sh: mount ISOs using udisksctl
##
#  Copyright (C) 2015 Aaditya Bagga (aaditya_gnulinux@zoho.com)
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#
#  This program is distributed WITHOUT ANY WARRANTY;
#  without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#  See the GNU General Public License for more details.
##

iso_path=$1	# path to ISO file passed as argument

if [ -z "$iso_path" ]; then
	# Silently exit
	exit 1
fi

# The following does not seem to work for some devices;
# specifically those that are created like /dev/loop5p1
output=$(udisksctl loop-setup -r -f "$iso_path")	# loop mount, read-only, specified file

# Get device name from output
device=$(echo "$output" | grep -o "loop[0-9]*")

# Check if device was created like /dev/${device}p1
if [ -e "/dev/${device}p1" ]; then
	udisksctl mount -b "/dev/${device}p1" > /dev/null  # block mount the device
fi

# Done
exit $?
