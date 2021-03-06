EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:misc_giogziro95
LIBS:ATMEL_CPLD_LIB
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Arduino_Uno_R3 U1
U 1 1 5C351799
P 2950 3100
F 0 "U1" H 2950 3150 50  0000 C CNN
F 1 "Arduino_Uno_R3" H 2950 3000 50  0000 C CNN
F 2 "" H 2950 1900 50  0001 C TNN
F 3 "" H 2950 1800 50  0001 C TNN
	1    2950 3100
	1    0    0    -1  
$EndComp
$Comp
L ATF1504AS-PLCC44 U2
U 1 1 5C3517C8
P 6450 3150
F 0 "U2" H 6250 3050 60  0000 C CNN
F 1 "ATF1504AS-PLCC44" H 6500 3150 60  0000 C CNN
F 2 "" H 6600 4050 60  0001 C CNN
F 3 "" H 6600 4050 60  0001 C CNN
	1    6450 3150
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 J1
U 1 1 5C3517EF
P 8350 1600
F 0 "J1" H 8350 1900 50  0000 C CNN
F 1 "JTAG" H 8350 1300 50  0000 C CNN
F 2 "" H 8350 400 50  0001 C CNN
F 3 "" H 8350 400 50  0001 C CNN
	1    8350 1600
	1    0    0    -1  
$EndComp
$Comp
L LED_ALT D1
U 1 1 5C3518AC
P 9650 1300
F 0 "D1" H 9650 1400 50  0000 C CNN
F 1 "red" H 9650 1200 50  0000 C CNN
F 2 "" H 9650 1300 50  0001 C CNN
F 3 "" H 9650 1300 50  0001 C CNN
	1    9650 1300
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 5C35191F
P 9300 1650
F 0 "C2" H 9325 1750 50  0000 L CNN
F 1 "100nF" H 9325 1550 50  0000 L CNN
F 2 "" H 9338 1500 50  0001 C CNN
F 3 "" H 9300 1650 50  0001 C CNN
	1    9300 1650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5C3519D7
P 9650 1650
F 0 "R1" V 9730 1650 50  0000 C CNN
F 1 "330" V 9650 1650 50  0000 C CNN
F 2 "" V 9580 1650 50  0001 C CNN
F 3 "" H 9650 1650 50  0001 C CNN
	1    9650 1650
	-1   0    0    1   
$EndComp
$Comp
L CP C1
U 1 1 5C351A3E
P 8950 1650
F 0 "C1" H 8975 1750 50  0000 L CNN
F 1 "22µF" H 8975 1550 50  0000 L CNN
F 2 "" H 8988 1500 50  0001 C CNN
F 3 "" H 8950 1650 50  0001 C CNN
	1    8950 1650
	1    0    0    -1  
$EndComp
Text Label 7950 1400 0    60   ~ 0
TCK
$Comp
L +5V #PWR01
U 1 1 5C351FFF
P 8850 1350
F 0 "#PWR01" H 8850 1200 50  0001 C CNN
F 1 "+5V" H 8850 1490 50  0000 C CNN
F 2 "" H 8850 1350 50  0001 C CNN
F 3 "" H 8850 1350 50  0001 C CNN
	1    8850 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5C35203D
P 8850 2000
F 0 "#PWR02" H 8850 1750 50  0001 C CNN
F 1 "GND" H 8850 1850 50  0000 C CNN
F 2 "" H 8850 2000 50  0001 C CNN
F 3 "" H 8850 2000 50  0001 C CNN
	1    8850 2000
	1    0    0    -1  
$EndComp
Text Label 7950 1500 0    60   ~ 0
TDO
Wire Wire Line
	7750 3350 7450 3350
Wire Wire Line
	7750 1400 7750 3350
Wire Wire Line
	7750 1400 8100 1400
Wire Wire Line
	7450 2750 7850 2750
Wire Wire Line
	7850 2750 7850 1500
Wire Wire Line
	7850 1500 8100 1500
Wire Wire Line
	5100 1600 8100 1600
Wire Wire Line
	5100 1600 5100 3250
Wire Wire Line
	5100 3250 5400 3250
Wire Wire Line
	5200 1800 8100 1800
Wire Wire Line
	5200 1800 5200 2650
Wire Wire Line
	5200 2650 5400 2650
Wire Wire Line
	8850 1350 8850 1500
Wire Wire Line
	8600 1500 9300 1500
Wire Wire Line
	8600 1800 9650 1800
