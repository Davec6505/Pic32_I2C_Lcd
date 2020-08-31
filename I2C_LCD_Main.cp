#line 1 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD_Main.c"
#line 1 "c:/users/git/pic32_i2c_lcd/i2c_lcd.h"
#line 41 "c:/users/git/pic32_i2c_lcd/i2c_lcd.h"
extern int I2CUnit;
#line 60 "c:/users/git/pic32_i2c_lcd/i2c_lcd.h"
typedef enum{
 _LCD_FIRST_ROW = 1,
 _LCD_SECOND_ROW,
 _LCD_THIRD_ROW,
 _LCD_FOURTH_ROW,
 _LCD_CLEAR,
 _LCD_RETURN_HOME,
 _LCD_CURSOR_OFF,
 _LCD_UNDERLINE_ON,
 _LCD_BLINK_CURSOR_ON,
 _LCD_MOVE_CURSOR_LEFT,
 _LCD_MOVE_CURSOR_RIGHT,
 _LCD_TURN_ON,
 _LCD_TURN_OFF,
 _LCD_SHIFT_LEFT,
 _LCD_SHIFT_RIGHT,
 _LCD_INCREMENT_NO_SHIFT
}Cmd_Type;
extern Cmd_Type Cmd;


typedef enum{
 I2C1 = 1,
 I2C2,
 I2C3,
 I2C4,
 I2C5,
 I2C6
}I2C_Type;
extern I2C_Type I2C_No;


  unsigned char  I2C_PCF8574_Write( unsigned char  addr, unsigned char  Data );
 void I2C_LCD_putcmd( unsigned char  addr,  unsigned char  dta, unsigned char  cmdtype);
 void I2C_LCD_goto( unsigned char  addr, unsigned char  row,  unsigned char  col);
 void I2C_Lcd_Cmd( unsigned char  addr,Cmd_Type cmd, unsigned char  col);
 void I2C_LCD_putch( unsigned char  addr,  unsigned char  dta);
 void I2C_LCD_Out( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  *s);
 void I2C_Lcd_Chr( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  out_char);
 void I2C_LCD_init( unsigned char  addr);
 void I2C_LCD_init4l( unsigned char  addr,I2C_Type I2C_No);
 void I2CNo_Init(I2C_Type I2C_No);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 5 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD_Main.c"
 unsigned char  LCD_01_ADDRESS = 0x4E;
char txt[] = "Hello World";

void main() {
 int i = 0;
 int j = 1;
 int k = 0;
#line 23 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD_Main.c"
 SYSKEY = 0xAA996655;
 SYSKEY = 0x556699AA;
 CFGCONbits.OCACLK = 1;
 SYSKEY = 0x33333333;

 JTAGEN_bit = 0;
 Delay_ms(100);


 ANSELA = 0X0000;
 ANSELB = 0X0000;
 ANSELC = 0X0000;
 ANSELD = 0X0000;
 ANSELE = 0X0000;
 ANSELG = 0X0000;

 CNPUB = 0x0000;


 TRISA9_bit = 0;
 TRISD4_bit = 0;
 TRISE7_bit = 0;
 TRISF0_bit = 0;
 TRISF1_bit = 0;
 TRISG0_bit = 0;
 TRISG1_bit = 0;




 TRISB0_bit = 1;
 TRISC3_bit = 1;
 TRISG7_bit = 1;
 TRISG8_bit = 1;


 I2CNo_Init(I2C4);
 I2C4_Init_Advanced(50000, 100000);
 I2C_Set_Active(&I2C4_Start, &I2C4_Restart, &I2C4_Read, &I2C4_Write,
 &I2C4_Stop,&I2C4_Is_Idle);
 Delay_ms(100);
 I2C_LCD_init(LCD_01_ADDRESS);
 Delay_ms(100);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);
 Delay_ms(1000);
 i=1;j=0;
 while(1){
 j++;
 i=1;
 I2C_LCD_Out(LCD_01_ADDRESS,j,1,txt);
 if(j > 4){
 j=1;
 }
 while( i < 10){
 Delay_ms(500);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_SHIFT_RIGHT ,1);
 i++;
 }
 while( i > 0){
 Delay_ms(500);
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_SHIFT_LEFT ,1);
 i--;
 }
 I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);
 }
}
