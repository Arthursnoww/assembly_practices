   ; Correção: 0,5
            .686
            .model  flat, c 
            .stack  200h
    printf  PROTO arg1:Ptr Byte, printlist:VARARG 
    scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
            .data
    in1fmt  byte    "%d", 0
    in2fmt  byte    "%d", 0

    msg1fmt byte    "%s",0
    msg2fmt byte    "%s",0
    msg3fmt byte    0Ah,0Ah,"%s", 0Ah,0   
    msg4fmt byte    "%s%d%s", 0Ah, 0


    msg1    byte    "Enter a number: ",0
    msg2    byte    "Numbers",0
    msg3    byte    "   ",0

    num1    sdword  ?
    num2    sdword  ?

            .code
    main    proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR num1
            INVOKE printf, ADDR msg2fmt, ADDR msg1
            INVOKE scanf, ADDR in2fmt, ADDR num2
            INVOKE printf, ADDR msg3fmt, ADDR msg2
            INVOKE printf, ADDR msg4fmt, ADDR msg3, num1, ADDR msg3
            INVOKE printf, ADDR msg4fmt, ADDR msg3, num2, ADDR msg3
            ret 
    main    endp
            end
