#!/bin/bash
#
# AUTHOR: SG4YK
# SCRIPT: vgaswitch.sh
# DATE: 06-19-2019
# PLATFORM: linux

POWERSTA=$(acpi -a)
if [ "$POWERSTA" == "Adapter 0: on-line" ]
then
   echo "Current Power Status: AC"
   echo "Switching to NVIDIA graphic"
   rm -rf /etc/X11/*
   cp -r /usr/share/vgaswitch/config/nvidia/* /etc/X11/
   echo "#!/bin/bash" > /usr/share/sddm/scripts/Xsetup
   echo "xrandr --setprovideroutputsource modesetting NVIDIA-0" >> /usr/share/sddm/scripts/Xsetup
   echo "xrandr --auto" >> /usr/share/sddm/scripts/Xsetup
   
else
   echo "Current Power Status: Battery"
   echo "Switching to Intel graphic"
   rm -rf /etc/X11/*
   cp -r /usr/share/vgaswitch/config/intel/* /etc/X11/
   echo "#!/bin/bash" > /usr/share/sddm/scripts/Xsetup
fi

