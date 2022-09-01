
.include "/home/kalyan/kalyan1/m328Pdef.inc"
Start:

ldi r30, 0b00111100 ;identifying output pins 2,3,4,5
out DDRD,r30
ldi r16, 0b11111000  ;identifying input pins 8,9,10
out DDRB,r16          ;declaring pins as input
ldi r16,0b11111111   ;giving input
out PortB,r16
ldi r17,0b00000001
ldi r18,0b00000001
ldi r19,0b00000001

AND r17,r16          ;r17=z
LSR  r16
AND r18,r16           ;r18=y
LSR r16
AND r19,r16           ;r19=x
LSR r16

ldi r21,0b00000001	
eor r21,r17           ;r21=z'

ldi r22,0b00000001
eor r22,r18           ;r22=y'

ldi r23,0b00000001
eor r23,r19           ;r23=x'



MOV r1,r19            ;r1=x
OR r1,r21             ;r1=x+z'
MOV r2,r18
OR r2,r1		;r2=x+z'+y
mov r3,r19		;r3=x
OR r3,r22		;r3=x+y'
OR r3,r17		;r3=x+y'+z
mov r4,r18		;r4=y
OR r4,r23		;r4=y+x'
OR r4,r21		;r4=x'+y+z'
mov r5,r23		;r5=x'
OR r5,r22		;r5=x'+y'
OR r5,r17		;r5=x'+y'+z
mov r30,r5		
AND r30,r4
AND r30,r3
AND r30,r2
LSL r30
LSL r30

out PortD,r30

rjmp Start

