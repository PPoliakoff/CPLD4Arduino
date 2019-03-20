# CPLD4Arduino
Interfacing Arduino with a CPLD
## Introduction

[CPLD](https://en.wikipedia.org/wiki/Complex_programmable_logic_device) (Complex Programable logic devices) are as their name indicate programmable devices that can be used to implement logic functions. This is useful to expand an arduino board with more capabilites especially more IOs or real time synchronous or asynchronous logic

Note CPLDs replace the now obsolete older programmable logic chips like the [PALs](https://en.wikipedia.org/wiki/Programmable_Array_Logic) and the [GALs](https://en.wikipedia.org/wiki/Generic_array_logic)

There is surprisingly little information on the Internet regarding the use those very useful devices with the very popular Arduino board, so I thought this little tutorial could be useful.

## Selecting a CPLD

The Arduino uno R3 board uses 5V logic and we want to be able to use a breadboard so we need a DIP package. Such device does not exist anymore (the only few remaining devices are all indicated as obsolete), so we have to find an alternative. 

I have selected the ATMEL (Microchip) [ATF1504AS](https://www.microchip.com/wwwproducts/en/ATf1504as). IT is not a DIP Package but it is valaible in PLCC 44 package for which I have found an adapter to DIP that allows to use it on breadboard


## what is needed

In addition to you usual Arduino setup, to make the projects described in this tutorial you need the following :

### Hardware

* The CPLD [ATF1504AS](https://www.microchip.com/wwwproducts/en/ATf1504as) (manufactured by microchip)
![ATF1504AS image](/images/ATF1504AS.jpg)

* The programmer [ATDH1150USB](http://www.microchip.com/DevelopmentTools/ProductDetails.aspx?PartNO=ATDH1150USB ) (manufactured by microchip or kanda)
![ATDH1150USB image](/images/ATDH1150USB.jpg)

* An adpater PLCC44 to DIP                          
![PLCC44 image](/images/PLCC.jpg)

* An adpater 10 pin header for breadboard (home made)           
![HeaderAdapter image](/images/HeaderAdapter.jpg)

* A PLCC Extractor tool          
![Extractor image](/images/Extractor.jpg)

I selected those parts because they are all easy to find, you should have have no problem to obtain them from the usual distributors (Mouser, Digikey,Farnell,...)
The only exception is the 10 pin header adapter. But this one is very easy to build


### Software
You need two software
* [WINCUPL](https://www.microchip.com/design-centers/programmable-logic/spld-cpld/tools/software/wincupl) this software is used to compile your design (.pld) file. It also offers the possibility to simulate your design.
To activate WINCUPL you need to use the serial number provided on the web page (i.e. 60008009 )

* [ATMISP](http://www.microchip.com/design-centers/programmable-logic/spld-cpld/tools/software/atmisp) this program is used to tranfer the compilation result (the .jed file) into the device via the ATDH1150USB programmer

Those softwares are both very old but I had not too many problems to make them run on Windows 10 64bits. After installing ATMISP I had a systematic error "FTD2XX.dll was not found" apparently this problem is well known on WIN64 computers. The solution is to move de FTD2XX.dll file in the Windows directory. 

Also Since they are very old programs they do not support correctly long file names. You should give your .PLD file names of max 8 characters otherwise you could end up with the mysterious error " Automation error The object invoked has disconnected from its clients"

## Building the 10 Pin Header

![HeaderStep1 image](/images/HeaderStep1.jpg)

![HeaderStep2 image](/images/HeaderStep2.jpg)

![HeaderStep3 image](/images/HeaderStep3.jpg)

## Put all together

Note : you must connect both the Arduino and the ATDH1150USB probgrammer to PC USB ports. The Arduino is only used to provide 5V to the CPLD.

I have added a LED to indicate the presence of power

This is the schematics (the kicad file of this drawing is avaialable [here](/kicad/introduction)).
![ProgSetup1 image](/images/ProgSetup1.png)

![ProgSetup2 image](/images/ProgSetup2.png)

Important: the pin 1 of the JTAG flat cable is identified by the red wire in the flat cable

![ProgSetup3 image](/images/ProgSetup3.jpg)

## tutorials
- [x] [Example 1 : 7 segment display](/EX1_CPLD_hexDisplay)
- [x] [Example 2 : Hexadecimal Counter](/EX2_CPLD_hexCounter)
- [ ] [Serial to Parallel shift register](/EX3_CLPD_shiftregister)
- [ ] multiplexed 7 segment display (still to be written)
- [ ] keyboard decoder (still to be written)
- [ ] Multiple pulse generator (still to be written)
- [ ] Serial RAM access (still to be written)
- [ ] Video generator (still to be written)
