# sd_to_usb_boot

Inspired by: https://learn.adafruit.com/external-drive-as-raspberry-pi-root/

## What is this?

This is an automated tool to make your Raspberry Pi run the OS from any USB device. Simply insert a USB device, boot your Pi into console only mode and run the install script, sit back and relax!

Your SD card is still needed to start the boot process, but once the kernel is loaded control is passed over to the USB device. An additional pair of tools are installed to keep the SD card /boot partition in sync with a virtual /boot partition on the USB media for compatibility and ease of use.

Once you are happy with the conversion you may reuse the old OS partition on the SD card for something else, or get a smaller SD card (even as small as 128MB would be fine), format it as FAT32, move your /boot partition to it and use that!

## How do I use it?

git clone this repo, change to the sd_to_usb_boot directory and then run:
```
sudo ./install.sh
```

Make sure you read all of the warnings and follow the instructions. Take backups first!

## Is there not official USB boot support on the Pi 3? Why would I use this?

Yes there is official USB boot support on the Pi 3 (I have not tested that myself) however it has issues with many devices according to the Raspberry Pi Foundation. This script is almost guarenteed to work as the original kernel still boots from the SD card, but it is then told to use the USB device as the root file system. It also works with any Raspberry Pi. The only negative thing is the requirement for an SD card of some kind to be left inserted - but once the Pi has finished booting, the card is UNTOUCHED and unmounted (you can even pull it out, although I would not recommend it).

The only other downside is that because I want the SD card completely dismounted during operation, /boot must be dismounted. To make things painless (allow software that demands that /boot is mounted to work, allow editing cmdline.txt during use etc), the Pi will synchronise the contents of the SD card /boot partition with a virtual /boot on the USB device during the boot sequence (this takes <1 second) then dismount the SD card. You are then editing a virtual /boot partition. This can be synchronised on demand back to the SD card by running the rpi-usbbootsync tool.

A positive point is that because the SD card /boot partition takes precedence, so if things get screwed up you can fix things the old fashioned way. Stick the SD card in a card reader and edit files as necessary, and they will synchronise back to the virtual /boot partition on the next boot.