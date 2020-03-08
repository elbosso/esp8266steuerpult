EESchema Schematic File Version 4
LIBS:pult-cache
EELAYER 30 0
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
L MCU_Module:WeMos_D1_mini U1
U 1 1 5E5D3C29
P 1950 2550
F 0 "U1" H 1950 1661 50  0000 C CNN
F 1 "WeMos_D1_mini" H 1950 1570 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 1950 1400 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 100 1400 50  0001 C CNN
	1    1950 2550
	1    0    0    -1  
$EndComp
$Comp
L Analog_ADC:ADS1015IDGS U2
U 1 1 5E5D3F70
P 4650 2000
F 0 "U2" H 4650 2681 50  0000 C CNN
F 1 "ADS1015IDGS" H 4650 2590 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 4650 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1015.pdf" H 4600 1100 50  0001 C CNN
	1    4650 2000
	1    0    0    -1  
$EndComp
Text GLabel 5350 2000 2    50   BiDi ~ 0
SCL
Text GLabel 5350 2100 2    50   BiDi ~ 0
SDA
Text GLabel 3350 2250 2    50   BiDi ~ 0
SCL
Text GLabel 3350 2350 2    50   BiDi ~ 0
SDA
$Comp
L pspice:R R1
U 1 1 5E5D4662
P 2950 1800
F 0 "R1" H 3018 1846 50  0000 L CNN
F 1 "10K" H 3018 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 2950 1800 50  0001 C CNN
F 3 "~" H 2950 1800 50  0001 C CNN
	1    2950 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E5D4AAE
P 1950 4350
F 0 "#PWR02" H 1950 4100 50  0001 C CNN
F 1 "GND" H 1955 4177 50  0000 C CNN
F 2 "" H 1950 4350 50  0001 C CNN
F 3 "" H 1950 4350 50  0001 C CNN
	1    1950 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E5D4D50
P 4650 4350
F 0 "#PWR06" H 4650 4100 50  0001 C CNN
F 1 "GND" H 4655 4177 50  0000 C CNN
F 2 "" H 4650 4350 50  0001 C CNN
F 3 "" H 4650 4350 50  0001 C CNN
	1    4650 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5E5D4F70
P 1850 1150
F 0 "#PWR01" H 1850 1000 50  0001 C CNN
F 1 "+5V" H 1865 1323 50  0000 C CNN
F 2 "" H 1850 1150 50  0001 C CNN
F 3 "" H 1850 1150 50  0001 C CNN
	1    1850 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5E5D5218
P 4650 1100
F 0 "#PWR05" H 4650 950 50  0001 C CNN
F 1 "+5V" H 4665 1273 50  0000 C CNN
F 2 "" H 4650 1100 50  0001 C CNN
F 3 "" H 4650 1100 50  0001 C CNN
	1    4650 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5E5D5506
P 3100 1150
F 0 "#PWR04" H 3100 1000 50  0001 C CNN
F 1 "+5V" H 3115 1323 50  0000 C CNN
F 2 "" H 3100 1150 50  0001 C CNN
F 3 "" H 3100 1150 50  0001 C CNN
	1    3100 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR03
U 1 1 5E5D5803
P 2050 1150
F 0 "#PWR03" H 2050 1000 50  0001 C CNN
F 1 "+3V3" H 2065 1323 50  0000 C CNN
F 2 "" H 2050 1150 50  0001 C CNN
F 3 "" H 2050 1150 50  0001 C CNN
	1    2050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1450 3100 1150
Wire Wire Line
	3200 1450 3100 1450
$Comp
L pspice:R R2
U 1 1 5E5D4946
P 3200 1850
F 0 "R2" H 3268 1896 50  0000 L CNN
F 1 "10K" H 3268 1805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" H 3200 1850 50  0001 C CNN
F 3 "~" H 3200 1850 50  0001 C CNN
	1    3200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2350 3200 2350
Wire Wire Line
	3200 1600 3200 1450
Wire Wire Line
	2350 2250 2950 2250
Wire Wire Line
	2950 1550 2950 1450
Wire Wire Line
	2950 1450 3100 1450
Connection ~ 3100 1450
Wire Wire Line
	2950 2050 2950 2250
Connection ~ 2950 2250
Wire Wire Line
	2950 2250 3350 2250
Wire Wire Line
	3200 2100 3200 2350
Connection ~ 3200 2350
Wire Wire Line
	3200 2350 3350 2350
Wire Wire Line
	4650 2400 4650 2650
