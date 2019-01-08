// P. Poliakoff 2019
//====================
// this program outputs bin values between 0x0 and 0xF to pins 2,3,4,5
// this is binary value is used as input by the CPLD that will convert it to 7 segment display

int counter=0;

void setup() {

 //set pins 2,3,4,5 (port D bits2,3,4,5) as output
 PORTD=0;
 DDRD|=B00111100 ; 
 
}

void loop() {
counter++;
if(counter>0x0F)
  {
    counter=0;
  }
PORTD=counter<<2; // the shift2 is needed to avoid to write in the first 2 bits
delay(500);
}
