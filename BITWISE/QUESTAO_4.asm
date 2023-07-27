; Correção: 0,4. No caso de 0005 ser informado, ele deveria imprimir apenas Paper Jam, pois o bit 0 tem maior prioridade.
	  .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
msg1fmt   byte  "%s", 0
in1fmt    byte  "%x", 0
msg2fmt   byte  "%s%x", 0Ah, 0Ah, 0
msg1      byte  0Ah, "Enter a hexadecimal number: ", 0
msg2      byte  "The hexadecimal number is ", 0
msgjam    byte  "PAPER JAM", 0Ah, 0    
msgmiss   byte  "PAPER MISFEED", 0Ah, 0    
msgtray   byte  "PAPER TRAY EMPTY", 0Ah, 0    
msglow    byte  "TONER LOW", 0Ah, 0    
msgempty  byte  "TONER EMPTY", 0Ah, 0    
dsb       dword ?
	  .code
main 	  proc
	
	  INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR dsb
          INVOKE printf, ADDR msg2fmt, ADDR msg2, dsb
          .while dsb <= 0ffh
          
          test dsb, 00000001b
          .if !ZERO?
          INVOKE printf, ADDR msg1fmt, ADDR msgjam
          .endif
          
          test dsb, 00000010b
          .if !ZERO?
          INVOKE printf, ADDR msg1fmt, ADDR msgmiss
          .endif
          
          test dsb, 00000100b
          .if !ZERO?
          INVOKE printf, ADDR msg1fmt, ADDR msgtray
          .endif
          
          test dsb, 00001000b
          .if !ZERO?
          INVOKE printf, ADDR msg1fmt, ADDR msglow
          .endif
		
	  test dsb, 00010000b
          .if !ZERO?
          INVOKE printf, ADDR msg1fmt, ADDR msgempty
          .endif
          
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR dsb
          INVOKE printf, ADDR msg2fmt, ADDR msg2, dsb
          
          .endw
	  ret
main 	  endp
	  end