Wire Wire Line
	5050 2000 5350 2000
Wire Wire Line
	5050 2100 5350 2100
Wire Wire Line
	4650 1100 4650 1250
$Comp
L Device:C C1
U 1 1 5E5EA0CC
P 4950 1250
F 0 "C1" V 4698 1250 50  0000 C CNN
F 1 "100n" V 4789 1250 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 4988 1100 50  0001 C CNN
F 3 "~" H 4950 1250 50  0001 C CNN
	1    4950 1250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E5EA776
P 5100 1350
F 0 "#PWR07" H 5100 1100 50  0001 C CNN
F 1 "GND" H 5105 1177 50  0000 C CNN
F 2 "" H 5100 1350 50  0001 C CNN
F 3 "" H 5100 1350 50  0001 C CNN
	1    5100 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1250 4650 1250
Connection ~ 4650 1250
Wire Wire Line
	4650 1250 4650 1500
Wire Wire Line
	5100 1250 5100 1350
Text GLabel 4050 1900 0    50   Input ~ 0
Mes01
Text GLabel 4050 2000 0    50   Input ~ 0
Mes02
Text GLabel 4050 2100 0    50   Input ~ 0
Mes03
Text GLabel 4050 2200 0    50   Input ~ 0
Mes04
Wire Wire Line
	4050 1900 4250 1900
Wire Wire Line
	4050 2000 4250 2000
Wire Wire Line
	4050 2100 4250 2100
Wire Wire Line
	4050 2200 4250 2200
$Comp
L Analog_ADC:ADS1015IDGS U3
U 1 1 5E5F2FEF
P 6700 2000
F 0 "U3" H 6700 2681 50  0000 C CNN
F 1 "ADS1015IDGS" H 6700 2590 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 6700 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1015.pdf" H 6650 1100 50  0001 C CNN
	1    6700 2000
	1    0    0    -1  
$EndComp
Text GLabel 7400 2000 2    50   BiDi ~ 0
SCL
Text GLabel 7400 2100 2    50   BiDi ~ 0
SDA
$Comp
L power:GND #PWR09
U 1 1 5E5F2FF7
P 6700 4350
F 0 "#PWR09" H 6700 4100 50  0001 C CNN
F 1 "GND" H 6705 4177 50  0000 C CNN
F 2 "" H 6700 4350 50  0001 C CNN
F 3 "" H 6700 4350 50  0001 C CNN
	1    6700 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5E5F2FFD
P 6700 1100
F 0 "#PWR08" H 6700 950 50  0001 C CNN
F 1 "+5V" H 6715 1273 50  0000 C CNN
F 2 "" H 6700 1100 50  0001 C CNN
F 3 "" H 6700 1100 50  0001 C CNN
	1    6700 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2400 6700 4350
Wire Wire Line
	7100 2000 7400 2000
Wire Wire Line
	7100 2100 7400 2100
Wire Wire Line
	6700 1100 6700 1250
$Comp
L Device:C C2
U 1 1 5E5F3007
P 7000 1250
F 0 "C2" V 6748 1250 50  0000 C CNN
F 1 "100n" V 6839 1250 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 7038 1100 50  0001 C CNN
F 3 "~" H 7000 1250 50  0001 C CNN
	1    7000 1250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E5F300D
P 7150 1350
F 0 "#PWR010" H 7150 1100 50  0001 C CNN
F 1 "GND" H 7155 1177 50  0000 C CNN
F 2 "" H 7150 1350 50  0001 C CNN
F 3 "" H 7150 1350 50  0001 C CNN
	1    7150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1250 6700 1250
Connection ~ 6700 1250
Wire Wire Line
	6700 1250 6700 1500
Wire Wire Line
	7150 1250 7150 1350
Text GLabel 6100 1900 0    50   Input ~ 0
Mes11
Text GLabel 6100 2000 0    50   Input ~ 0
Mes12
Text GLabel 6100 2100 0    50   Input ~ 0
Mes13
Text GLabel 6100 2200 0    50   Input ~ 0
Mes14
Wire Wire Line
	6100 1900 6300 1900
Wire Wire Line
	6100 2000 6300 2000
Wire Wire Line
	6100 2100 6300 2100
Wire Wire Line
	6100 2200 6300 2200
$Comp
L Analog_ADC:ADS1015IDGS U4
U 1 1 5E5F4301
P 8700 2000
F 0 "U4" H 8700 2681 50  0000 C CNN
F 1 "ADS1015IDGS" H 8700 2590 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 8700 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1015.pdf" H 8650 1100 50  0001 C CNN
	1    8700 2000
	1    0    0    -1  
