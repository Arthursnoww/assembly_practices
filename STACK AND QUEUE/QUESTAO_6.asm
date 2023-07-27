; Correção: 1,0
            .686
            .model  flat, c
            .stack  100h
printf      PROTO   arg1:Ptr Byte, printlist:VARARG
scanf       PROTO   arg2:Ptr Byte, inputlist:VARARG
            .data
msg1fmt     byte   0Ah, "%s%d", 0Ah, 0Ah, 0
msg1        byte   "The contents of the accumulator are: ", 0
in1fmt      byte    "%d", 0
temp        sdword ?
three       sdword 3
            .code
LOADACC     macro operand
            mov eax, operand   ;; load eax with the operand
            endm
ADDACC      macro operand
            add eax, operand   ;; add the operand to eax 
            endm
SUBACC      macro operand
            sub eax, operand   ;; subtract the operand from eax
            endm
STOREACC    macro operand
            mov temp, eax      ;; store eax in operand
            endm
MULTACC     macro operand
	          push ebx           ;; save ebx and ecx
            push ecx
            if (operand ne 0) and (operand ne 1)
            mov ebx, eax
            mov eax, 0
            mov ecx, operand ;; load ecx with operand
            .while ecx > 0
            add eax, ebx
            dec ecx
            .endw
            elseif operand EQ 0
            mov eax, 0
            endif
            pop ecx            ;; restore ecx and ebx
            pop ebx 
            endm
OUTACC      proc
	        push eax           ;; save ebx and ecx, and edx
            push ecx
            push edx
            INVOKE printf, ADDR msg1fmt, ADDR msg1, temp
	        pop edx            ;; save ebx and ecx, and edx
            pop ecx
            pop eax
            ret       
OUTACC      endp
INACC       macro
            push ebx
            push ecx
            push edx
            INVOKE scanf, ADDR in1fmt, ADDR temp
            mov eax, temp
            pop ebx
            pop ecx
            pop edx
            endm
main        proc 
            INACC
            MULTACC 0
            STOREACC
            CALL OUTACC
            ret
main        endp
            end  
