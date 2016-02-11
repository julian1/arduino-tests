#!/bin/bash -x

NAME=$1

DEVICE=atmega328p
# DEVICE=attiny2313

avr-gcc -Os -DF_CPU=16000000UL -mmcu=$DEVICE -c $NAME.c -o $NAME.o || exit

# avr-strip 

# produces an elf...
avr-gcc -mmcu=$DEVICE $NAME.o -o $NAME.elf || exit

avr-objcopy -O ihex -R .eeprom $NAME.elf $NAME.hex || exit

# dump assembly/symbols
#avr-objdump -d $NAME.elf > $NAME.lst

# /dev/ttyS0
# avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:$NAME.hex