$EndComp
Text GLabel 9400 2000 2    50   BiDi ~ 0
SCL
Text GLabel 9400 2100 2    50   BiDi ~ 0
SDA
$Comp
L power:GND #PWR012
U 1 1 5E5F4309
P 8700 4350
F 0 "#PWR012" H 8700 4100 50  0001 C CNN
F 1 "GND" H 8705 4177 50  0000 C CNN
F 2 "" H 8700 4350 50  0001 C CNN
F 3 "" H 8700 4350 50  0001 C CNN
	1    8700 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5E5F430F
P 8700 1100
F 0 "#PWR011" H 8700 950 50  0001 C CNN
F 1 "+5V" H 8715 1273 50  0000 C CNN
F 2 "" H 8700 1100 50  0001 C CNN
F 3 "" H 8700 1100 50  0001 C CNN
	1    8700 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2400 8700 4350
Wire Wire Line
	9100 2000 9400 2000
Wire Wire Line
	9100 2100 9250 2100
Wire Wire Line
	8700 1100 8700 1250
$Comp
L Device:C C3
U 1 1 5E5F4319
P 9000 1250
F 0 "C3" V 8748 1250 50  0000 C CNN
F 1 "100n" V 8839 1250 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 9038 1100 50  0001 C CNN
F 3 "~" H 9000 1250 50  0001 C CNN
	1    9000 1250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5E5F431F
P 9150 1350
F 0 "#PWR013" H 9150 1100 50  0001 C CNN
F 1 "GND" H 9155 1177 50  0000 C CNN
F 2 "" H 9150 1350 50  0001 C CNN
F 3 "" H 9150 1350 50  0001 C CNN
	1    9150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1250 8700 1250
Connection ~ 8700 1250
Wire Wire Line
	8700 1250 8700 1500
Wire Wire Line
	9150 1250 9150 1350
Text GLabel 8100 1900 0    50   Input ~ 0
Mes21
Text GLabel 8100 2000 0    50   Input ~ 0
Mes22
Text GLabel 8100 2100 0    50   Input ~ 0
Mes23
Text GLabel 8100 2200 0    50   Input ~ 0
Mes24
Wire Wire Line
	8100 1900 8300 1900
Wire Wire Line
	8100 2000 8300 2000
Wire Wire Line
	8100 2100 8300 2100
Wire Wire Line
	8100 2200 8300 2200
$Comp
L Analog_ADC:ADS1015IDGS U5
U 1 1 5E5F5883
P 10050 2950
F 0 "U5" H 10050 3631 50  0000 C CNN
F 1 "ADS1015IDGS" H 10050 3540 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 10050 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1015.pdf" H 10000 2050 50  0001 C CNN
	1    10050 2950
	1    0    0    -1  
$EndComp
Text GLabel 10750 2950 2    50   BiDi ~ 0
SCL
Text GLabel 10750 3050 2    50   BiDi ~ 0
SDA
$Comp
L power:GND #PWR015
U 1 1 5E5F588B
P 10050 5300
F 0 "#PWR015" H 10050 5050 50  0001 C CNN
F 1 "GND" H 10055 5127 50  0000 C CNN
F 2 "" H 10050 5300 50  0001 C CNN
F 3 "" H 10050 5300 50  0001 C CNN
	1    10050 5300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5E5F5891
P 10050 2050
F 0 "#PWR014" H 10050 1900 50  0001 C CNN
F 1 "+5V" H 10065 2223 50  0000 C CNN
F 2 "" H 10050 2050 50  0001 C CNN
F 3 "" H 10050 2050 50  0001 C CNN
	1    10050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3350 10050 5300
Wire Wire Line
	10450 2950 10600 2950
Wire Wire Line
	10450 3050 10750 3050
Wire Wire Line
	10050 2050 10050 2200
$Comp
L Device:C C4
U 1 1 5E5F589B
P 10350 2200
F 0 "C4" V 10098 2200 50  0000 C CNN
F 1 "100n" V 10189 2200 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 10388 2050 50  0001 C CNN
F 3 "~" H 10350 2200 50  0001 C CNN
	1    10350 2200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5E5F58A1
