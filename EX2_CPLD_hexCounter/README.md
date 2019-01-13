# CPLD4Arduino: Example 2 Hexadecimal Counter

## Introduction

This time instead of asking the Arduino to count we will let the CPLD perform the counting. The Arduino will only provide a clock signal.



The block diagram we want to implement is the following
![Ex2_Principle image](/images/Ex2_Principle.png)
Note: the pin numbers are the one I did choose on the CPLD.

We want the Arduino to output a clock signal, the CPLD will count those pulses with a 4 bits counter then decode those 4 bits for the 7 segment LED device to display the value.

There is also an asynchronous reset

## The Schematics

The schematics is very similar to Ex 1
![Ex2_Schematics image](/images/Ex2_Schematics.png)

![Ex2Setup image](/images/Ex2Setup.png)



## The CPLD program

The [.PLD File](/EX2_CPLD_hexCounter/CPLD_hexCounter.PLD) contains the CPLD definition.

### Pins declaration:

The pin declaration is very similar to the one used in ex1, but we have to additionally define 4 internal pins for the counter output. I have given them arbitrary numbers 90,91,92, and 93 
```
/* *************** INPUT PINS *********************/
PIN  4   =   d0  ;
PIN  43  =   clk ;
/* *************** OUTPUT PINS *********************/
PIN  18   = sega ;
PIN  19   = segb ;
PIN  20   = segc ;
PIN  21   = segd ;
PIN  24   = sege ;
PIN  25   = segf ;
PIN  26   = segg ;

PINNODE 90 =Q0;
PINNODE 91 =Q1;
PINNODE 92 =Q2;
PINNODE 93 =Q3;
```

We need to declare the counter clock and the counter reset by assigning for each of the Q? signals, the attributes .ck  (clock) and . ar (Asynchronous reset)

![Ex2_Flipflop image](/images/Ex2_Flipflop.png)

This is done by the following code:

```
[Q0..3].ck=clk;
[Q0..3].ar=d0;
```

We will now declare the counter. The counter is implemented via state machine that has 16 states. One for each counter output value:

![Ex2_StateMachine image](/images/Ex2_StateMachine.png)

This is declared in cupl as a "SEQUENCE"

````
FIELD count_bin=[Q3..0];

SEQUENCE count_bin {

present 'h'0 next 'h'1;
present 'h'1 next 'h'2;
present 'h'2 next 'h'3;
present 'h'3 next 'h'4;
present 'h'4 next 'h'5;
present 'h'5 next 'h'6;
present 'h'6 next 'h'7;
present 'h'7 next 'h'8;
present 'h'8 next 'h'9;
present 'h'9 next 'h'A;
present 'h'A next 'h'B;
present 'h'B next 'h'C;
present 'h'C next 'h'D;
present 'h'D next 'h'E;
present 'h'E next 'h'F;
present 'h'F next 'h'0;

}
````

(Note: this code is awfully repetitive. We could have avoided this repetition by using thr CUPL Preprocessor comand $REPEAT)



The last step is to define the mapping to the 7 Segment display.  We do it exactly as for Example 1:
```
TABLE count_bin=>output_seg {
'b'0000 => 'b'0000001;
'b'0001 => 'b'1001111;
'b'0010 => 'b'0010010;
'b'0011 => 'b'0000110;
'b'0100 => 'b'1001100;
'b'0101 => 'b'0100100;
'b'0110 => 'b'0100000;
'b'0111 => 'b'0001111;
'b'1000 => 'b'0000000;
'b'1001 => 'b'0000100;
'b'1010 => 'b'0001000;
'b'1011 => 'b'1100000;
'b'1100 => 'b'0110001;
'b'1101 => 'b'1000010;
'b'1110 => 'b'0110000;
'b'1111 => 'b'0111000;
}
```



## The Arduino Program

The Arduino program is a simple oscillator on pin2
The reset on pin3 is driven via the input on pin4

```C
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
```

## Deploy Everything
Now all you have to do is 
1. connect via USB both the Arduino and the ATDH1150USB
1. compile the use wincupl to compile the .PLD file and generate .jed file
1. use ATMISP to tranfer the .jed file via the ATDH1150USB to the CPLD
1. transfer the code to the arduino (at this time the LED should display counting hexadecimal numbers when you press the button the counter is reset to 0)

![Ex2Photo image](/images/Ex2Photo.jpg)

