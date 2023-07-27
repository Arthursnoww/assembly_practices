; Correção: 0,1
        .686
        .model flat, c
	    .stack 100h
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
printf	PROTO arg1:Ptr Byte, printlist:VARARG
	    .data
in1fmt	byte "%d",0
msg0fmt	byte "%s", 0Ah, 0
msg1fmt	byte "%d%s%d", 0Ah,0
msg1	byte "digite o numero:",0
msg2	byte " corresponde ao numero da sequencia Fibonacci ",0
n	    sdword	?
a	    sdword  0
b	    sdword	1
	    .code
FIBO    macro operand
        push eax
        push ebx
        push edx
        .if n != 0
        mov ecx, 2
        .while ecx <= n
        mov eax, a
        add eax, b
        mov ebx, b
        mov a, ebx
        mov b, eax
        inc ecx
        .endw
        .endif
        pop edx
        pop ecx
        pop eax
        endm
main    proc
        INVOKE printf, ADDR msg0fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR n
        FIBO n
        INVOKE printf, ADDR msg1fmt, n, ADDR msg2, b
        ret
main    endp
        end