P 10500 2300
F 0 "#PWR016" H 10500 2050 50  0001 C CNN
F 1 "GND" H 10505 2127 50  0000 C CNN
F 2 "" H 10500 2300 50  0001 C CNN
F 3 "" H 10500 2300 50  0001 C CNN
	1    10500 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2200 10050 2200
Connection ~ 10050 2200
Wire Wire Line
	10050 2200 10050 2450
Wire Wire Line
	10500 2200 10500 2300
Text GLabel 9450 2850 0    50   Input ~ 0
Mes31
Text GLabel 9450 2950 0    50   Input ~ 0
Mes32
Text GLabel 9450 3050 0    50   Input ~ 0
Mes33
Text GLabel 9450 3150 0    50   Input ~ 0
Mes34
Wire Wire Line
	9450 2850 9650 2850
Wire Wire Line
	9450 2950 9650 2950
Wire Wire Line
	9450 3050 9650 3050
Wire Wire Line
	9450 3150 9650 3150
Wire Wire Line
	5050 2200 5050 2650
Wire Wire Line
	5050 2650 4650 2650
Connection ~ 4650 2650
Wire Wire Line
	4650 2650 4650 4350
Wire Wire Line
	7700 2200 7700 1250
Wire Wire Line
	7700 1250 8700 1250
Wire Wire Line
	7100 2200 7700 2200
Wire Wire Line
	9100 2200 9250 2200
Wire Wire Line
	9250 2200 9250 2100
Connection ~ 9250 2100
Wire Wire Line
	9250 2100 9400 2100
Wire Wire Line
	10450 3150 10600 3150
Wire Wire Line
	10600 3150 10600 2950
Connection ~ 10600 2950
Wire Wire Line
	10600 2950 10750 2950
$Comp
L power:+5V #PWR0101
U 1 1 5E601C87
P 3400 3850
F 0 "#PWR0101" H 3400 3700 50  0001 C CNN
F 1 "+5V" H 3415 4023 50  0000 C CNN
F 2 "" H 3400 3850 50  0001 C CNN
F 3 "" H 3400 3850 50  0001 C CNN
	1    3400 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5E602302
P 3400 5650
F 0 "#PWR0102" H 3400 5400 50  0001 C CNN
F 1 "GND" H 3405 5477 50  0000 C CNN
F 2 "" H 3400 5650 50  0001 C CNN
F 3 "" H 3400 5650 50  0001 C CNN
	1    3400 5650
	1    0    0    -1  
$EndComp
Text GLabel 3500 4000 2    50   Input ~ 0
Mes01
Text GLabel 3500 4100 2    50   Input ~ 0
Mes02
Text GLabel 3500 4200 2    50   Input ~ 0
Mes03
Text GLabel 3500 4300 2    50   Input ~ 0
Mes04
Text GLabel 3500 4400 2    50   Input ~ 0
Mes11
Text GLabel 3500 4500 2    50   Input ~ 0
Mes12
Text GLabel 3500 4600 2    50   Input ~ 0
Mes13
Text GLabel 3500 4700 2    50   Input ~ 0
Mes14
Text GLabel 3500 4800 2    50   Input ~ 0
Mes21
Text GLabel 3500 4900 2    50   Input ~ 0
Mes22
Text GLabel 3500 5000 2    50   Input ~ 0
Mes23
Text GLabel 3500 5100 2    50   Input ~ 0
Mes24
$Comp
L Connector:Conn_01x18_Male J1
U 1 1 5E60939C
P 2850 4700
F 0 "J1" H 2958 5681 50  0000 C CNN
F 1 "Conn_01x18_Male" H 2958 5590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x18_P2.54mm_Vertical" H 2850 4700 50  0001 C CNN
F 3 "~" H 2850 4700 50  0001 C CNN
	1    2850 4700
	1    0    0    -1  
$EndComp
Text GLabel 3500 5200 2    50   Input ~ 0
Mes31
Text GLabel 3500 5300 2    50   Input ~ 0
Mes32
Text GLabel 3500 5400 2    50   Input ~ 0
Mes33
Text GLabel 3500 5500 2    50   Input ~ 0
Mes34
Wire Wire Line
	3050 4000 3500 4000
Wire Wire Line
	3050 4100 3500 4100
Wire Wire Line
	3050 4200 3500 4200
Wire Wire Line
	3050 4300 3500 4300
Wire Wire Line
	3050 4400 3500 4400
Wire Wire Line
	3050 4500 3500 4500
Wire Wire Line
	3050 4600 3500 4600
Wire Wire Line
	3050 4700 3500 4700
