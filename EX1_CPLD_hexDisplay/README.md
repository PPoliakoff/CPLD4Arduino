# CPLD4Arduino: Example 1 Hexadecimal Single Digit Decoder
Interfacing Arduino with a CPLD
## Introduction

This is the first CPLD program we write so let's keep things simple.
We will make a decoder that inputs a 4 bits value eand convert it into a 7 segment display output.

This is a pure combinatory logic design (nothing is memorized). Each output is just a logic combination of input signals.

The block diagram we want to implement is the following
![Ex1_Principle image](/images/Ex1_Principle.png)
Note: the pin numbers are the one I did choose on the CPLD.

## The Schematics

We want the arduino to output a binary number, the CPLD to decode it and the 7 segment LED device to display it

![Ex1_Schematics image](/images/Ex1_Schematics.png)

The Segemnts pinout vary from one manufacturer to another. Please check your datasheet to know which one is applicable for your device. It may not be the same as mine.

![Ex1Setup image](/images/Ex1Setup.png)

![Ex1Photo image](/images/Ex1Photo.jpg)
## Programming the CPLD

The [.PLD File](/EX1_CPLD_hexDisplay/BINTO7SEG2.PLD) is divided in 3 parts:
The introduction, the Pin declaration, and the implementation

### The introduction

This part is automatically created by the wincupl editor.
All the fields are straigh forward to fill (and their value is not really important)
The only critcal field is the device type: you have to specify not only the device name (ATF1504) but also its package (PLCC44) and the fact that you program it via ISP (and not an external programmer)

```
Device   f1504ispplcc44 ;
```


### The pin declaration
You declare the pins with the following syntax
```
PIN <pin number> = <signal name> ;
```

it does not matter if the pin is input or output, the declaration syntax is the same. To declare the pins as described in the block diagram we need the following code:

```
/* *************** INPUT PINS *********************/
PIN  4   =   d0   ; 
PIN  5   =   d1   ; 
PIN  6   =   d2   ; 
PIN  8   =   d3   ; 

/* *************** OUTPUT PINS *********************/
PIN  18   = sega  ; 
PIN  19   = segb  ; 
PIN  20   = segc  ; 
PIN  21   = segd  ; 
PIN  24   = sege  ; 
PIN  25   = segf  ; 
PIN  26   = segg  ; 
```



### The implementation

It is in the implementation part that we declare the combinatory logic:

The logic to implement is the following:


|Input (d3 d2 d1 d0) | Output (A B C D E F G) |
| :---: | :---: |
|0000  |0000001|
|0001  |1001111|
|0010  |0010010|
|0011  |0000110|
|0100  |1001100|
|0101  |0100100|
|0110  |0100000|
|0111  |0001111|
|1000  |0000000|
|1001  |0000100|
|1010  |0001000|
|1011  |1100000|
|1100  |0110001|
|1101  |1000010|
|1110  |0110000|
|1111  |0111000|

We could implement that by explicitely writing the logic equeations using the logic operators

| operator | symbol | Example |
| :---: | :---:| :---: |
| NOT | ! | u = !a; |
| AND | & | u = a & b; |
| OR | # | u = a # b; |
| XOR | $ | u= a$ b; |

We can then write the equation for each segment

For instance for the G segment we can write
```
segg =>   ( !d1 & !d2 & !d3 ) # (!d0 & !d1 & d2 & d3) # (d0 & d1 & d2 & !d3) ;
```

But having to write 7 such equations is not really funny and could lead to hard to find errors.
However CUPL offers a way to directly implement directly the table mapping the input binary values to the output.

To do that you first declare the input and output verctors (aka FIELDS)
```
FIELD input_bin=[d3,d2,d1,d0];
FIELD output_seg=[sega,segb,segc,segd,sege,segf,segg];
```
Then you declare the mapping table

```vhdl
TABLE input_bin=>output_seg {
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


## The arduino program

The Arduino program is a simple counter that output its value on the pins D2,D3,D4,D5
(we avoid to use the pins D0, and d1 because they are reserved for the serial communication)

```C
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
```

## Deploy Everything
Now all you have to do is 
1. connect via USB both the Arduino and the ATDH1150USB
1. compile the use wincupl to compile the .PLD file and generate .jed file
1. use ATMISP to tranfer the .jed file via the ATDH1150USB to the CPLD
(at this step the LED should display "F" )
1. transfer the code to the arduino (at this time the LED should display counting hexadecimal numbers)
