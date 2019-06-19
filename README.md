# VGA_autoswitch
## Description
A service which can select video card for output automaticallydepending on power status. Generally for laptops have both Intel and dedicated Nvidia GPUs sharing the same physical screen.
By changing the configuration file of xorg and your display manager on startup, the xorg uses Nvidia graphic card globally to provide better performance. It uses
## Dependencies
+ systemd
+ xorg
+ sddm
+ **2** stand-alone xorg configuration for Intel and Nvidia, both shoud be able to work normally on your own laptop
>NOTE:
1.Other display managers will be supported in the future.  
2.Uninstall bumblebee and PRIME if you have them installed, which may have conflict.


## Usage
Clone this repo
~~~bash
$ git clone https://github.com/SG4YK/VGA_autoswitch.git
$ cd VGA_autoswitch
~~~

For the Intel configuration file, copy everything under <code>/etc/X11</code> to <code>VGA_autoswitch/vgaswitch/config/intel</code>  
For the Nvidia configuration file, copy everything under <code>/etc/X11</code> to <code>VGA_autoswitch/vgaswitch/config/nvidia</code>
You can do this by executig
~~~bash
$ cp -r /etc/X11/* ./vgaswitch/intel
or
$ cp -r /etc/X11/* ./vgaswitch/nvidia
~~~

**Please make sure either of the configurations works fine.**  

If you have custom scripts for sddm in <code>Xsetup</code>, remember to edit <code>./vgaswitch/vgaswitch.sh</code> as well.  

Then
~~~bash
$ sudo cp -r ./vgaswitch /usr/share/
$ sudo cp ./vgaswitch.service /etc/systemd/system/multi-user.target.wants/
~~~

Enable the service 
~~~bash
$ sudo systemctl enable vgaswitch
~~~

Once you restart your system, it should be able to work.
