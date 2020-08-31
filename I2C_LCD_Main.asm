_main:
;I2C_LCD_Main.c,8 :: 		void main() {
ADDIU	SP, SP, -4
;I2C_LCD_Main.c,9 :: 		int i = 0;
;I2C_LCD_Main.c,10 :: 		int j = 1;
;I2C_LCD_Main.c,11 :: 		int k = 0;
;I2C_LCD_Main.c,23 :: 		SYSKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
;I2C_LCD_Main.c,24 :: 		SYSKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
;I2C_LCD_Main.c,25 :: 		CFGCONbits.OCACLK = 1;
LBU	R2, Offset(CFGCONbits+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(CFGCONbits+2)(GP)
;I2C_LCD_Main.c,26 :: 		SYSKEY = 0x33333333;
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
;I2C_LCD_Main.c,28 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;I2C_LCD_Main.c,29 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
;I2C_LCD_Main.c,32 :: 		ANSELA = 0X0000;
SW	R0, Offset(ANSELA+0)(GP)
;I2C_LCD_Main.c,33 :: 		ANSELB = 0X0000;
SW	R0, Offset(ANSELB+0)(GP)
;I2C_LCD_Main.c,34 :: 		ANSELC = 0X0000;
SW	R0, Offset(ANSELC+0)(GP)
;I2C_LCD_Main.c,35 :: 		ANSELD = 0X0000;
SW	R0, Offset(ANSELD+0)(GP)
;I2C_LCD_Main.c,36 :: 		ANSELE = 0X0000;
SW	R0, Offset(ANSELE+0)(GP)
;I2C_LCD_Main.c,37 :: 		ANSELG = 0X0000;
SW	R0, Offset(ANSELG+0)(GP)
;I2C_LCD_Main.c,39 :: 		CNPUB = 0x0000;
SW	R0, Offset(CNPUB+0)(GP)
;I2C_LCD_Main.c,42 :: 		TRISA9_bit = 0;
LUI	R2, BitMask(TRISA9_bit+0)
ORI	R2, R2, BitMask(TRISA9_bit+0)
_SX	
;I2C_LCD_Main.c,43 :: 		TRISD4_bit = 0;
LUI	R2, BitMask(TRISD4_bit+0)
ORI	R2, R2, BitMask(TRISD4_bit+0)
_SX	
;I2C_LCD_Main.c,44 :: 		TRISE7_bit = 0;
LUI	R2, BitMask(TRISE7_bit+0)
ORI	R2, R2, BitMask(TRISE7_bit+0)
_SX	
;I2C_LCD_Main.c,45 :: 		TRISF0_bit = 0;
LUI	R2, BitMask(TRISF0_bit+0)
ORI	R2, R2, BitMask(TRISF0_bit+0)
_SX	
;I2C_LCD_Main.c,46 :: 		TRISF1_bit = 0;
LUI	R2, BitMask(TRISF1_bit+0)
ORI	R2, R2, BitMask(TRISF1_bit+0)
_SX	
;I2C_LCD_Main.c,47 :: 		TRISG0_bit = 0;
LUI	R2, BitMask(TRISG0_bit+0)
ORI	R2, R2, BitMask(TRISG0_bit+0)
_SX	
;I2C_LCD_Main.c,48 :: 		TRISG1_bit = 0;
LUI	R2, BitMask(TRISG1_bit+0)
ORI	R2, R2, BitMask(TRISG1_bit+0)
_SX	
;I2C_LCD_Main.c,53 :: 		TRISB0_bit = 1;
LUI	R2, BitMask(TRISB0_bit+0)
ORI	R2, R2, BitMask(TRISB0_bit+0)
_SX	
;I2C_LCD_Main.c,54 :: 		TRISC3_bit = 1;
LUI	R2, BitMask(TRISC3_bit+0)
ORI	R2, R2, BitMask(TRISC3_bit+0)
_SX	
;I2C_LCD_Main.c,55 :: 		TRISG7_bit = 1;
LUI	R2, BitMask(TRISG7_bit+0)
ORI	R2, R2, BitMask(TRISG7_bit+0)
_SX	
;I2C_LCD_Main.c,56 :: 		TRISG8_bit = 1;
LUI	R2, BitMask(TRISG8_bit+0)
ORI	R2, R2, BitMask(TRISG8_bit+0)
_SX	
;I2C_LCD_Main.c,59 :: 		I2CNo_Init(I2C4);
ORI	R25, R0, 4
JAL	_I2CNo_Init+0
NOP	
;I2C_LCD_Main.c,60 :: 		I2C4_Init_Advanced(50000, 100000);
LUI	R26, 1
ORI	R26, R26, 34464
ORI	R25, R0, 50000
JAL	_I2C4_Init_Advanced+0
NOP	
;I2C_LCD_Main.c,61 :: 		I2C_Set_Active(&I2C4_Start, &I2C4_Restart, &I2C4_Read, &I2C4_Write,
LUI	R28, hi_addr(_I2C4_Write+0)
ORI	R28, R28, lo_addr(_I2C4_Write+0)
LUI	R27, hi_addr(_I2C4_Read+0)
ORI	R27, R27, lo_addr(_I2C4_Read+0)
LUI	R26, hi_addr(_I2C4_Restart+0)
ORI	R26, R26, lo_addr(_I2C4_Restart+0)
LUI	R25, hi_addr(_I2C4_Start+0)
ORI	R25, R25, lo_addr(_I2C4_Start+0)
;I2C_LCD_Main.c,62 :: 		&I2C4_Stop,&I2C4_Is_Idle); // Sets the I2C4 module active
LUI	R2, hi_addr(_I2C4_Is_Idle+0)
ORI	R2, R2, lo_addr(_I2C4_Is_Idle+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_I2C4_Stop+0)
ORI	R2, R2, lo_addr(_I2C4_Stop+0)
SW	R2, 0(SP)
JAL	_I2C_Set_Active+0
NOP	
ADDIU	SP, SP, 8
;I2C_LCD_Main.c,63 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_main2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main2
NOP	
;I2C_LCD_Main.c,64 :: 		I2C_LCD_init(LCD_01_ADDRESS);
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_init+0
NOP	
;I2C_LCD_Main.c,65 :: 		Delay_ms(100);
LUI	R24, 101
ORI	R24, R24, 47530
L_main4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main4
NOP	
;I2C_LCD_Main.c,66 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,67 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1);     // Cursor off
ORI	R27, R0, 1
ORI	R26, R0, 7
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,68 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);          // Clear display
ORI	R27, R0, 1
ORI	R26, R0, 5
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,69 :: 		Delay_ms(1000);
LUI	R24, 1017
ORI	R24, R24, 16554
L_main6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main6
NOP	
;I2C_LCD_Main.c,70 :: 		i=1;j=0;
SH	R0, 2(SP)
;I2C_LCD_Main.c,71 :: 		while(1){
L_main8:
;I2C_LCD_Main.c,72 :: 		j++;
LH	R2, 2(SP)
ADDIU	R3, R2, 1
SH	R3, 2(SP)
;I2C_LCD_Main.c,73 :: 		i=1;
ORI	R2, R0, 1
SH	R2, 0(SP)
;I2C_LCD_Main.c,74 :: 		I2C_LCD_Out(LCD_01_ADDRESS,j,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
SEH	R26, R3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;I2C_LCD_Main.c,75 :: 		if(j > 4){
LH	R2, 2(SP)
SLTI	R2, R2, 5
BEQ	R2, R0, L__main20
NOP	
J	L_main10
NOP	
L__main20:
;I2C_LCD_Main.c,76 :: 		j=1;
ORI	R2, R0, 1
SH	R2, 2(SP)
;I2C_LCD_Main.c,77 :: 		}
L_main10:
;I2C_LCD_Main.c,78 :: 		while( i < 10){
L_main11:
LH	R2, 0(SP)
SLTI	R2, R2, 10
BNE	R2, R0, L__main21
NOP	
J	L_main12
NOP	
L__main21:
;I2C_LCD_Main.c,79 :: 		Delay_ms(500);
LUI	R24, 508
ORI	R24, R24, 41044
L_main13:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main13
NOP	
NOP	
NOP	
;I2C_LCD_Main.c,80 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_SHIFT_RIGHT ,1);
ORI	R27, R0, 1
ORI	R26, R0, 15
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,81 :: 		i++;
LH	R2, 0(SP)
ADDIU	R2, R2, 1
SH	R2, 0(SP)
;I2C_LCD_Main.c,82 :: 		}
J	L_main11
NOP	
L_main12:
;I2C_LCD_Main.c,83 :: 		while( i > 0){
L_main15:
LH	R2, 0(SP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__main22
NOP	
J	L_main16
NOP	
L__main22:
;I2C_LCD_Main.c,84 :: 		Delay_ms(500);
LUI	R24, 508
ORI	R24, R24, 41044
L_main17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main17
NOP	
NOP	
NOP	
;I2C_LCD_Main.c,85 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_SHIFT_LEFT ,1);
ORI	R27, R0, 1
ORI	R26, R0, 14
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,86 :: 		i--;
LH	R2, 0(SP)
ADDIU	R2, R2, -1
SH	R2, 0(SP)
;I2C_LCD_Main.c,87 :: 		}
J	L_main15
NOP	
L_main16:
;I2C_LCD_Main.c,88 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);          // Clear display
ORI	R27, R0, 1
ORI	R26, R0, 5
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,89 :: 		}
J	L_main8
NOP	
;I2C_LCD_Main.c,90 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
