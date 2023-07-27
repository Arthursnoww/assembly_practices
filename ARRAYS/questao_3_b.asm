; Correção: 0,5
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
          .data
msg1fmt   byte    "%d ", 0
msg2fmt   byte    0Ah, 0
num       sdword  10, 20, 30, 40, 50
n         sdword  5

          .code
pnum      macro
          pushad
          mov ecx, 5
          mov ebx, offset num + 0
          .repeat
          mov eax, [ebx]
          pushad
          INVOKE printf, ADDR msg1fmt, eax
          popad
          add ebx, 4
          .untilcxz
          INVOKE printf, ADDR msg2fmt
          popad
          endm
main      proc

          pnum 

          mov ebx, 0 ; assumindo que o primeiro indice é 0
          mov eax, num[ebx+8] ; indice 2 
          mov num[ebx+4], eax  ; indice 1

          pnum
          
          ret
main      endp
          end 







