
 
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
