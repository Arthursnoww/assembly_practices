    ; Correção: 0,5
            .686
            .model  flat, c 
            .stack  200h
    printf  PROTO arg1:Ptr Byte, printlist:VARARG 
    scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
            .data
    in1fmt  byte    "%d", 0
    in2fmt  byte    "%d", 0
    in3fmt  byte    "%d", 0
    msg1fmt byte    "%s",0
    msg2fmt byte    "%s",0
    msg3fmt byte    "%s",0
    msg4fmt byte    0Ah,0Ah,"%d%s%d%s%d",0Ah,0Ah,0Ah,0
    msg5fmt byte    "%d%s%d%s%d",0Ah,0
    msg6fmt byte	0Ah,"%s",0


    msg1    byte    "Enter a number: ",0
    msg2    byte    "Enter a larger number: ",0
    msg3    byte    "Enter an even larger",0
    msg4    byte    " < ",0
    msg5    byte    " > ",0
    msg6	  byte	"number: ",0
    num1    sdword  ?
    num2    sdword  ?
    num3    sdword  ?
            .code
    main    proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR num1
            INVOKE printf, ADDR msg2fmt, ADDR msg2
            INVOKE scanf, ADDR in2fmt, ADDR num2
            INVOKE printf, ADDR msg3fmt, ADDR msg3
            INVOKE printf, ADDR msg6fmt, ADDR msg6
            INVOKE scanf, ADDR in3fmt, ADDR num3
            INVOKE printf,ADDR msg4fmt, num1, ADDR msg4, num2, ADDR msg4, num3
            INVOKE printf,ADDR msg5fmt, num3, ADDR msg5, num2, ADDR msg5, num1
            ret 
    main    endp
            end
