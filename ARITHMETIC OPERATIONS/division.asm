 ; Correção: 1,0
        .686
        .model flat, c
        .stack 100h
printf 	PROTO arg1:Ptr Byte, printlist:VARARG
scanf 	PROTO arg2: Ptr byte, inputlist:VARARG
	.data
ini1fmt byte "%d",0
msg1fmt byte 0Ah, "%s",0
msg1 	byte "Enter the degrees in Fahrenheit: ",0
msg3fmt byte 0Ah,"%s%d",0Ah,0Ah,0
msg3 	byte "The degrees in celsius is: ",0
Fahrenheit sdword ?
Celsius sdword ?
	.code
main proc
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR ini1fmt, ADDR Fahrenheit
        mov eax, Fahrenheit
        sub eax, 32
        mov ebx, 9
        cdq
        idiv ebx
        imul eax, 5
        mov Celsius, eax
        INVOKE printf, ADDR msg3fmt, ADDR msg3, Celsius
        ret
main    endp
	end
