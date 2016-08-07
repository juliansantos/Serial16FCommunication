 #include "configurationBits.h"
 
 
 org 0 
main:
    banksel TRISB
    clrf TRISB
    bsf TRISB,1 ; Data diretion RX
    bsf TRISB,2
    banksel SPBRG
    movlw 0x82
    movwf SPBRG	;Setting value for 9600bps
    banksel TXSTA
    movlw 0x04
    movwf TXSTA ; High speed and asynchronous mode
    banksel RCSTA
    movlw b'10110000'; enabling reception 
    movwf RCSTA
    banksel PORTB  
    bsf PORTB,3
wait    btfss PIR1,RCIF
    goto wait
    bsf PORTB,3
    movf RCREG,W
    movwf PORTB
    goto wait
    
    goto $ 
    
 END