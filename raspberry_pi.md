# Using Raspberry pi 4 as desktop

Sharing the experience of using Pi4 as a desktop for  moderate programmatic/casual browsing workload.
Installation and setup of Mate [3] went without any hiccups.  The overall response of the system was for most part comparable to couple of years old  laptop (there was little bit of additional lag when opening an application). 
Some applications like Calibre, Ionide, Brave, Nyxt didn't work either to due graphics/UI configuration or dependency on x86 bits. 

In the end, there was mainly two main stumbling blocks for PI being a desktop: 1) dragging windows around was clumsy and would leave a trail of dark unrefreshed dark border and 2) firefox was slow enough to the point of being mildly annoying. To fix latter,I started hunting around for an alternative lightweight browser. This turned out to be fruitful endeavour: From [2], I figured that part  of the reason for slowish UI response was that the system may not have been using the Pi GPU (called Mali) due to lack of driver. Once I fixed that, both UI and Firefox became bit more nimble. After unsuccessfully trying out alternative browsers, Brave, Nyxt, eww,  I came across qutebrowser which was truly a game changer. This browser blocks many tracking stuff on the page due to which it was not just fast but clearly outperformed all browser hardware combo I have used in the past.

The next big usage improvement came by switching from gnome to xfce4+i3. This is bit tricky to install (see [1]). But works smoothly and obliviated  the need for dragging windows around the screen. All in all, turning on gpu and using qutebrowser and xfce+i3, the experience of desktop on pi surpassed that of  linux or mac on more high end and mainstream hardware.

[1] https://cdaringe.com/i3-xfce
[2] https://www.dedoimedo.com/computers/rpi4-ubuntu-mate-hw-video-acceleration.html
[3] https://ubuntu-mate.org/ports/raspberry-pi/
