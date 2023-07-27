# EXERCÍCIO DO CAPÍTULO 6

**QUESTÃO_01**

> Correção: 0,5

a. correto

b. correto
      
c. incorreto, 'rotate' não é uma instrução, use 'rol' ou 'ror'
      
d. correto
      
e. correto
      
f. incorreto, no 'xchg' pelo menos um valor tem que ta no registrador.
      
g. correto
      
h. incorreto, 'lol' instrução invalida
      
i. incorreto, para deslocamento utiliza-se 'shl' e 'shr'.
      
**QUESTÃO-02**

> Correção: 0,5

a)

      mov eax, total
      sar eax, 5
      mov total, eax
      mov eax, num
      sub eax, total
      mov answer, eax

b)

     mov eax, amount
     add eax, number
     sal eax, 2
     mov result, eax

c)

     mov eax, y
     sal eax, 3
     mov y, eax
     mov eax, z
     sar eax, 1
     add eax, y
     mov x, eax

d)

     mov eax, b
     sal eax, 2
     mov ebx, b
     sal ebx, 1
     add eax, ebx
     mov b, eax
     mov eax, a
     sar eax, 4
     sub eax, b
     mov a, eax


**QUESTÃO-03**

> Correção: 0,5

      .
      .
    push eax
	push ebx
	push ecx
	push edx
	pop eax
	pop ebx
	pop ecx
	pop edx
      .
      .
      .
