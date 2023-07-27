        
        .686
        .model flat,c
        .stack 100h
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG
printf  PROTO arg1:Ptr Byte, printlist:VARARG
        .data
        in1fmt  byte "%lf",0
        msg0fmt byte 0Ah,"%s",0
        msg1fmt byte 0Ah,"%s%6.4f",0Ah,0
        msg0    byte "Enter a positive double for x: ",0
        msg1    byte "The sum is: ",0
        msg2    byte "pelo que entendi, so era pra comparar depois que fizesse o somatorio, entao depois da coparação eu tinha que voltar o somatorio pro valor original, ou seja, subtrai pelo negativo para obter a soma apenas dos positivos"
        x       real8 ?
        sum     real8 0.0
        zero    real8 0.0 
        aux     real8 0.0
        .code

main        proc

While01:    INVOKE printf, ADDR msg0fmt, ADDR msg0
            INVOKE scanf, ADDR in1fmt, ADDR x
            fld sum
            fld x
            fadd
            fstp sum

if01:       fld zero
            fld x
            fcomip st(0), st(1)
            jbe if02
            jae While01
endif01:    nop

if02:       fld sum
            fld x
            fsub
            fstp sum
endif02:    nop

enddw01:    nop

            INVOKE printf, ADDR msg1fmt, ADDR msg1, sum 
            INVOKE printf, ADDR msg0fmt, ADDR msg2 
            ret
main        endp
            end
