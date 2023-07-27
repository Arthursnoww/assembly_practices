; Correção: 0,5
        .686
        .model flat, c
        .stack 100h
printf 	PROTO arg1:Ptr Byte, printlist:VARARG
scanf 	PROTO arg2: Ptr byte, inputlist:VARARG
	.data
ini1fmt byte "%d",0
msg1fmt byte 0Ah, "%s",0
msg1 	byte "Enter the number of amperes: ",0
msg2fmt byte 0Ah, "%s",0
msg2 	byte "Enter the number of ohms: ",0
msg3fmt byte 0Ah,"%s%d",0Ah,0Ah,0
msg3 	byte "The number of volts is: ",0
msg4fmt byte 0Ah,"%s%d",0Ah,0Ah,0
msg4 	byte "The number of watts is: ",0
amperes sdword ?
ohms 	sdword ?
watts 	sdword ?
volts 	sdword ?
	.code
main proc
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR ini1fmt, ADDR amperes
        INVOKE printf, ADDR msg2fmt, ADDR msg2
        INVOKE scanf, ADDR ini1fmt, ADDR ohms
        mov eax, amperes
        mov ebx, ohms
        imul ebx
        mov volts, eax
        mov eax, volts
        mov ebx, amperes
        imul ebx
        mov watts, eax
        INVOKE printf, ADDR msg3fmt, ADDR msg3, volts
        INVOKE printf, ADDR msg4fmt, ADDR msg4, watts
        ret
main    endp
	end
