#!/bin/bash -x

DEVICE=atmega328p
# DEVICE=attiny2313

avr-gcc -Os -DF_CPU=16000000UL -mmcu=$DEVICE -c test.c -o test.o || exit

# avr-strip 

# produces an elf...
avr-gcc -mmcu=$DEVICE test.o -o test.elf || exit

avr-objcopy -O ihex -R .eeprom test.elf test.hex || exit

# dump assembly/symbols
avr-objdump -d test.elf > test.lst

# /dev/ttyS0
# avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:test.hex




