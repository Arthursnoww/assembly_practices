        .686
        .model flat, c
        .stack 100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte 0Ah,"%s",0Ah,0Ah,0
in1fmt  byte "%lf", 0
array   real8 5 dup (?)
msg2fmt byte " %3.1f",0Ah,0
msg1    byte "Array",0
msg2    byte "Insira o número: ",0
n       sdword 5

        .code
main    proc
        mov ecx, n
        mov ebx, 0
        .repeat
        push ecx
        INVOKE printf, ADDR msg1fmt, ADDR msg2
        INVOKE scanf, ADDR in1fmt, ADDR array[ebx]
        pop ecx
        add ebx, 8
        .untilcxz
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        lea esi,array
        mov ecx,n
        .repeat
        push ecx
        INVOKE printf, ADDR msg2fmt, real8 ptr [esi]
        pop ecx
        add esi,8
        .untilcxz
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        mov ebx,0
        mov ecx,n
        .repeat
        push ecx
        INVOKE printf, ADDR msg2fmt, array[ebx]
        pop ecx
        add ebx,8
        .untilcxz
        ret
main    endp
        end
