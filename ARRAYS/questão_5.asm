; Correção: 1,0
          .686
          .model  flat, c
          .stack  100h
printf    PROTO   arg1:Ptr Byte, printlist:VARARG
scanf     PROTO   arg2:Ptr Byte, inputlist:VARARG
          .data
msg1fmt   byte    "%s",0Ah, 0
msg2fmt   byte    0Ah, "%s", 0Ah, 0Ah, 0
msg3fmt   byte    "   %d", 0
in1fmt    byte    "%d", 0
msg1      byte    "Insira 20 valores inteiros para o primeiro array: ", 0
msg2      byte    "Conteudo do segundo array: ", 0
msg3      byte    "Reversed", 0
msg4      byte    "No data entered."
n         sdword  ?
i         sdword  20
array1     sdword  20 dup (?)
array2     sdword  20 dup (?)

          .code
main      proc


          INVOKE printf, ADDR msg1fmt, ADDR msg1
          mov ecx, 20
          mov ebx, 1
          .repeat
          push ecx      ; save ecx
          INVOKE scanf, ADDR in1fmt, ADDR array1[ebx] ; poderia declarar ja o vetor,  para nao perder tempo digitando os numeros na entrada,
          pop ecx       ; restore ecx                             mas na ultima avaliação perdi ponto por não usar scanf 
          add ebx, 4
          .untilcxz

          ;passar conteudo de uma array para outra
          mov ecx, 20
          mov ebx, 1
          .repeat
          mov eax, array1[ebx]
          mov array2[ebx], eax
          add ebx, 4
          .untilcxz

          
          INVOKE printf, ADDR msg1fmt, ADDR msg2
          mov ecx, 20
          mov ebx, 1
          .repeat
          push ecx      ; save ecx
          INVOKE printf, ADDR msg3fmt, array2[ebx]
          pop ecx       ; restore ecx
          add ebx, 4
          .untilcxz
          ret
main      endp
          end