Wire Wire Line
	3050 4800 3500 4800
Wire Wire Line
	3050 4900 3500 4900
Wire Wire Line
	3050 5000 3500 5000
Wire Wire Line
	3050 5100 3500 5100
Wire Wire Line
	3050 5200 3500 5200
Wire Wire Line
	3050 5300 3500 5300
Wire Wire Line
	3050 5400 3500 5400
Wire Wire Line
	3050 5500 3500 5500
Wire Wire Line
	3050 5600 3400 5600
Wire Wire Line
	3400 5600 3400 5650
Wire Wire Line
	3050 3900 3400 3900
Wire Wire Line
	3400 3900 3400 3850
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5E66C028
P 1100 7050
F 0 "SW1" H 1100 7317 50  0000 C CNN
F 1 "SW_DIP_x01" H 1100 7226 50  0000 C CNN
F 2 "" H 1100 7050 50  0001 C CNN
F 3 "~" H 1100 7050 50  0001 C CNN
	1    1100 7050
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R3
U 1 1 5E66C02E
P 800 6550
F 0 "R3" H 868 6596 50  0000 L CNN
F 1 "100K" H 868 6505 50  0000 L CNN
F 2 "" H 800 6550 50  0001 C CNN
F 3 "~" H 800 6550 50  0001 C CNN
	1    800  6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5E66C034
P 800 6050
F 0 "#PWR017" H 800 5900 50  0001 C CNN
F 1 "+5V" H 815 6223 50  0000 C CNN
F 2 "" H 800 6050 50  0001 C CNN
F 3 "" H 800 6050 50  0001 C CNN
	1    800  6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E66C03A
P 1400 7350
F 0 "#PWR018" H 1400 7100 50  0001 C CNN
F 1 "GND" H 1405 7177 50  0000 C CNN
F 2 "" H 1400 7350 50  0001 C CNN
F 3 "" H 1400 7350 50  0001 C CNN
	1    1400 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6050 800  6300
Wire Wire Line
	800  6800 800  7050
Wire Wire Line
	1400 7050 1400 7350
Text GLabel 1700 7050 2    50   Input ~ 0
Schalt1
Wire Wire Line
	1700 7050 1400 7050
Connection ~ 1400 7050
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 5E66FA79
P 3000 7050
F 0 "SW2" H 3000 7317 50  0000 C CNN
F 1 "SW_DIP_x01" H 3000 7226 50  0000 C CNN
F 2 "" H 3000 7050 50  0001 C CNN
F 3 "~" H 3000 7050 50  0001 C CNN
	1    3000 7050
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R4
U 1 1 5E66FA7F
P 2700 6550
F 0 "R4" H 2768 6596 50  0000 L CNN
F 1 "100K" H 2768 6505 50  0000 L CNN
F 2 "" H 2700 6550 50  0001 C CNN
F 3 "~" H 2700 6550 50  0001 C CNN
	1    2700 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR019
U 1 1 5E66FA85
P 2700 6050
F 0 "#PWR019" H 2700 5900 50  0001 C CNN
F 1 "+5V" H 2715 6223 50  0000 C CNN
F 2 "" H 2700 6050 50  0001 C CNN
F 3 "" H 2700 6050 50  0001 C CNN
	1    2700 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5E66FA8B
P 3300 7350
F 0 "#PWR020" H 3300 7100 50  0001 C CNN
F 1 "GND" H 3305 7177 50  0000 C CNN
F 2 "" H 3300 7350 50  0001 C CNN
F 3 "" H 3300 7350 50  0001 C CNN
	1    3300 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6050 2700 6300
Wire Wire Line
	2700 6800 2700 7050
Wire Wire Line
	3300 7050 3300 7350
Text GLabel 3600 7050 2    50   Input ~ 0
Schalt2
Wire Wire Line
	3600 7050 3300 7050
Connection ~ 3300 7050
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 5E673A7B
P 4900 7050
F 0 "SW3" H 4900 7317 50  0000 C CNN
F 1 "SW_DIP_x01" H 4900 7226 50  0000 C CNN
F 2 "" H 4900 7050 50  0001 C CNN
F 3 "~" H 4900 7050 50  0001 C CNN
	1    4900 7050
	1    0    0    -1  
$EndComp
$Comp
L pspice:R R5
U 1 1 5E673A81
P 4600 6550
F 0 "R5" H 4668 6596 50  0000 L CNN
F 1 "100K" H 4668 6505 50  0000 L CNN
F 2 "" H 4600 6550 50  0001 C CNN
F 3 "~" H 4600 6550 50  0001 C CNN
	1    4600 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 5E673A87
