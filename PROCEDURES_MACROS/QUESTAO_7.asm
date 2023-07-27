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
DIVACC      macro operand
            push ebx
            push edx
            if(operand ne 0) and (operand ne 1)
                mov edx, eax
                mov eax, 0
                mov ebx, operand
                if operand LT 0
                neg ebx
                endif
                .while edx > 0
                sub edx, ebx
                add eax, 1
                .endw
                if operand LT 0
                neg eax
                endif
            elseif operand eq 0
                mov eax, -1
            endif
            pop ebx
            pop edx
            endm
STOREACC    macro operand
            mov temp, eax      ;; store eax in operand
            endm
MULTACC     macro operand
	        push ebx           ;; save ebx and ecx
            push ecx
            mov ebx, eax       ;; mov eax to ebx
            mov eax, 0         ;; clear accumulator to zero
            mov ecx, operand   ;; load ecx with operand
            if operand LT 0    ;; if operand is negative
            neg ecx            ;; make ecx positive for loop
            endif   
            .while ecx > 0
            add eax, ebx       ;; repetitively add 
            dec ecx            ;; decrement ecx
            .endw    
            if operand LT 0    ;; if operand is negative
            neg eax            ;; negate accumulator, eax
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
            ADDACC 5
            SUBACC 1
            DIVACC 2
            STOREACC
            CALL OUTACC
            ret
main        endp
            end  