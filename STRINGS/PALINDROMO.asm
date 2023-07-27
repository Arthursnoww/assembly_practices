; Correção: 1,0
            .686
            .model  flat, c
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
.data
msg1fmt     byte    "%s",0Ah, 0
in1fmt      byte    "%s", 0
msg1        byte    "Insira a palavra: ", 0
msg2        byte    "A string e palindroma.", 0
msg3        byte    "A string nao e palindroma.", 0
arraystr    byte    "aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa aaaaaaaaaa"
lenght      sdword  10
found       sdword  0
temp1       sdword  0
temp2       sdword  0
temp3       sdword  0
.code 
main        proc
            lea esi, arraystr
            lea edi, arraystr + 9
            mov eax, 0
            .while(temp1 < 10)
            mov found, 0
                mov ecx, 4
                .repeat
                    mov al, [edi]
                    mov ah, [esi]
                    .if(al != ah)
                        mov found, -1
                    .endif
                    inc esi
                    dec edi
                .untilcxz
                add esi, 7
                add edi, 15
                mov temp2, esi
                mov temp3, edi
                .if(found <= -1)
                        INVOKE printf, ADDR msg1fmt, ADDR msg3
                    .else
                        INVOKE printf, ADDR msg1fmt, ADDR msg2
                .endif
                mov esi, temp2
                mov edi, temp3
                inc temp1
            .endw
            ret
main        endp
            end
