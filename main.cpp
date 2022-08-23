#include <Arduino.h>
//Declaring all variables as integers
int W=0,X=1,Y=1;
int A,B,C,D;

//Code released under GNU GPL.  Free to use for anything.
void disp_7447(int D,int C,int B,int A)
{
  digitalWrite(6, A); //LSB
}
// the setup function runs once when you press reset or power the board
void setup() {
    pinMode(6, OUTPUT);  
   
}

// the loop function runs over and over again forever
void loop() {
   A = (W||X||!Y)&&(W||!X||Y)&&(!W||X||!Y)&&(!W||!X||Y);
  
disp_7447(D,C,B,A);  
}
//&& is the AND operation
// || is the OR operation
