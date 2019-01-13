/*
Ex2 CPLD HexCounter

P. Poliakoff 2019
=================
see https://github.com/PPoliakoff/CPLD4Arduino for details
*/


void setup() {

  pinMode(2, OUTPUT); //2 is the clock
  pinMode(3, OUTPUT); //3 is the RESET
  pinMode(4,INPUT_PULLUP); //4 used to trigger reset
  digitalWrite(3,LOW);
}

void loop() {
  digitalWrite(3,!digitalRead(4));
  digitalWrite(2,!digitalRead(2));
  delay(150);
}
