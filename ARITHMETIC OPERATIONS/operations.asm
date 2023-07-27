; Correção: 0,5
        .686
        .model flat, c
        .stack 100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
        .data
ini1fmt byte "%d",0
msg1fmt byte 0Ah, "%s",0
msg3fmt byte 0Ah, "%s%d",0Ah,0Ah,0
msg1    byte "Enter a integer: ",0
msg3    byte "the integer is: ",0
number  sdword ?
	      .code
main proc
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR ini1fmt, ADDR number
        mov eax, number
        mov ebx,3
        imul ebx
        mov ebx,7
        sub ebx,eax
        mov number,ebx
        INVOKE printf, ADDR msg3fmt, ADDR msg3, number
        ret
main    endp
        end
