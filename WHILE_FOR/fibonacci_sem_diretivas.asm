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
b	sdword	?
	.code
main	proc
        INVOKE printf, ADDR msg0fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR n
if01:	cmp n, 0
	je endw01
        mov a, 0
        mov b, 1
        mov ebx, 2
while01:cmp ebx, n
        jg endw01
        mov eax, a
        add eax, b
        mov ecx, b
        mov a, ecx
        mov b, eax
        inc ebx
        jmp while01
endw01:	nop
	INVOKE printf, ADDR msg1fmt, n, ADDR msg2, b
	ret
main	endp
	end