Wire Wire Line
	8850 1800 8850 2000
Wire Wire Line
	8600 1400 8750 1400
Wire Wire Line
	8750 1400 8750 1800
Connection ~ 8750 1800
Connection ~ 8850 1500
Connection ~ 8950 1500
Connection ~ 8850 1800
Connection ~ 8950 1800
Wire Wire Line
	9650 1450 9650 1500
Connection ~ 9300 1800
$Comp
L +5V #PWR03
U 1 1 5C3532A0
P 9650 1050
F 0 "#PWR03" H 9650 900 50  0001 C CNN
F 1 "+5V" H 9650 1190 50  0000 C CNN
F 2 "" H 9650 1050 50  0001 C CNN
F 3 "" H 9650 1050 50  0001 C CNN
	1    9650 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 1050 9650 1150
$Comp
L GND #PWR04
U 1 1 5C3539CC
P 2750 4250
F 0 "#PWR04" H 2750 4000 50  0001 C CNN
F 1 "GND" H 2750 4100 50  0000 C CNN
F 2 "" H 2750 4250 50  0001 C CNN
F 3 "" H 2750 4250 50  0001 C CNN
	1    2750 4250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 5C353A12
P 2750 1950
F 0 "#PWR05" H 2750 1800 50  0001 C CNN
F 1 "+5V" H 2750 2090 50  0000 C CNN
F 2 "" H 2750 1950 50  0001 C CNN
F 3 "" H 2750 1950 50  0001 C CNN
	1    2750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2100 2750 1950
Wire Wire Line
	7450 3550 7950 3550
Wire Wire Line
	6350 4200 6350 5050
Wire Wire Line
	5400 2950 5200 2950
Wire Wire Line
	5200 2950 5200 5050
Wire Wire Line
	6750 2100 6750 1900
Wire Wire Line
	6750 1900 7950 1900
Wire Wire Line
	6250 1100 6250 2100
Wire Wire Line
	5000 3450 5400 3450
Wire Wire Line
	6450 4300 6450 4200
Wire Wire Line
	5000 4300 6450 4300
Wire Wire Line
	7450 3050 7650 3050
$Comp
L GND #PWR06
U 1 1 5C353B7C
P 6350 5050
F 0 "#PWR06" H 6350 4800 50  0001 C CNN
F 1 "GND" H 6350 4900 50  0000 C CNN
F 2 "" H 6350 5050 50  0001 C CNN
F 3 "" H 6350 5050 50  0001 C CNN
	1    6350 5050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 5C353B9E
P 6250 1100
F 0 "#PWR07" H 6250 950 50  0001 C CNN
F 1 "+5V" H 6250 1240 50  0000 C CNN
F 2 "" H 6250 1100 50  0001 C CNN
F 3 "" H 6250 1100 50  0001 C CNN
	1    6250 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4100 2750 4250
$Comp
L +5V #PWR?
U 1 1 5C354E01
P 7650 2200
F 0 "#PWR?" H 7650 2050 50  0001 C CNN
F 1 "+5V" H 7650 2340 50  0000 C CNN
F 2 "" H 7650 2200 50  0001 C CNN
F 3 "" H 7650 2200 50  0001 C CNN
	1    7650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3050 7650 2200
$Comp
L +5V #PWR?
U 1 1 5C354ED9
P 5000 2050
F 0 "#PWR?" H 5000 1900 50  0001 C CNN
F 1 "+5V" H 5000 2190 50  0000 C CNN
F 2 "" H 5000 2050 50  0001 C CNN
F 3 "" H 5000 2050 50  0001 C CNN
	1    5000 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2050 5000 4300
Connection ~ 5000 3450
Connection ~ 7950 3550
Wire Wire Line
	7950 1900 7950 3850
$Comp
L GND #PWR?
U 1 1 5C35517A
P 7950 3850
F 0 "#PWR?" H 7950 3600 50  0001 C CNN
F 1 "GND" H 7950 3700 50  0000 C CNN
F 2 "" H 7950 3850 50  0001 C CNN
F 3 "" H 7950 3850 50  0001 C CNN
	1    7950 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5C35549D
P 5200 5050
F 0 "#PWR?" H 5200 4800 50  0001 C CNN
F 1 "GND" H 5200 4900 50  0000 C CNN
F 2 "" H 5200 5050 50  0001 C CNN
F 3 "" H 5200 5050 50  0001 C CNN
	1    5200 5050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
