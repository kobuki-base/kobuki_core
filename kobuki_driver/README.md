Kobuki Driver
=============

[[Preparing the Connection](#preparing-the-connection)]

This package provides pure c++ libraries for connecting to and building your own programs for the Kobuki.

## Preparing The Connection

Kobuki's connection is via an FTDI USB-Serial converter ([FT232R](http://www.ftdichip.com/Products/ICs/FT232R.htm)). For this to be functional:

1. The kernel must have loaded or built in the [ftdi_sio](http://ftdi-usb-sio.sourceforge.net/) module. On most linux systems, e.g. Ubuntu, this comes by default. In contrast, for most embedded systems, you'll need to flag this when building your kernel.
2. (Optional) Install the udev rule so that your Kobuki shows up on `/dev/kobuki`. If you have installed via deb, it will have installed this rule for you. Otherwise, download these sources and:

```
> sudo cp 60-kobuki.rules /etc/udev/rules.d
> sudo service udev reload
> sudo service udev restart
```

3. Ensure you are in the correct group. You can discover this by tracing back from `/dev/kobuki`:

```
> ls -l /dev/kobuki
lrwxrwxrwx 1 root root 7 Jan 14 22:17 /dev/kobuki -> ttyUSB0
> ls - l /dev/ttyUSB0
crw-rw-rw- 1 root dialout 188, 0 Jan 14 22:17 /dev/ttyUSB0
> sudo addgroup $(USER) dialout
```

To troubleshoot further, refer to [kobuki_ftdi/README.md](https://github.com/kobuki-base/kobuki_ftdi/blob/devel/README.md).

Testies 1 2 3 4
