; Correção: 0,1
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
in1fmt    byte  "%d", 0
msg1fmt   byte  "%s", 0
msg2fmt   byte  "%s%d", 0Ah, 0Ah, 0
msg1      byte  "Enter number: ", 0
msg2      byte  0Ah, "The number is: ", 0
n         sdword ?
i         sdword ?
fat       sdword ?
          .code
fatorial  macro
          mov ebx, n
          mov i, 2
          mov eax, 1
          .while i<=ebx
          imul i
          add i, 1
          .endw
          mov fat, eax
          endm
main      proc
          INVOKE printf, ADDR msg1fmt, ADDR msg1
          INVOKE scanf, ADDR in1fmt, ADDR n
          fatorial
          INVOKE printf, ADDR msg2fmt, ADDR msg2, fat
          ret
main      endp
          end    
