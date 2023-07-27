 ; Correção: 0,5
        .686
        .model flat, c
        .stack 100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2: Ptr Byte, inputlist:VARARG
        .data
in1fmt  byte "%d",0
msg1fmt byte 0Ah,"%s",0
msg2fmt byte 0Ah, "%s", 0Ah, 0
msg3fmt byte "%d " , 0
msg4fmt byte 0Ah, 0Ah, 0
msg1    byte "Write array lenght: ", 0
msg2    byte "write numbers from array: ", 0
msg3    byte "Sorted array: ", 0

n       sdword ?
array   sdword 100 dup(?)
aux     sdword ?
exchange   sdword ?
        .code
main    proc
        INVOKE printf, ADDR msg1fmt,ADDR msg1              
        INVOKE scanf, ADDR in1fmt, ADDR n

        .if n > 0                                           
        INVOKE printf, ADDR msg2fmt,ADDR msg2           
        mov ecx, n                                      
        mov esi, offset array+0
        .repeat 
            push ecx
            INVOKE scanf, ADDR in1fmt, ADDR [esi]
            add esi,4
            pop ecx
        .untilcxz
    
        .if n > 1                                       
            mov ecx, n                                 
            dec ecx
            .repeat
                push ecx
                mov esi, offset array+0
                mov exchange, 0
                .repeat
                    mov edi, esi
                    add edi, 4
                    mov eax, [esi]
                    .if eax > [edi]
                        mov edx, [edi]
                        mov [esi], edx
                        mov [edi], eax 
                        mov exchange, 1
                    .endif
                    add esi, 4
                .untilcxz
                .if exchange == 0
                    jmp else01
                .endif
            pop ecx
            .untilcxz
        .endif

else01: nop                                     
        INVOKE printf, ADDR msg1fmt, ADDR msg3          
        mov ecx , n
        mov esi, offset array+0
        .repeat
            push ecx
            mov eax, [esi]
            mov aux, eax
            INVOKE printf , ADDR msg3fmt, aux
            add esi, 4
            pop ecx
        .untilcxz
        INVOKE printf, ADDR msg4fmt                    

        .endif

        ret
main    endp
        end
