# EXERCÍCIO 04

> Correção: 1,5

**QUESTÃO-1**

> Correção: 0,3

A. incorreto, mude '=' por '=='.

B. incorreto, nao pode misturar conceitos de diretivas com os de instruçoes.

C. incorreto, Embora sintaticamente correto, pode não ser o que se pretendia logicamente.

D. incorreto, 'cmp' não compara dois valores, um deles tem quer armazenado no registrador. e a instrução 'Then01' está mal formatada.



**QUESTÃO-2**

> Correção: 0,3

    mov eax, a
    .if eax > b
        dec eax
        mov a, eax
    .else
        mov eax, b
        .if eax >= c
            sub eax, 2
            mov b, eax
        .else
            mov eax, c
            .if eax > d
                add eax, d
                mov c, eax
            .else
                mov eax, d
                cdq
                idiv 2
                mov d, eax
            .endif
        .endif
    .endif

**QUESTÃO-3**

> Correção: 0,3

A. 

    .if01:  cmp w, 1
            jne endif01
            cmp x, 2
            jne endif01
    then01:	dec y
    endif01	nop
    
B. 

if (num <= 0 || num > 3) {
    count = count - 2;
}

    if01:	cmp num, 0
            jle then01
            cmp num,3
            jle endif01
    then01: sub count, 2
    endif01:nop
    
C.

    if02:	cmp w,1
            je and02 :
            cmp x,2
            jne endif02
    and02:  cmp y,3
            jne endif02
    then02: inc z
    endif02:nop
    
D.

    if03:	cmp b, 2
            jne or03
            cmp c,3
            jg  then03
    or03:	cmp a, 1
            jne  or02
            cmp c,3
            jg  then03
            jle or04
    or02:	cmp b, 2
            jne endif03
    or04:	cmp d, 4
            jg endif03
            jle then03
    then03: dec e
    endif03:nop


**QUESTÃO-4**

> Correção: 0,3

A.

	mov eax, a
	.if eax <= b
		mov eax, b
		.if eax < c
			mov eax, c
			.if eax <= d
				mov eax, d
				mov ebx, 2
				cdq
				idiv ebx
				mov d, eax
			.else
				add eax, d
				mov c, eax
			.endif
		.else
			sub eax, 2
			mov b, eax
		.endif
	.else
		dec eax
		mov a, eax
	.endif	
    
B.

	mov eax, a
	if01:	cmp eax, b
		jg else01
	then01:	nop
	if02:	mov eax, b
		cmp eax, c
		jge else02
	then02:	nop
	if03:	mov eax, c
		cmp eax, d
		jg else 03
	then03:	mov eax, d
		mov ebx, 2
		cdq
		idiv ebx
		mov d, eax
	else03:	add eax, d
		mov c, eax
		jmp endif01
	endif03:nop
	else02:	sub eax, 2
		mov b, eax
		jmp endif01
	endif02:nop
	else01:	sub eax, 1
		mov a, eax
	endif01:nop




**QUESTÃO-5**

> Correção: 0,3

    switch01:   cmp number, 0
                je case11;
                cmp number, 1
                je case11;
                cmp number, 2
                je case13;
                cmp number, 3
                je case13;
                jmp endswitch01

    case11:	    mov eax, count
                add eax, 2
                mov count, eax
                jmp endswitch01
    case13:     mov eax,count
                sub eax, 2
                mov count, eax
    endswitch01: nop


