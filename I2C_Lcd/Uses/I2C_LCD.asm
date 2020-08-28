_I2C_PCF8574_Write:
;I2C_LCD.c,9 :: 		UChar I2C_PCF8574_Write(UChar addr,UChar Data){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,12 :: 		I2C2_Start();                //Start send ACK
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C2_Start+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,13 :: 		S = I2C2_Write(addr);        //Send address and check for error
JAL	_I2C2_Write+0
NOP	
LBU	R26, 8(SP)
;I2C_LCD.c,19 :: 		I2C2_Write(Data);
ANDI	R25, R26, 255
JAL	_I2C2_Write+0
NOP	
;I2C_LCD.c,20 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;I2C_LCD.c,22 :: 		}
L_end_I2C_PCF8574_Write:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_PCF8574_Write
_I2C_LCD_putcmd:
;I2C_LCD.c,27 :: 		void I2C_LCD_putcmd(UChar addr, UChar dta,UChar cmdtype){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;I2C_LCD.c,30 :: 		lcddataA = ((cmdtype & 0XFF)|HI_NIBBLE(dta)|LCD_BL);
SW	R26, 4(SP)
ANDI	R3, R27, 255
ANDI	R2, R26, 240
OR	R2, R3, R2
ORI	R2, R2, 8
SB	R2, 11(SP)
;I2C_LCD.c,31 :: 		I2C_PCF8574_Write(addr,lcddataA );
SB	R27, 8(SP)
SB	R26, 9(SP)
SB	R25, 10(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 10(SP)
;I2C_LCD.c,32 :: 		I2C_PCF8574_Write(addr,lcddataA |  LCD_EN);    // LCD_EN = 0X04
LBU	R2, 11(SP)
ORI	R2, R2, 4
SB	R25, 10(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 10(SP)
;I2C_LCD.c,33 :: 		I2C_PCF8574_Write(addr,lcddataA & ~LCD_EN);    // Reset LCD bus
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
;I2C_LCD.c,35 :: 		lcddataB = ((cmdtype & 0XFF)|LO_NIBBLE(dta)| LCD_BL) ;
ANDI	R3, R27, 255
ANDI	R2, R26, 255
SLL	R2, R2, 4
ANDI	R2, R2, 240
OR	R2, R3, R2
ORI	R2, R2, 8
SB	R2, 12(SP)
;I2C_LCD.c,36 :: 		I2C_PCF8574_Write(addr,lcddataB);
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,37 :: 		I2C_PCF8574_Write(addr,lcddataB | LCD_EN);        // LCD_EN = 0X04
LBU	R2, 12(SP)
ORI	R2, R2, 4
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,38 :: 		I2C_PCF8574_Write(addr,lcddataB & ~LCD_EN);    // Reset LCD bus
LBU	R3, 12(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
;I2C_LCD.c,39 :: 		} // LCD_putcmd())
L_end_I2C_LCD_putcmd:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _I2C_LCD_putcmd
_I2C_LCD_goto:
;I2C_LCD.c,44 :: 		void I2C_LCD_goto(UChar addr,UChar row, UChar col){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,45 :: 		switch(row){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_I2C_LCD_goto0
NOP	
;I2C_LCD.c,46 :: 		case 1 : I2C_LCD_putcmd(addr,LCD_LINE1 + (col - 1), 0); break;
L_I2C_LCD_goto2:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 128
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto1
NOP	
;I2C_LCD.c,47 :: 		case 2 : I2C_LCD_putcmd(addr,LCD_LINE2 + (col - 1), 0); break;
L_I2C_LCD_goto3:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 192
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto1
NOP	
;I2C_LCD.c,48 :: 		case 3 : I2C_LCD_putcmd(addr,LCD_LINE3 + (col - 1), 0); break;
L_I2C_LCD_goto4:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 148
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto1
NOP	
;I2C_LCD.c,49 :: 		case 4 : I2C_LCD_putcmd(addr,LCD_LINE4 + (col - 1), 0); break;
L_I2C_LCD_goto5:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 212
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto1
NOP	
;I2C_LCD.c,50 :: 		default: I2C_LCD_putcmd(addr,LCD_LINE1 + (col - 1), 0); break;
L_I2C_LCD_goto6:
ADDIU	R2, R27, -1
ADDIU	R2, R2, 128
MOVZ	R27, R0, R0
ANDI	R26, R2, 255
JAL	_I2C_LCD_putcmd+0
NOP	
J	L_I2C_LCD_goto1
NOP	
;I2C_LCD.c,51 :: 		}
L_I2C_LCD_goto0:
ANDI	R3, R26, 255
ORI	R2, R0, 1
BNE	R3, R2, L__I2C_LCD_goto52
NOP	
J	L_I2C_LCD_goto2
NOP	
L__I2C_LCD_goto52:
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__I2C_LCD_goto54
NOP	
J	L_I2C_LCD_goto3
NOP	
L__I2C_LCD_goto54:
ANDI	R3, R26, 255
ORI	R2, R0, 3
BNE	R3, R2, L__I2C_LCD_goto56
NOP	
J	L_I2C_LCD_goto4
NOP	
L__I2C_LCD_goto56:
ANDI	R3, R26, 255
ORI	R2, R0, 4
BNE	R3, R2, L__I2C_LCD_goto58
NOP	
J	L_I2C_LCD_goto5
NOP	
L__I2C_LCD_goto58:
J	L_I2C_LCD_goto6
NOP	
L_I2C_LCD_goto1:
;I2C_LCD.c,53 :: 		} // LCD_GOTO()
L_end_I2C_LCD_goto:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_LCD_goto
_I2C_Lcd_Cmd:
;I2C_LCD.c,58 :: 		void I2C_Lcd_Cmd(UChar addr,Cmd_Type cmd,UChar col){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,59 :: 		switch(cmd){
SW	R26, 4(SP)
SW	R27, 8(SP)
J	L_I2C_Lcd_Cmd7
NOP	
;I2C_LCD.c,60 :: 		case 1: I2C_LCD_goto(addr,LCD_LINE1 + 1,col); //_LCD_FIRST_ROW
L_I2C_Lcd_Cmd9:
ORI	R26, R0, 129
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,61 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,62 :: 		case 2: I2C_LCD_goto(addr,LCD_LINE2 + 1,col);//_LCD_SECOND_ROW
L_I2C_Lcd_Cmd10:
ORI	R26, R0, 193
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,63 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,64 :: 		case 3: I2C_LCD_goto(addr,LCD_LINE3 + 1,col);//_LCD_THIRD_ROW
L_I2C_Lcd_Cmd11:
ORI	R26, R0, 149
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,65 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,66 :: 		case 4: I2C_LCD_goto(addr,LCD_LINE4 + 1,col);//_LCD_FOURTH_ROW
L_I2C_Lcd_Cmd12:
ORI	R26, R0, 213
JAL	_I2C_LCD_goto+0
NOP	
;I2C_LCD.c,67 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,68 :: 		case 5: I2C_LCD_putcmd(addr,0x01,0);         //_LCD_CLEAR
L_I2C_Lcd_Cmd13:
MOVZ	R27, R0, R0
ORI	R26, R0, 1
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,69 :: 		delay_ms(10);
LUI	R24, 10
ORI	R24, R24, 11306
L_I2C_Lcd_Cmd14:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_Lcd_Cmd14
NOP	
;I2C_LCD.c,70 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,71 :: 		case 6: I2C_LCD_putcmd(addr,0x02,0);         //_LCD_RETURN_HOME
L_I2C_Lcd_Cmd16:
MOVZ	R27, R0, R0
ORI	R26, R0, 2
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,72 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,73 :: 		case 7: I2C_LCD_putcmd(addr,0x0C,0);         //_LCD_CURSOR_OFF
L_I2C_Lcd_Cmd17:
MOVZ	R27, R0, R0
ORI	R26, R0, 12
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,74 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,75 :: 		case 8: I2C_LCD_putcmd(addr,0x0E,0);         //_LCD_UNDERLINE_ON
L_I2C_Lcd_Cmd18:
MOVZ	R27, R0, R0
ORI	R26, R0, 14
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,76 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,77 :: 		case 9: I2C_LCD_putcmd(addr,0x0F,0);         //_LCD_BLINK_CURSOR_ON
L_I2C_Lcd_Cmd19:
MOVZ	R27, R0, R0
ORI	R26, R0, 15
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,78 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,79 :: 		case 10: I2C_LCD_putcmd(addr,0x10,0);        //_LCD_MOVE_CURSOR_LEFT
L_I2C_Lcd_Cmd20:
MOVZ	R27, R0, R0
ORI	R26, R0, 16
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,80 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,81 :: 		case 11: I2C_LCD_putcmd(addr,0x14,0);        //_LCD_MOVE_CURSOR_RIGHT
L_I2C_Lcd_Cmd21:
MOVZ	R27, R0, R0
ORI	R26, R0, 20
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,82 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,83 :: 		case 12: I2C_LCD_putcmd(addr,0x0C,0);        //_LCD_TURN_ON
L_I2C_Lcd_Cmd22:
MOVZ	R27, R0, R0
ORI	R26, R0, 12
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,84 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,85 :: 		case 13: I2C_LCD_putcmd(addr,0x08,0);        //_LCD_TURN_OFF
L_I2C_Lcd_Cmd23:
MOVZ	R27, R0, R0
ORI	R26, R0, 8
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,86 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,87 :: 		case 14: I2C_LCD_putcmd(addr,0x18,0);         //_LCD_SHIFT_LEFT
L_I2C_Lcd_Cmd24:
MOVZ	R27, R0, R0
ORI	R26, R0, 24
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,88 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,89 :: 		case 15: I2C_LCD_putcmd(addr,0x1C,0);        //_LCD_SHIFT_RIGHT
L_I2C_Lcd_Cmd25:
MOVZ	R27, R0, R0
ORI	R26, R0, 28
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,90 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,91 :: 		case 16: I2C_LCD_putcmd(addr,0x06,0);        //_LCD_INCREMENT_NO_SHIFT
L_I2C_Lcd_Cmd26:
MOVZ	R27, R0, R0
ORI	R26, R0, 6
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,92 :: 		break;
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,93 :: 		default:break;
L_I2C_Lcd_Cmd27:
J	L_I2C_Lcd_Cmd8
NOP	
;I2C_LCD.c,94 :: 		}
L_I2C_Lcd_Cmd7:
ANDI	R3, R26, 255
ORI	R2, R0, 1
BNE	R3, R2, L__I2C_Lcd_Cmd61
NOP	
J	L_I2C_Lcd_Cmd9
NOP	
L__I2C_Lcd_Cmd61:
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__I2C_Lcd_Cmd63
NOP	
J	L_I2C_Lcd_Cmd10
NOP	
L__I2C_Lcd_Cmd63:
ANDI	R3, R26, 255
ORI	R2, R0, 3
BNE	R3, R2, L__I2C_Lcd_Cmd65
NOP	
J	L_I2C_Lcd_Cmd11
NOP	
L__I2C_Lcd_Cmd65:
ANDI	R3, R26, 255
ORI	R2, R0, 4
BNE	R3, R2, L__I2C_Lcd_Cmd67
NOP	
J	L_I2C_Lcd_Cmd12
NOP	
L__I2C_Lcd_Cmd67:
ANDI	R3, R26, 255
ORI	R2, R0, 5
BNE	R3, R2, L__I2C_Lcd_Cmd69
NOP	
J	L_I2C_Lcd_Cmd13
NOP	
L__I2C_Lcd_Cmd69:
ANDI	R3, R26, 255
ORI	R2, R0, 6
BNE	R3, R2, L__I2C_Lcd_Cmd71
NOP	
J	L_I2C_Lcd_Cmd16
NOP	
L__I2C_Lcd_Cmd71:
ANDI	R3, R26, 255
ORI	R2, R0, 7
BNE	R3, R2, L__I2C_Lcd_Cmd73
NOP	
J	L_I2C_Lcd_Cmd17
NOP	
L__I2C_Lcd_Cmd73:
ANDI	R3, R26, 255
ORI	R2, R0, 8
BNE	R3, R2, L__I2C_Lcd_Cmd75
NOP	
J	L_I2C_Lcd_Cmd18
NOP	
L__I2C_Lcd_Cmd75:
ANDI	R3, R26, 255
ORI	R2, R0, 9
BNE	R3, R2, L__I2C_Lcd_Cmd77
NOP	
J	L_I2C_Lcd_Cmd19
NOP	
L__I2C_Lcd_Cmd77:
ANDI	R3, R26, 255
ORI	R2, R0, 10
BNE	R3, R2, L__I2C_Lcd_Cmd79
NOP	
J	L_I2C_Lcd_Cmd20
NOP	
L__I2C_Lcd_Cmd79:
ANDI	R3, R26, 255
ORI	R2, R0, 11
BNE	R3, R2, L__I2C_Lcd_Cmd81
NOP	
J	L_I2C_Lcd_Cmd21
NOP	
L__I2C_Lcd_Cmd81:
ANDI	R3, R26, 255
ORI	R2, R0, 12
BNE	R3, R2, L__I2C_Lcd_Cmd83
NOP	
J	L_I2C_Lcd_Cmd22
NOP	
L__I2C_Lcd_Cmd83:
ANDI	R3, R26, 255
ORI	R2, R0, 13
BNE	R3, R2, L__I2C_Lcd_Cmd85
NOP	
J	L_I2C_Lcd_Cmd23
NOP	
L__I2C_Lcd_Cmd85:
ANDI	R3, R26, 255
ORI	R2, R0, 14
BNE	R3, R2, L__I2C_Lcd_Cmd87
NOP	
J	L_I2C_Lcd_Cmd24
NOP	
L__I2C_Lcd_Cmd87:
ANDI	R3, R26, 255
ORI	R2, R0, 15
BNE	R3, R2, L__I2C_Lcd_Cmd89
NOP	
J	L_I2C_Lcd_Cmd25
NOP	
L__I2C_Lcd_Cmd89:
ANDI	R3, R26, 255
ORI	R2, R0, 16
BNE	R3, R2, L__I2C_Lcd_Cmd91
NOP	
J	L_I2C_Lcd_Cmd26
NOP	
L__I2C_Lcd_Cmd91:
J	L_I2C_Lcd_Cmd27
NOP	
L_I2C_Lcd_Cmd8:
;I2C_LCD.c,96 :: 		}
L_end_I2C_Lcd_Cmd:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_Lcd_Cmd
_I2C_LCD_putch:
;I2C_LCD.c,101 :: 		void I2C_LCD_putch(UChar addr, UChar dta){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,104 :: 		lcddata = HI_NIBBLE(dta)|LCD_BL|LCD_RS; // Get high nibble
SW	R26, 4(SP)
ANDI	R2, R26, 240
ORI	R2, R2, 8
ORI	R2, R2, 1
SB	R2, 10(SP)
;I2C_LCD.c,105 :: 		I2C_PCF8574_Write(addr,lcddata & 0X08);
ANDI	R2, R2, 8
SB	R26, 8(SP)
SB	R25, 9(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,106 :: 		I2C_PCF8574_Write(addr,lcddata | LCD_EN); // Send it!
LBU	R2, 10(SP)
ORI	R2, R2, 4
SB	R25, 9(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 9(SP)
;I2C_LCD.c,107 :: 		I2C_PCF8574_Write(addr,lcddata & ~LCD_EN); // Reset LCD bus
LBU	R3, 10(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
SB	R25, 9(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
;I2C_LCD.c,109 :: 		lcddata = LO_NIBBLE(dta)|LCD_BL|LCD_RS; // Get low nibble
ANDI	R2, R26, 255
SLL	R2, R2, 4
ANDI	R2, R2, 240
ORI	R2, R2, 8
ORI	R2, R2, 1
SB	R2, 10(SP)
;I2C_LCD.c,110 :: 		I2C_PCF8574_Write(addr,lcddata & 0X08);
ANDI	R2, R2, 8
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,111 :: 		I2C_PCF8574_Write(addr,lcddata | LCD_EN); // Send it!
LBU	R2, 10(SP)
ORI	R2, R2, 4
SB	R25, 8(SP)
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
LBU	R25, 8(SP)
;I2C_LCD.c,112 :: 		I2C_PCF8574_Write(addr,lcddata & ~LCD_EN); // Reset LCD bus
LBU	R3, 10(SP)
ORI	R2, R0, 251
AND	R2, R3, R2
ANDI	R26, R2, 255
JAL	_I2C_PCF8574_Write+0
NOP	
;I2C_LCD.c,113 :: 		} // LCD_putch()
L_end_I2C_LCD_putch:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_LCD_putch
_I2C_LCD_Out:
;I2C_LCD.c,119 :: 		void I2C_LCD_Out(UChar addr, UChar row, UChar col, UChar *s){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,120 :: 		I2C_LCD_goto(addr,row,col);
SW	R28, 4(SP)
SB	R25, 8(SP)
JAL	_I2C_LCD_goto+0
NOP	
LBU	R25, 8(SP)
LW	R28, 4(SP)
;I2C_LCD.c,121 :: 		while(*s != 0 )I2C_LCD_putch(addr, *(s++));
L_I2C_LCD_Out28:
LBU	R2, 0(R28)
ANDI	R2, R2, 255
BNE	R2, R0, L__I2C_LCD_Out95
NOP	
J	L_I2C_LCD_Out29
NOP	
L__I2C_LCD_Out95:
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
J	L_I2C_LCD_Out28
NOP	
L_I2C_LCD_Out29:
;I2C_LCD.c,122 :: 		}
L_end_I2C_LCD_Out:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_LCD_Out
_I2C_Lcd_Chr:
;I2C_LCD.c,127 :: 		void I2C_Lcd_Chr(UChar addr, UChar row, UChar col, UChar out_char){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;I2C_LCD.c,128 :: 		I2C_LCD_goto(addr,row,col);
SW	R26, 4(SP)
SB	R28, 8(SP)
SB	R25, 9(SP)
JAL	_I2C_LCD_goto+0
NOP	
LBU	R25, 9(SP)
LBU	R28, 8(SP)
;I2C_LCD.c,129 :: 		I2C_LCD_putch(addr, out_char);
ANDI	R26, R28, 255
JAL	_I2C_LCD_putch+0
NOP	
;I2C_LCD.c,130 :: 		}
L_end_I2C_Lcd_Chr:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _I2C_Lcd_Chr
_I2C_LCD_init:
;I2C_LCD.c,134 :: 		void I2C_LCD_init(UChar addr){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;I2C_LCD.c,136 :: 		I2C_LCD_putcmd(addr, LCD_INIT_BYTEA,0);
SW	R26, 4(SP)
SW	R27, 8(SP)
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 51
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,137 :: 		Delay_ms(30);
LUI	R24, 30
ORI	R24, R24, 33919
L_I2C_LCD_init30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init30
NOP	
NOP	
;I2C_LCD.c,138 :: 		I2C_LCD_putcmd(addr, LCD_INIT_BYTEB,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 50
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,139 :: 		Delay_ms(30);
LUI	R24, 30
ORI	R24, R24, 33919
L_I2C_LCD_init32:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init32
NOP	
NOP	
;I2C_LCD.c,140 :: 		I2C_LCD_putcmd(addr, LCD_INIT_BYTEC,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 40
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,141 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init34
NOP	
;I2C_LCD.c,142 :: 		I2C_LCD_putcmd(addr, LCD_BUS_WIDTH_4Bit,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 32
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,143 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init36
NOP	
;I2C_LCD.c,144 :: 		I2C_LCD_putcmd(addr, LCD_4BITS_2LINES_5x8FONT,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 40
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,145 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init38
NOP	
;I2C_LCD.c,146 :: 		I2C_LCD_putcmd(addr, LCD_DISPLAY_OFF_CURSOR_OFF_BLINK_OFF,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 8
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,147 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init40:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init40
NOP	
;I2C_LCD.c,148 :: 		I2C_LCD_putcmd(addr, LCD_CLEAR,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 1
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,149 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init42
NOP	
;I2C_LCD.c,150 :: 		I2C_LCD_putcmd(addr, LCD_INCREMENT_NO_SHIFT,0);
SB	R25, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 6
JAL	_I2C_LCD_putcmd+0
NOP	
LBU	R25, 12(SP)
;I2C_LCD.c,151 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init44:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init44
NOP	
;I2C_LCD.c,152 :: 		I2C_LCD_putcmd(addr, LCD_DISPLAY_ON_CURSOR_OFF,0);
MOVZ	R27, R0, R0
ORI	R26, R0, 12
JAL	_I2C_LCD_putcmd+0
NOP	
;I2C_LCD.c,153 :: 		Delay_ms(25);
LUI	R24, 25
ORI	R24, R24, 28266
L_I2C_LCD_init46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C_LCD_init46
NOP	
;I2C_LCD.c,154 :: 		} // LCD_init()
L_end_I2C_LCD_init:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _I2C_LCD_init
