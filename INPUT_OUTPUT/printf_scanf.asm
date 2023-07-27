 ; Correção: 0,5
        .686
        .model  flat, c 
        .stack  100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG 
        .data
msg1fmt byte    0Ah,"%d%s%d%s%d",0Ah,0Ah,0
msg1    byte    " + ",0
msg2    byte    " = ",0
x       sdword  1
y       sdword  2
z       sdword  3
        .code
main    proc
        INVOKE printf, ADDR msg1fmt, x, ADDR msg1, y, ADDR msg2, z
        ret 
main    endp
        end
