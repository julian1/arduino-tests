
Ok, both usb to uart are pl2303 chips

- pins are
dtr
txo
rxi
vcc
gnd
gnd


meteo@dell-home:~/arduino-tests$ s avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyUSB0 -b 57600 -U flash:w:test.hex 

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.00s

avrdude: Device signature = 0x1e950f (probably m328p)
avrdude: NOTE: "flash" memory has been specified, an erase cycle will be performed
         To disable this feature, specify the -D option.
avrdude: erasing chip
avrdude: reading input file "test.hex"
avrdude: input file test.hex auto detected as Intel Hex
avrdude: writing flash (270 bytes):

Writing | ################################################## | 100% 0.10s

avrdude: 270 bytes of flash written

avrdude: safemode: Fuses OK (E:00, H:00, L:00)

avrdude done.  Thank you.

-----
And it stopped blinking.

Now we should try to reset. and see if it responds.


Ok, we want a reset



----

#### Refs
  https://balau82.wordpress.com/2011/03/29/programming-arduino-uno-in-pure-c/

  http://reprap.org/wiki/SimulAVR

  http://www.nongnu.org/simulavr/intro.html

#### Install
```
apt-get install gcc-avr
apt-get install avr-libc
apt-get install avrdude
```

#### Install Simulavr
```
# Traumflug/simulavr version is much easier
git clone https://github.com/Traumflug/simulavr
cd simulavr
git checkout traumflug
sudo apt-get install libtool-bin
./bootstrap
./configure
make
./src/simulavr -f  examples/simple_serial/simple_serial.elf
<works>
```

#### Old Simulavr / dependencies
```
http://download.savannah.nongnu.org/releases/simulavr/simulavr-1.0.0.tar.gz
tar xf simulavr-1.0.0.tar.gz

apt-get install libbfd-dev
cd simulavr-1.0.0

configure --with-bfd=/usr/lib/avr/x86_64-linux-gnu/
s apt-get install libiberty-dev
export LIBS=-ldl
./configure  --with-bfd=/usr/lib/avr/x86_64-linux-gnu/ --with-libiberty=/usr/lib/x86_64-linux-gnu
./simulavr-1.0.0/src/simulavr -d atmega128 -f led.elf -W 0x20,- -R 0x22,- -T exit
sudo apt-get install texinfo
worked.
```
