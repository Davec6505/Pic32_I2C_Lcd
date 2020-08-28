_main:
;I2C_LCD_Main.c,9 :: 		void main() {
ADDIU	SP, SP, -4
;I2C_LCD_Main.c,10 :: 		int i = 0;
;I2C_LCD_Main.c,11 :: 		int j = 1;
;I2C_LCD_Main.c,12 :: 		int k = 0;
;I2C_LCD_Main.c,14 :: 		TRISE3_bit = 0;
LUI	R2, BitMask(TRISE3_bit+0)
ORI	R2, R2, BitMask(TRISE3_bit+0)
_SX	
;I2C_LCD_Main.c,15 :: 		AD1PCFG = 0xFFFFFFFF;
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;I2C_LCD_Main.c,16 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;I2C_LCD_Main.c,17 :: 		I2C2_Init(100000);//INIT I2C AT 100KHZ
LUI	R25, 1
ORI	R25, R25, 34464
JAL	_I2C2_Init+0
NOP	
;I2C_LCD_Main.c,18 :: 		I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write, &I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C1 module active
LUI	R28, hi_addr(_I2C2_Write+0)
ORI	R28, R28, lo_addr(_I2C2_Write+0)
LUI	R27, hi_addr(_I2C2_Read+0)
ORI	R27, R27, lo_addr(_I2C2_Read+0)
LUI	R26, hi_addr(_I2C2_Restart+0)
ORI	R26, R26, lo_addr(_I2C2_Restart+0)
LUI	R25, hi_addr(_I2C2_Start+0)
ORI	R25, R25, lo_addr(_I2C2_Start+0)
LUI	R2, hi_addr(_I2C2_Is_Idle+0)
ORI	R2, R2, lo_addr(_I2C2_Is_Idle+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_I2C2_Stop+0)
ORI	R2, R2, lo_addr(_I2C2_Stop+0)
SW	R2, 0(SP)
JAL	_I2C_Set_Active+0
NOP	
ADDIU	SP, SP, 8
;I2C_LCD_Main.c,19 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
;I2C_LCD_Main.c,20 :: 		I2C_LCD_init(LCD_01_ADDRESS);
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_init+0
NOP	
;I2C_LCD_Main.c,21 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_main2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main2
NOP	
;I2C_LCD_Main.c,22 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
ORI	R27, R0, 1
ORI	R26, R0, 1
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,23 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1);     // Cursor off
ORI	R27, R0, 1
ORI	R26, R0, 7
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,24 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);          // Clear display
ORI	R27, R0, 1
ORI	R26, R0, 5
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,25 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main4
NOP	
;I2C_LCD_Main.c,26 :: 		i=1;j=0;
SH	R0, 2(SP)
;I2C_LCD_Main.c,27 :: 		while(1){
L_main6:
;I2C_LCD_Main.c,28 :: 		j++;
LH	R2, 2(SP)
ADDIU	R3, R2, 1
SH	R3, 2(SP)
;I2C_LCD_Main.c,29 :: 		i=1;
ORI	R2, R0, 1
SH	R2, 0(SP)
;I2C_LCD_Main.c,30 :: 		I2C_LCD_Out(LCD_01_ADDRESS,j,1,txt);
LUI	R28, hi_addr(_txt+0)
ORI	R28, R28, lo_addr(_txt+0)
ORI	R27, R0, 1
SEH	R26, R3
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_LCD_Out+0
NOP	
;I2C_LCD_Main.c,31 :: 		if(j > 4){
LH	R2, 2(SP)
SLTI	R2, R2, 5
BEQ	R2, R0, L__main18
NOP	
J	L_main8
NOP	
L__main18:
;I2C_LCD_Main.c,32 :: 		j=1;
ORI	R2, R0, 1
SH	R2, 2(SP)
;I2C_LCD_Main.c,33 :: 		}
L_main8:
;I2C_LCD_Main.c,34 :: 		while( i < 10){
L_main9:
LH	R2, 0(SP)
SLTI	R2, R2, 10
BNE	R2, R0, L__main19
NOP	
J	L_main10
NOP	
L__main19:
;I2C_LCD_Main.c,35 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main11:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main11
NOP	
NOP	
NOP	
;I2C_LCD_Main.c,36 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_SHIFT_RIGHT ,1);
ORI	R27, R0, 1
ORI	R26, R0, 15
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,37 :: 		i++;
LH	R2, 0(SP)
ADDIU	R2, R2, 1
SH	R2, 0(SP)
;I2C_LCD_Main.c,38 :: 		}
J	L_main9
NOP	
L_main10:
;I2C_LCD_Main.c,39 :: 		while( i > 0){
L_main13:
LH	R2, 0(SP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__main20
NOP	
J	L_main14
NOP	
L__main20:
;I2C_LCD_Main.c,40 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main15:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main15
NOP	
NOP	
NOP	
;I2C_LCD_Main.c,41 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_SHIFT_LEFT ,1);
ORI	R27, R0, 1
ORI	R26, R0, 14
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,42 :: 		i--;
LH	R2, 0(SP)
ADDIU	R2, R2, -1
SH	R2, 0(SP)
;I2C_LCD_Main.c,43 :: 		}
J	L_main13
NOP	
L_main14:
;I2C_LCD_Main.c,44 :: 		I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);          // Clear display
ORI	R27, R0, 1
ORI	R26, R0, 5
LBU	R25, Offset(_LCD_01_ADDRESS+0)(GP)
JAL	_I2C_Lcd_Cmd+0
NOP	
;I2C_LCD_Main.c,45 :: 		}
J	L_main6
NOP	
;I2C_LCD_Main.c,46 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
