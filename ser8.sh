#!/bin/sh

# disable display reset shortcut
gsettings set org.gnome.mutter.keybindings switch-monitor "[]"

# disable internal bluetooth
# 1. make file
# sudo vi /etc/udev/rules.d/01-disable-internal-bt.rules
# 2. paste below (double check vendor and product id)
# ACTION=="add", ATTR{idVendor}=="8087", ATTR{idProduct}=="0029", RUN="/bin/sh -c 'echo 1 > /sys/$devpath/remove'"
# 3. apply new udev rules then reboot
# sudo udevadm control --reload-rules && sudo udevadm trigger

