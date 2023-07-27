; Correção: 0,5. Agora aqui está correto. Se informar 0009, apenas FIRE ALARM é impresso.
            .686
            .model  flat, c
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
msg1fmt     byte  "%s", 0
in1fmt      byte  "%x", 0
msg2fmt     byte  "%s%x", 0Ah, 0Ah, 0
msg1        byte  0Ah, "Enter a hexadecimal number: ", 0
msg2        byte  "The hexadecimal number is ", 0
msgfire     byte  "FIRE ALARM", 0Ah, 0    
msgcarbon   byte  "CARBON MONOXIDE", 0Ah, 0    
msgpower    byte  "POWER UOTAGE", 0Ah, 0    
msgunlock   byte  "GATE UNLOCK", 0Ah, 0    
msgdoor     byte  "DOOR OPEN", 0Ah, 0 
msgwindow   byte  "WINDOR OPEN", 0Ah, 0  
dsb         dword ?
	    .code
main 	    proc
            INVOKE printf, ADDR msg1fmt, ADDR msg1
            INVOKE scanf, ADDR in1fmt, ADDR dsb
            INVOKE printf, ADDR msg2fmt, ADDR msg2, dsb
            .while dsb<=0ffh

            test dsb, 00000001b
            .if !ZERO?
            INVOKE printf, ADDR msg1fmt, ADDR msgfire
            .endif
            
            test dsb, 00000010b
            .if !ZERO?
            INVOKE printf, ADDR msg1fmt, ADDR msgcarbon
            .endif
           
            test dsb, 00000100b
            .if !ZERO?
            INVOKE printf, ADDR msg1fmt, ADDR msgpower
            .endif

            test dsb, 00000111b
            .if !ZERO?
            jmp endtest
            .endif

            test dsb, 00001000b
            .if !ZERO?
            INVOKE printf, ADDR msg1fmt, ADDR msgunlock
            .endif
		
            test dsb, 00010000b
            .if !ZERO?
            INVOKE printf, ADDR msg1fmt, ADDR msgdoor
            .endif

            test dsb, 00100000b
            .if !ZERO?
            INVOKE printf, ADDR msg1fmt, ADDR msgwindow
            .endif
endtest:    nop
            INVOKE printf, ADDR msg1fmt,ADDR msg1
            INVOKE scanf, ADDR in1fmt,ADDR dsb
            INVOKE printf, ADDR msg2fmt,ADDR msg2, dsb
            .endw 
            ret
main 	    endp
	    end
