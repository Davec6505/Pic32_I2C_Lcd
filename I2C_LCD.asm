_I2C_PCF8574_Write:
;I2C_LCD.c,13 :: 		UChar I2C_PCF8574_Write(UChar addr,UChar Data ){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,15 :: 		if(I2CUnit == I2C1){
SW	R25, 4(SP)
LH	R3, Offset(_I2CUnit+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__I2C_PCF8574_Write54
NOP	
J	L_I2C_PCF8574_Write0
NOP	
L__I2C_PCF8574_Write54:
;I2C_LCD.c,16 :: 		I2C1_Start();                //Start send ACK
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C1_Start+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,17 :: 		S = I2C1_Write(addr);        //Send address and check for error
SB	R25, 9(SP)
JAL	_I2C1_Write+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,19 :: 		I2C1_Write(Data);
SB	R26, 8(SP)
SB	R25, 9(SP)
ANDI	R25, R26, 255
JAL	_I2C1_Write+0
NOP	
;I2C_LCD.c,20 :: 		I2C1_Stop();
JAL	_I2C1_Stop+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,21 :: 		}
L_I2C_PCF8574_Write0:
;I2C_LCD.c,22 :: 		if(I2CUnit == I2C2){
LH	R3, Offset(_I2CUnit+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__I2C_PCF8574_Write55
NOP	
J	L_I2C_PCF8574_Write1
NOP	
L__I2C_PCF8574_Write55:
;I2C_LCD.c,23 :: 		I2C2_Start();                //Start send ACK
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C2_Start+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,24 :: 		S = I2C2_Write(addr);        //Send address and check for error
SB	R25, 9(SP)
JAL	_I2C2_Write+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,26 :: 		I2C2_Write(Data);
SB	R26, 8(SP)
SB	R25, 9(SP)
ANDI	R25, R26, 255
JAL	_I2C2_Write+0
NOP	
;I2C_LCD.c,27 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,28 :: 		}
L_I2C_PCF8574_Write1:
;I2C_LCD.c,29 :: 		if(I2CUnit == I2C3){
LH	R3, Offset(_I2CUnit+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__I2C_PCF8574_Write56
NOP	
J	L_I2C_PCF8574_Write2
NOP	
L__I2C_PCF8574_Write56:
;I2C_LCD.c,30 :: 		I2C3_Start();                //Start send ACK
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C3_Start+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,31 :: 		S = I2C3_Write(addr);        //Send address and check for error
SB	R25, 9(SP)
JAL	_I2C3_Write+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,33 :: 		I2C3_Write(Data);
SB	R26, 8(SP)
SB	R25, 9(SP)
ANDI	R25, R26, 255
JAL	_I2C3_Write+0
NOP	
;I2C_LCD.c,34 :: 		I2C3_Stop();
JAL	_I2C3_Stop+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,35 :: 		}
L_I2C_PCF8574_Write2:
;I2C_LCD.c,36 :: 		if(I2CUnit == I2C4){
LH	R3, Offset(_I2CUnit+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__I2C_PCF8574_Write57
NOP	
J	L_I2C_PCF8574_Write3
NOP	
L__I2C_PCF8574_Write57:
;I2C_LCD.c,37 :: 		I2C4_Start();                //Start send ACK
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C4_Start+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,38 :: 		S = I2C4_Write(addr);        //Send address and check for error
SB	R25, 9(SP)
JAL	_I2C4_Write+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,40 :: 		I2C4_Write(Data);
SB	R26, 8(SP)
SB	R25, 9(SP)
ANDI	R25, R26, 255
JAL	_I2C4_Write+0
NOP	
;I2C_LCD.c,41 :: 		I2C4_Stop();
JAL	_I2C4_Stop+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,42 :: 		}
L_I2C_PCF8574_Write3:
;I2C_LCD.c,43 :: 		if(I2CUnit == I2C5){
LH	R3, Offset(_I2CUnit+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__I2C_PCF8574_Write58
NOP	
J	L_I2C_PCF8574_Write4
NOP	
L__I2C_PCF8574_Write58:
;I2C_LCD.c,44 :: 		I2C5_Start();                //Start send ACK
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C5_Start+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,45 :: 		S = I2C5_Write(addr);        //Send address and check for error
JAL	_I2C5_Write+0
NOP	
LBU	R26, 8(SP)
;I2C_LCD.c,47 :: 		I2C5_Write(Data);
ANDI	R25, R26, 255
JAL	_I2C5_Write+0
NOP	
;I2C_LCD.c,48 :: 		I2C5_Stop();
JAL	_I2C5_Stop+0
NOP	
;I2C_LCD.c,49 :: 		}
L_I2C_PCF8574_Write4:
;I2C_LCD.c,58 :: 		}
L_end_I2C_PCF8574_Write:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_PCF8574_Write
_I2C_LCD_putcmd:
;I2C_LCD.c,63 :: 		void I2C_LCD_putcmd(UChar addr, UChar dta,UChar cmdtype){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;I2C_LCD.c,66 :: 		lcddataA = ((cmdtype & 0XFF)|HI_NIBBLE(dta)|LCD_BL);
SW	R26, 4(SP)
ANDI	R3, R27, 255
ANDI	R2, R26, 240
OR	R2, R3, R2
ORI	R2, R2, 8
SB	R2, 11(SP)
;I2C_LCD.c,67 :: 		I2C_PCF8574_Write(addr,lcddataA );
SB	R27, 8(SP)
SB	R26, 9(SP)
SB	R25, 10(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 10(SP)
;I2C_LCD.c,68 :: 		I2C_PCF8574_Write(addr,lcddataA |  LCD_EN);    // LCD_EN = 0X04
LBU	R2, 11(SP)
ORI	R2, R2, 4
SB	R25, 10(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 10(SP)
;I2C_LCD.c,69 :: 		I2C_PCF8574_Write(addr,lcddataA & ~LCD_EN);    // Reset LCD bus
LBU	R3, 11(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R25, 10(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 10(SP)
LBU	R26, 9(SP)
LBU	R27, 8(SP)
;I2C_LCD.c,71 :: 		lcddataB = ((cmdtype & 0XFF)|LO_NIBBLE(dta)| LCD_BL) ;
ANDI	R3, R27, 255
ANDI	R2, R26, 255
SLL	R2, R2, 4
ANDI	R2, R2, 240
OR	R2, R3, R2
ORI	R2, R2, 8
SB	R2, 12(SP)
;I2C_LCD.c,72 :: 		I2C_PCF8574_Write(addr,lcddataB);
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,73 :: 		I2C_PCF8574_Write(addr,lcddataB | LCD_EN);        // LCD_EN = 0X04
LBU	R2, 12(SP)
ORI	R2, R2, 4
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,74 :: 		I2C_PCF8574_Write(addr,lcddataB & ~LCD_EN);    // Reset LCD bus
LBU	R3, 12(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
;I2C_LCD.c,75 :: 		} // LCD_putcmd())
L_end_I2C_LCD_putcmd:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _I2C_LCD_putcmd
_I2C_LCD_goto:
;I2C_LCD.c,80 :: 		void I2C_LCD_goto(UChar addr,UChar row, UChar col){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,81 :: 		switch(row){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_I2C_LCD_goto5
NOP	
;I2C_LCD.c,82 :: 		case 1 : I2C_LCD_putcmd(addr,LCD_LINE1 + (col - 1), 0); break;
L_I2C_LCD_goto7:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 128
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto6
NOP	
;I2C_LCD.c,83 :: 		case 2 : I2C_LCD_putcmd(addr,LCD_LINE2 + (col - 1), 0); break;
L_I2C_LCD_goto8:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 192
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto6
NOP	
;I2C_LCD.c,84 :: 		case 3 : I2C_LCD_putcmd(addr,LCD_LINE3 + (col - 1), 0); break;
L_I2C_LCD_goto9:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 148
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto6
NOP	
;I2C_LCD.c,85 :: 		case 4 : I2C_LCD_putcmd(addr,LCD_LINE4 + (col - 1), 0); break;
L_I2C_LCD_goto10:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 212
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto6
NOP	
;I2C_LCD.c,86 :: 		default: I2C_LCD_putcmd(addr,LCD_LINE1 + (col - 1), 0); break;
L_I2C_LCD_goto11:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 128
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto6
NOP	
;I2C_LCD.c,87 :: 		}
L_I2C_LCD_goto5:
ANDI	R3, R26, 255
ORI	R2, R0, 1
BNE	R3, R2, L__I2C_LCD_goto62
NOP	
J	L_I2C_LCD_goto7
NOP	
L__I2C_LCD_goto62:
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__I2C_LCD_goto64
NOP	
J	L_I2C_LCD_goto8
NOP	
L__I2C_LCD_goto64:
ANDI	R3, R26, 255
ORI	R2, R0, 3
BNE	R3, R2, L__I2C_LCD_goto66
NOP	
J	L_I2C_LCD_goto9
NOP	
L__I2C_LCD_goto66:
ANDI	R3, R26, 255
ORI	R2, R0, 4
BNE	R3, R2, L__I2C_LCD_goto68
NOP	
J	L_I2C_LCD_goto10
NOP	
L__I2C_LCD_goto68:
J	L_I2C_LCD_goto11
NOP	
L_I2C_LCD_goto6:
;I2C_LCD.c,89 :: 		} // LCD_GOTO()
L_end_I2C_LCD_goto:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_LCD_goto
_I2C_Lcd_Cmd:
;I2C_LCD.c,94 :: 		void I2C_Lcd_Cmd(UChar addr,Cmd_Type cmd,UChar col){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,95 :: 		switch(cmd){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_I2C_Lcd_Cmd12
NOP	
;I2C_LCD.c,96 :: 		case 1: I2C_LCD_goto(addr,LCD_LINE1 + 1,col); //_LCD_FIRST_ROW
L_I2C_Lcd_Cmd14:
ORI	R26, R0, 129
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,97 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,98 :: 		case 2: I2C_LCD_goto(addr,LCD_LINE2 + 1,col);//_LCD_SECOND_ROW
L_I2C_Lcd_Cmd15:
ORI	R26, R0, 193
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,99 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,100 :: 		case 3: I2C_LCD_goto(addr,LCD_LINE3 + 1,col);//_LCD_THIRD_ROW
L_I2C_Lcd_Cmd16:
ORI	R26, R0, 149
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,101 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,102 :: 		case 4: I2C_LCD_goto(addr,LCD_LINE4 + 1,col);//_LCD_FOURTH_ROW
L_I2C_Lcd_Cmd17:
ORI	R26, R0, 213
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,103 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,104 :: 		case 5: I2C_LCD_putcmd(addr,0x01,0);         //_LCD_CLEAR
L_I2C_Lcd_Cmd18:
MOVZ	R27, R0, R0
ORI	R26, R0, 1
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,105 :: 		delay_ms(10);
LUI	R24, 10
ORI	R24, R24, 11306
L_I2C_Lcd_Cmd19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_Lcd_Cmd19
NOP	
;I2C_LCD.c,106 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,107 :: 		case 6: I2C_LCD_putcmd(addr,0x02,0);         //_LCD_RETURN_HOME
L_I2C_Lcd_Cmd21:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,108 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,109 :: 		case 7: I2C_LCD_putcmd(addr,0x0C,0);         //_LCD_CURSOR_OFF
L_I2C_Lcd_Cmd22:
MOVZ	R27, R0, R0
ORI	R26, R0, 12
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,110 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,111 :: 		case 8: I2C_LCD_putcmd(addr,0x0E,0);         //_LCD_UNDERLINE_ON
L_I2C_Lcd_Cmd23:
MOVZ	R27, R0, R0
ORI	R26, R0, 14
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,112 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,113 :: 		case 9: I2C_LCD_putcmd(addr,0x0F,0);         //_LCD_BLINK_CURSOR_ON
L_I2C_Lcd_Cmd24:
MOVZ	R27, R0, R0
ORI	R26, R0, 15
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,114 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,115 :: 		case 10: I2C_LCD_putcmd(addr,0x10,0);        //_LCD_MOVE_CURSOR_LEFT
L_I2C_Lcd_Cmd25:
MOVZ	R27, R0, R0
ORI	R26, R0, 16
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,116 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,117 :: 		case 11: I2C_LCD_putcmd(addr,0x14,0);        //_LCD_MOVE_CURSOR_RIGHT
L_I2C_Lcd_Cmd26:
MOVZ	R27, R0, R0
ORI	R26, R0, 20
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,118 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,119 :: 		case 12: I2C_LCD_putcmd(addr,0x0C,0);        //_LCD_TURN_ON
L_I2C_Lcd_Cmd27:
MOVZ	R27, R0, R0
ORI	R26, R0, 12
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,120 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,121 :: 		case 13: I2C_LCD_putcmd(addr,0x08,0);        //_LCD_TURN_OFF
L_I2C_Lcd_Cmd28:
MOVZ	R27, R0, R0
ORI	R26, R0, 8
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,122 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,123 :: 		case 14: I2C_LCD_putcmd(addr,0x18,0);         //_LCD_SHIFT_LEFT
L_I2C_Lcd_Cmd29:
MOVZ	R27, R0, R0
ORI	R26, R0, 24
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,124 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,125 :: 		case 15: I2C_LCD_putcmd(addr,0x1C,0);        //_LCD_SHIFT_RIGHT
L_I2C_Lcd_Cmd30:
MOVZ	R27, R0, R0
ORI	R26, R0, 28
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,126 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,127 :: 		case 16: I2C_LCD_putcmd(addr,0x06,0);        //_LCD_INCREMENT_NO_SHIFT
L_I2C_Lcd_Cmd31:
MOVZ	R27, R0, R0
ORI	R26, R0, 6
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,128 :: 		break;
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,129 :: 		default:break;
L_I2C_Lcd_Cmd32:
J	L_I2C_Lcd_Cmd13
NOP	
;I2C_LCD.c,130 :: 		}
L_I2C_Lcd_Cmd12:
ANDI	R3, R26, 255
ORI	R2, R0, 1
BNE	R3, R2, L__I2C_Lcd_Cmd71
NOP	
J	L_I2C_Lcd_Cmd14
NOP	
L__I2C_Lcd_Cmd71:
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__I2C_Lcd_Cmd73
NOP	
J	L_I2C_Lcd_Cmd15
NOP	
L__I2C_Lcd_Cmd73:
ANDI	R3, R26, 255
ORI	R2, R0, 3
BNE	R3, R2, L__I2C_Lcd_Cmd75
NOP	
J	L_I2C_Lcd_Cmd16
NOP	
L__I2C_Lcd_Cmd75:
ANDI	R3, R26, 255
ORI	R2, R0, 4
BNE	R3, R2, L__I2C_Lcd_Cmd77
NOP	
J	L_I2C_Lcd_Cmd17
NOP	
L__I2C_Lcd_Cmd77:
ANDI	R3, R26, 255
ORI	R2, R0, 5
BNE	R3, R2, L__I2C_Lcd_Cmd79
NOP	
J	L_I2C_Lcd_Cmd18
NOP	
L__I2C_Lcd_Cmd79:
ANDI	R3, R26, 255
ORI	R2, R0, 6
BNE	R3, R2, L__I2C_Lcd_Cmd81
NOP	
J	L_I2C_Lcd_Cmd21
NOP	
L__I2C_Lcd_Cmd81:
ANDI	R3, R26, 255
ORI	R2, R0, 7
BNE	R3, R2, L__I2C_Lcd_Cmd83
NOP	
J	L_I2C_Lcd_Cmd22
NOP	
L__I2C_Lcd_Cmd83:
ANDI	R3, R26, 255
ORI	R2, R0, 8
BNE	R3, R2, L__I2C_Lcd_Cmd85
NOP	
J	L_I2C_Lcd_Cmd23
NOP	
L__I2C_Lcd_Cmd85:
ANDI	R3, R26, 255
ORI	R2, R0, 9
BNE	R3, R2, L__I2C_Lcd_Cmd87
NOP	
J	L_I2C_Lcd_Cmd24
NOP	
L__I2C_Lcd_Cmd87:
ANDI	R3, R26, 255
ORI	R2, R0, 10
BNE	R3, R2, L__I2C_Lcd_Cmd89
NOP	
J	L_I2C_Lcd_Cmd25
NOP	
L__I2C_Lcd_Cmd89:
ANDI	R3, R26, 255
ORI	R2, R0, 11
BNE	R3, R2, L__I2C_Lcd_Cmd91
NOP	
J	L_I2C_Lcd_Cmd26
NOP	
L__I2C_Lcd_Cmd91:
ANDI	R3, R26, 255
ORI	R2, R0, 12
BNE	R3, R2, L__I2C_Lcd_Cmd93
NOP	
J	L_I2C_Lcd_Cmd27
NOP	
L__I2C_Lcd_Cmd93:
ANDI	R3, R26, 255
ORI	R2, R0, 13
BNE	R3, R2, L__I2C_Lcd_Cmd95
NOP	
J	L_I2C_Lcd_Cmd28
NOP	
L__I2C_Lcd_Cmd95:
ANDI	R3, R26, 255
ORI	R2, R0, 14
BNE	R3, R2, L__I2C_Lcd_Cmd97
NOP	
J	L_I2C_Lcd_Cmd29
NOP	
L__I2C_Lcd_Cmd97:
ANDI	R3, R26, 255
ORI	R2, R0, 15
BNE	R3, R2, L__I2C_Lcd_Cmd99
NOP	
J	L_I2C_Lcd_Cmd30
NOP	
L__I2C_Lcd_Cmd99:
ANDI	R3, R26, 255
ORI	R2, R0, 16
BNE	R3, R2, L__I2C_Lcd_Cmd101
NOP	
J	L_I2C_Lcd_Cmd31
NOP	
L__I2C_Lcd_Cmd101:
J	L_I2C_Lcd_Cmd32
NOP	
L_I2C_Lcd_Cmd13:
;I2C_LCD.c,132 :: 		}
L_end_I2C_Lcd_Cmd:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_Lcd_Cmd
_I2C_LCD_putch:
;I2C_LCD.c,137 :: 		void I2C_LCD_putch(UChar addr, UChar dta){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,140 :: 		lcddata = HI_NIBBLE(dta)|LCD_BL|LCD_RS; // Get high nibble
SW	R26, 4(SP)
ANDI	R2, R26, 240
ORI	R2, R2, 8
ORI	R2, R2, 1
SB	R2, 10(SP)
;I2C_LCD.c,141 :: 		I2C_PCF8574_Write(addr,lcddata & 0X08);
ANDI	R2, R2, 8
SB	R26, 8(SP)
SB	R25, 9(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,142 :: 		I2C_PCF8574_Write(addr,lcddata | LCD_EN); // Send it!
LBU	R2, 10(SP)
ORI	R2, R2, 4
SB	R25, 9(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,143 :: 		I2C_PCF8574_Write(addr,lcddata & ~LCD_EN); // Reset LCD bus
LBU	R3, 10(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R25, 9(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,145 :: 		lcddata = LO_NIBBLE(dta)|LCD_BL|LCD_RS; // Get low nibble
ANDI	R2, R26, 255
SLL	R2, R2, 4
ANDI	R2, R2, 240
ORI	R2, R2, 8
ORI	R2, R2, 1
SB	R2, 10(SP)
;I2C_LCD.c,146 :: 		I2C_PCF8574_Write(addr,lcddata & 0X08);
ANDI	R2, R2, 8
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,147 :: 		I2C_PCF8574_Write(addr,lcddata | LCD_EN); // Send it!
LBU	R2, 10(SP)
ORI	R2, R2, 4
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,148 :: 		I2C_PCF8574_Write(addr,lcddata & ~LCD_EN); // Reset LCD bus
LBU	R3, 10(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
;I2C_LCD.c,149 :: 		} // LCD_putch()
L_end_I2C_LCD_putch:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_LCD_putch
_I2C_LCD_Out:
;I2C_LCD.c,155 :: 		void I2C_LCD_Out(UChar addr, UChar row, UChar col, UChar *s){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,156 :: 		I2C_LCD_goto(addr,row,col);
SW	R28, 4(SP)
SB	R25, 8(SP)
JAL	_I2C_LCD_goto+0
NOP	
LBU	R25, 8(SP)
LW	R28, 4(SP)
;I2C_LCD.c,157 :: 		while(*s != 0 )I2C_LCD_putch(addr, *(s++));
L_I2C_LCD_Out33:
LBU	R2, 0(R28)
ANDI	R2, R2, 255
BNE	R2, R0, L__I2C_LCD_Out105
NOP	
J	L_I2C_LCD_Out34
NOP	
L__I2C_LCD_Out105:
SW	R28, 4(SP)
SB	R27, 8(SP)
SB	R26, 9(SP)
SB	R25, 10(SP)
LBU	R26, 0(R28)
JAL	_I2C_LCD_putch+0
NOP	
LBU	R25, 10(SP)
LBU	R26, 9(SP)
LBU	R27, 8(SP)
LW	R28, 4(SP)
ADDIU	R2, R28, 1
MOVZ	R28, R2, R0
J	L_I2C_LCD_Out33
NOP	
L_I2C_LCD_Out34:
;I2C_LCD.c,158 :: 		}
L_end_I2C_LCD_Out:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_LCD_Out
_I2C_Lcd_Chr:
;I2C_LCD.c,163 :: 		void I2C_Lcd_Chr(UChar addr, UChar row, UChar col, UChar out_char){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,164 :: 		I2C_LCD_goto(addr,row,col);
SW	R26, 4(SP)
SB	R28, 8(SP)
SB	R25, 9(SP)
JAL	_I2C_LCD_goto+0
NOP	
LBU	R25, 9(SP)
LBU	R28, 8(SP)
;I2C_LCD.c,165 :: 		I2C_LCD_putch(addr, out_char);
ANDI	R26, R28, 255
JAL	_I2C_LCD_putch+0
NOP	
;I2C_LCD.c,166 :: 		}
L_end_I2C_Lcd_Chr:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_Lcd_Chr
_I2C_LCD_init:
;I2C_LCD.c,170 :: 		void I2C_LCD_init(UChar addr){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;I2C_LCD.c,172 :: 		I2C_LCD_putcmd(addr, LCD_INIT_BYTEA,0);
SW	R26, 4(SP)
SW	R27, 8(SP)
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 51
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,173 :: 		Delay_ms(30);
LUI	R24, 30
ORI	R24, R24, 33919
L_I2C_LCD_init35:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init35
NOP	
NOP	
;I2C_LCD.c,174 :: 		I2C_LCD_putcmd(addr, LCD_INIT_BYTEB,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 50
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,175 :: 		Delay_ms(30);
LUI	R24, 30
ORI	R24, R24, 33919
L_I2C_LCD_init37:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init37
NOP	
NOP	
;I2C_LCD.c,176 :: 		I2C_LCD_putcmd(addr, LCD_INIT_BYTEC,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 40
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,177 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init39:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init39
NOP	
;I2C_LCD.c,178 :: 		I2C_LCD_putcmd(addr, LCD_BUS_WIDTH_4Bit,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 32
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,179 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init41:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init41
NOP	
;I2C_LCD.c,180 :: 		I2C_LCD_putcmd(addr, LCD_4BITS_2LINES_5x8FONT,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 40
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,181 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init43:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init43
NOP	
;I2C_LCD.c,182 :: 		I2C_LCD_putcmd(addr, LCD_DISPLAY_OFF_CURSOR_OFF_BLINK_OFF,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 8
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,183 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init45
NOP	
;I2C_LCD.c,184 :: 		I2C_LCD_putcmd(addr, LCD_CLEAR,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,185 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init47
NOP	
;I2C_LCD.c,186 :: 		I2C_LCD_putcmd(addr, LCD_INCREMENT_NO_SHIFT,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 6
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,187 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init49:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init49
NOP	
;I2C_LCD.c,188 :: 		I2C_LCD_putcmd(addr, LCD_DISPLAY_ON_CURSOR_OFF,0);
MOVZ	R27, R0, R0
ORI	R26, R0, 12
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,189 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init51
NOP	
;I2C_LCD.c,190 :: 		} // LCD_init()
L_end_I2C_LCD_init:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _I2C_LCD_init
_I2CNo_Init:
;I2C_LCD.c,192 :: 		void I2CNo_Init(I2C_Type I2C_No){
;I2C_LCD.c,193 :: 		I2CUnit = I2C_No;
ANDI	R2, R25, 255
SH	R2, Offset(_I2CUnit+0)(GP)
;I2C_LCD.c,194 :: 		}
L_end_I2CNo_Init:
JR	RA
NOP	
; end of _I2CNo_Init
