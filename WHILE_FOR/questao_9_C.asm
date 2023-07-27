        .686
        .model flat, c
        .stack 100h
print   PROTO arg1:Ptr Byte, printlist:VARAG
	.data
msg1fmt byte 0Ah, "%d",0
numero  sdword ?
fatorial sdword ?
	.code
main proc
        mov ecx, num
        mov eax, 1
        .repeat
        imul ecx
        .untilcxz
        mov fatorial, eax

	INVOKE printf, ADDR msg1fmt,fatorial
        ret
main    endp
        end
