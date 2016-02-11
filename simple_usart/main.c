/*
 * Demonstration on how to redirect stdio to UART. 
 *
 * http://appelsiini.net/2011/simple-usart-with-avr-libc
 *
 * To compile and upload run: make clean; make; make program;
 * Connect to serial with: screen /dev/tty.usbserial-*
 *
 * Copyright 2011 Mika Tuupola
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 */
 
#include <stdio.h>

#include "main.h"
#include "uart.h"

int main(void) {    

    uart_init();
    stdout = &uart_output;
    stdin  = &uart_input;

    while(1) {
        fputs("> ", stdout);

        char ch = 0;
        while(ch != '\n' ) {
          ch = getchar();
          fputc(ch, stdout);
        }
    }

    // what happens if we fall out the event-loop?        
    return 0;
}
