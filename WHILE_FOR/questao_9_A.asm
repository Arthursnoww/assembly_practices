 ; Correção: 0,8. Nós já aprendemos a utilizar o scanf. 
        .686
        .model flat, c
        .stack 100h
print   PROTO arg1:Ptr Byte, printlist:VARAG
	.data
msg1fmt byte 0Ah, "%d",0
numero  sdword ?
fatorial sdword ?
i       sdword ?
	.code
main proc
        mov ebx, num
        mov i, 2
        mov eax, 1
        .while i<=ebx
        imul i
        add i, 1
        .endw
        mov fatorial, eax
        INVOKE printf, ADDR msg1fmt,fatorial
        ret
main    endp
        end
