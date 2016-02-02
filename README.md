
#### Refs
  https://balau82.wordpress.com/2011/03/29/programming-arduino-uno-in-pure-c/
  http://reprap.org/wiki/SimulAVR
  http://www.nongnu.org/simulavr/intro.html

#### Install

apt-get install gcc-avr
apt-get install avr-libc
apt-get install avrdude


### Install Simulavr 

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

####

OLD

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

