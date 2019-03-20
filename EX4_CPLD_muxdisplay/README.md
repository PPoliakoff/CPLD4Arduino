# CPLD4Arduino: Example 4 Mulptiplexed display

## Introduction

When you have many LEDs to control, to reduce the number of wires, it is often recommended to multiplex them. 

In this example we will use the CPLD to drive three multplexed 7segment displays
Since the display is multiplexed, only one digit is lit at any time. To give the illusion of all displays being active the system must quickly scan through all displays. The Arduino could do certainly do it but we will ask the CPLD to do it instead to free the arduino for other tasks.




The block diagram we want to implement is the following
![Ex2_Principle image](/images/Ex4_Principle.png)
Note: the pin numbers are the one I did choose on the CPLD.

The clk2 is used to refresh the display we will use an Arduino PWM but any clock would be ok)

The data is loaded as explained in ex3 via the Data, clk1, and load pins
The systeme expect 12 bits of data.

## The Schematics

The schematics is the following (I have omitted the JTAG connector to keep it simple)
![Ex2_Schematics image](/images/Ex4_Schematics.png)





## The CPLD program

### Pins declaration:

The pin declaration 