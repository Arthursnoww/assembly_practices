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
n	sdword	?
a	sdword  ?
b	sdword	1
	.code
main	proc
	INVOKE printf, ADDR msg0fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR n
	.if n != 0
        .if n > 1
        mov a, 0
        mov eax, a
        mov ecx, n
        sub ecx, 1
        .repeat
        mov eax, a
        add eax, b
        mov ebx, b
        mov a, ebx
        mov b, eax
        .untilcxz
        .endif
        .endif
	INVOKE printf, ADDR msg1fmt, n, ADDR msg2, b
	ret
main	endp
	end
