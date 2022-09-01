#include <avr/io.h>
#include <stdbool.h>
#include <util/delay.h>
int main (void)
{

 bool a=0,b=0,c=0,f=0;
 DDRB =  0b00100000;  //  13 pin as output 
 DDRD =  0b11100011;
 PORTD = 0b00011100;   // 2,3,4 as inputs
 

while(1)
{  

a= (PIND & (1 << PIND2)) == (1 << PIND2);
b= (PIND & (1 << PIND3)) == (1 << PIND3);
c=(PIND & (1 << PIND4)) == (1 << PIND4);
f=(a||b||!c)&&(a||!b||c)&&(!a||b||!c)&&(!a||!b||c);
PORTB |= (f<< 5);
}
return 0;
}
