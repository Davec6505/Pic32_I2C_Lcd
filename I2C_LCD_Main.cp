#line 1 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD_Main.c"
#line 1 "c:/users/git/pic32_i2c_lcd/i2c_lcd.h"
#line 59 "c:/users/git/pic32_i2c_lcd/i2c_lcd.h"
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



  unsigned char  I2C_PCF8574_Write( unsigned char  addr, unsigned char  Data);
 void I2C_LCD_putcmd( unsigned char  addr,  unsigned char  dta, unsigned char  cmdtype);
 void I2C_LCD_goto( unsigned char  addr, unsigned char  row,  unsigned char  col);
 void I2C_Lcd_Cmd( unsigned char  addr,Cmd_Type cmd, unsigned char  col);
 void I2C_LCD_putch( unsigned char  addr,  unsigned char  dta);
 void I2C_LCD_Out( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  *s);
 void I2C_Lcd_Chr( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  out_char);
 void I2C_LCD_init( unsigned char  addr);
 void I2C_LCD_init4l( unsigned char  addr);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 5 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD_Main.c"
 unsigned char  LCD_01_ADDRESS = 0x4E;

char txt[] = "Hello World";

void main() {
 int i = 0;
 int j = 1;
 int k = 0;

 TRISE3_bit = 0;
 AD1PCFG = 0xFFFFFFFF;
 JTAGEN_bit = 0;
 I2C2_Init(100000);
 I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write, &I2C2_Stop,&I2C2_Is_Idle);
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