P 4600 6050
F 0 "#PWR021" H 4600 5900 50  0001 C CNN
F 1 "+5V" H 4615 6223 50  0000 C CNN
F 2 "" H 4600 6050 50  0001 C CNN
F 3 "" H 4600 6050 50  0001 C CNN
	1    4600 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5E673A8D
P 5200 7350
F 0 "#PWR022" H 5200 7100 50  0001 C CNN
F 1 "GND" H 5205 7177 50  0000 C CNN
F 2 "" H 5200 7350 50  0001 C CNN
F 3 "" H 5200 7350 50  0001 C CNN
	1    5200 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6050 4600 6300
Wire Wire Line
	4600 6800 4600 7050
Wire Wire Line
	5200 7050 5200 7350
Text GLabel 5500 7050 2    50   Input ~ 0
Schalt3
Wire Wire Line
	5500 7050 5200 7050
Connection ~ 5200 7050
Text GLabel 3350 2450 2    50   Input ~ 0
Schalt1
Text GLabel 3350 2550 2    50   Input ~ 0
Schalt2
Text GLabel 3350 2650 2    50   Input ~ 0
Schalt3
Text GLabel 3350 2750 2    50   Output ~ 0
LedGr
Wire Wire Line
	2350 2450 3350 2450
Wire Wire Line
	2350 2550 3350 2550
Wire Wire Line
	2350 2650 3350 2650
Wire Wire Line
	2350 2750 3350 2750
NoConn ~ 1400 2450
NoConn ~ 1400 2550
NoConn ~ 1400 2150
NoConn ~ 2500 2150
NoConn ~ 2500 2050
NoConn ~ 5200 1800
NoConn ~ 7250 1800
NoConn ~ 9250 1800
NoConn ~ 10600 2750
Wire Wire Line
	10600 2750 10450 2750
Wire Wire Line
	9250 1800 9100 1800
Wire Wire Line
	7250 1800 7100 1800
Wire Wire Line
	5200 1800 5050 1800
Wire Wire Line
	2500 2050 2350 2050
Wire Wire Line
	2500 2150 2350 2150
Wire Wire Line
	1400 2550 1550 2550
Wire Wire Line
	1400 2450 1550 2450
Wire Wire Line
	1400 2150 1550 2150
Wire Wire Line
	2050 1150 2050 1750
Wire Wire Line
	1850 1150 1850 1750
Wire Wire Line
	1950 3350 1950 4350
Text GLabel 3350 2850 2    50   Output ~ 0
LedBl
Text GLabel 3350 2950 2    50   Output ~ 0
LedRe
Wire Wire Line
	2350 2850 3350 2850
Wire Wire Line
	2350 2950 3350 2950
$Comp
L Device:LED_CRGB D1
U 1 1 5E6489C5
P 6350 5350
F 0 "D1" H 6350 5847 50  0000 C CNN
F 1 "LED_CRGB" H 6350 5756 50  0000 C CNN
F 2 "" H 6350 5300 50  0001 C CNN
F 3 "~" H 6350 5300 50  0001 C CNN
	1    6350 5350
	-1   0    0    -1  
$EndComp
Text GLabel 5550 5150 0    50   Input ~ 0
LedGr
Text GLabel 5550 5350 0    50   Input ~ 0
LedBl
Text GLabel 5550 5550 0    50   Input ~ 0
LedRe
Wire Wire Line
	5550 5150 6150 5150
Wire Wire Line
	5550 5350 6150 5350
Wire Wire Line
	5550 5550 6150 5550
$Comp
L power:GND #PWR023
U 1 1 5E65D4EA
P 6550 6250
F 0 "#PWR023" H 6550 6000 50  0001 C CNN
F 1 "GND" H 6555 6077 50  0000 C CNN
F 2 "" H 6550 6250 50  0001 C CNN
F 3 "" H 6550 6250 50  0001 C CNN
	1    6550 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5E664641
P 6550 5950
F 0 "R6" H 6620 5996 50  0000 L CNN
F 1 "220" H 6620 5905 50  0000 L CNN
F 2 "" V 6480 5950 50  0001 C CNN
F 3 "~" H 6550 5950 50  0001 C CNN
	1    6550 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5350 6550 5800
Wire Wire Line
	6550 6100 6550 6250
$EndSCHEMATC
