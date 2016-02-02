#!/bin/bash

~/simulavr/src/simulavr -d atmega328 -F 4000000 -f test.elf -W 0x20,- -R 0x22,- -T exit

