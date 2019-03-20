# CPLD4Arduino: Example 3 Shift Register

## Introduction

It is well known that to increase the number of output pins on an Arduino, you can use a 74HCT595. This very common chip is a shiht register that allows to convert 3 Arduino outputs into 8 digital outputs. You can even cascade many 74HCT595 to get more outputs

With our ATF1504 CPLD we can exploit the many pins of the chip to get 28 digital outputs instead of 8.

The block diagram we want to implement is the following
![Ex3_Principle image](/images/Ex3_Principle.png)

The ATF1504AS in PLCC44 with ISP active is limited to 28 outputs 
4 pins for VCC
4 pins for GND
4 pins for ISP
and 4 pins are input only (they will be used for data,clock, and load)
the remaining 28 pins shall b e used as the shift register output 
(note that we don't have enough pins to create a data out that would be used for cascading so data out won't be supported)

WARNING: be very careful with the pin assignation! if you assign input only pins with a digital output signal, the fitter will silently reassign the pins leading to a chip that does not have the expected pin allocation!
That's why you should always check the .fit file to verify that everything is correct

This is the fitter output: we can check that everything is OK

                              c                                  
                              l  d    l                          
                           V  o  a    o  G  q  q                 
                  q  q  q  C  c  t    a  N  2  2                 
                  2  1  0  C  k  a    d  D  7  6                 
               ____________________________________              
              /   6  5  4  3  2  1 44 43 42 41 40  \             
         TDI |  7                                39 | q25        
          q3 |  8                                38 | TDO        
          q4 |  9                                37 | q24        
         GND | 10                                36 | q23        
          q5 | 11                                35 | VCC        
          q6 | 12            ATF1504             34 | q22        
         TMS | 13          44-Lead PLCC          33 | q21        
          q7 | 14                                32 | TCK        
         VCC | 15                                31 | q20        
          q8 | 16                                30 | GND        
          q9 | 17                                29 | q19        
             |   18 19 20 21 22 23 24 25 26 27 28   |            
              \____________________________________/             
                 q  q  q  q  G  V  q  q  q  q  q                 
                 1  1  1  1  N  C  1  1  1  1  1                 
                 0  1  2  3  D  C  4  5  6  7  8                 





## The Schematics

The schematics is the following (I have omitted the JTAG connector to keep it simple)
![Ex3_Schematics image](/images/Ex3_Schematics.png)

Note that I have used 74HCT541 buffers to reduce the amount of current comming out of the CPLD. and that I have noly wired the first 16 bits because my breadboard was full.



## The CPLD program

### Pins declaration:

The pin declaration 

Using macros in wincupl

The simulation

## The Arduino program
To write to the shift register, I have created a C++ class that implement a write method. the code is the following

      class Shift_register
      {
         private:
            int _clock,_data,_load;
            int _length;
         public:
            Shift_register(int clock_pin,int data_pin,int load_pin,int register_length);
            void write(unsigned long data);
      };


      Shift_register::Shift_register(int clock_pin,int data_pin,int load_pin,int register_length)
      {
         _clock=clock_pin;
         _data =data_pin;
         _load =load_pin;
         _length=register_length;
         pinMode(_clock, OUTPUT);
         pinMode(_data , OUTPUT);
         pinMode(_load , OUTPUT);
      }

      void Shift_register::write(unsigned long data)
      {
         digitalWrite(_clock,LOW);
         digitalWrite(_load,LOW);

         for(unsigned long i=1L<<(_length-1) ; i!=0 ; i>>=1)
         {
            digitalWrite(_data,(data&i)!=0);
            digitalWrite(_clock,HIGH);
            digitalWrite(_clock,LOW);
         }
         // transfer the data
         digitalWrite(_load,HIGH);
         digitalWrite(_load,LOW);
      }


I have made a simple demonstration program that creates a 16 bit value with only one bit set and move this bit from left to right.
Note the Arduino pins selection via the first 3 lines

      #define PIN_DATA 2
      #define PIN_CLOCK 3
      #define PIN_LOAD 4

      Shift_register shiftReg(PIN_CLOCK,PIN_DATA,PIN_LOAD,28);
      long unsigned ledPattern=1;
      bool shiftLeft=true;

      void setup() { }

      void loop() 
      {
         shiftReg.write(ledPattern);

         if(ledPattern==0x1)
            {  shiftLeft=true; }
         else if(ledPattern==0x8000)
            {  shiftLeft=false; }
         
         if (shiftLeft)
            { ledPattern<<=1; }
         else
            { ledPattern>>=1; }
         delay(40);
      }

The full program is available in [EX3_CPLD_shiftregister.ino](EX3_CPLD_shiftregister.ino)