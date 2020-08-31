#line 1 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD.c"
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
#line 10 "C:/Users/GIT/Pic32_I2C_Lcd/I2C_LCD.c"
int I2CUnit;


 unsigned char  I2C_PCF8574_Write( unsigned char  addr, unsigned char  Data ){
 unsigned char  S,dummy;
 if(I2CUnit == I2C1){
 I2C1_Start();
 S = I2C1_Write(addr);

 I2C1_Write(Data);
 I2C1_Stop();
 }
 if(I2CUnit == I2C2){
 I2C2_Start();
 S = I2C2_Write(addr);

 I2C2_Write(Data);
 I2C2_Stop();
 }
 if(I2CUnit == I2C3){
 I2C3_Start();
 S = I2C3_Write(addr);

 I2C3_Write(Data);
 I2C3_Stop();
 }
 if(I2CUnit == I2C4){
 I2C4_Start();
 S = I2C4_Write(addr);

 I2C4_Write(Data);
 I2C4_Stop();
 }
 if(I2CUnit == I2C5){
 I2C5_Start();
 S = I2C5_Write(addr);

 I2C5_Write(Data);
 I2C5_Stop();
 }








}




void I2C_LCD_putcmd( unsigned char  addr,  unsigned char  dta, unsigned char  cmdtype){
 unsigned char lcddataA,lcddataB;

 lcddataA = ((cmdtype & 0XFF)| ((dta) & 0xF0) | 0x08 );
 I2C_PCF8574_Write(addr,lcddataA );
 I2C_PCF8574_Write(addr,lcddataA |  0x04 );
 I2C_PCF8574_Write(addr,lcddataA & ~ 0x04 );

 lcddataB = ((cmdtype & 0XFF)| (((dta) << 4) & 0xF0) |  0x08 ) ;
 I2C_PCF8574_Write(addr,lcddataB);
 I2C_PCF8574_Write(addr,lcddataB |  0x04 );
 I2C_PCF8574_Write(addr,lcddataB & ~ 0x04 );
}




void I2C_LCD_goto( unsigned char  addr, unsigned char  row,  unsigned char  col){
 switch(row){
 case 1 : I2C_LCD_putcmd(addr, 0x80  + (col - 1), 0); break;
 case 2 : I2C_LCD_putcmd(addr, 0xC0  + (col - 1), 0); break;
 case 3 : I2C_LCD_putcmd(addr, 0x94  + (col - 1), 0); break;
 case 4 : I2C_LCD_putcmd(addr, 0xD4  + (col - 1), 0); break;
 default: I2C_LCD_putcmd(addr, 0x80  + (col - 1), 0); break;
 }

 }




void I2C_Lcd_Cmd( unsigned char  addr,Cmd_Type cmd, unsigned char  col){
 switch(cmd){
 case 1: I2C_LCD_goto(addr, 0x80  + 1,col);
 break;
 case 2: I2C_LCD_goto(addr, 0xC0  + 1,col);
 break;
 case 3: I2C_LCD_goto(addr, 0x94  + 1,col);
 break;
 case 4: I2C_LCD_goto(addr, 0xD4  + 1,col);
 break;
 case 5: I2C_LCD_putcmd(addr,0x01,0);
 delay_ms(10);
 break;
 case 6: I2C_LCD_putcmd(addr,0x02,0);
 break;
 case 7: I2C_LCD_putcmd(addr,0x0C,0);
 break;
 case 8: I2C_LCD_putcmd(addr,0x0E,0);
 break;
 case 9: I2C_LCD_putcmd(addr,0x0F,0);
 break;
 case 10: I2C_LCD_putcmd(addr,0x10,0);
 break;
 case 11: I2C_LCD_putcmd(addr,0x14,0);
 break;
 case 12: I2C_LCD_putcmd(addr,0x0C,0);
 break;
 case 13: I2C_LCD_putcmd(addr,0x08,0);
 break;
 case 14: I2C_LCD_putcmd(addr,0x18,0);
 break;
 case 15: I2C_LCD_putcmd(addr,0x1C,0);
 break;
 case 16: I2C_LCD_putcmd(addr,0x06,0);
 break;
 default:break;
 }

}




void I2C_LCD_putch( unsigned char  addr,  unsigned char  dta){
  unsigned char  lcddata;

 lcddata =  ((dta) & 0xF0) | 0x08 | 0x01 ;
 I2C_PCF8574_Write(addr,lcddata & 0X08);
 I2C_PCF8574_Write(addr,lcddata |  0x04 );
 I2C_PCF8574_Write(addr,lcddata & ~ 0x04 );

 lcddata =  (((dta) << 4) & 0xF0) | 0x08 | 0x01 ;
 I2C_PCF8574_Write(addr,lcddata & 0X08);
 I2C_PCF8574_Write(addr,lcddata |  0x04 );
 I2C_PCF8574_Write(addr,lcddata & ~ 0x04 );
}





void I2C_LCD_Out( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  *s){
 I2C_LCD_goto(addr,row,col);
 while(*s != 0 )I2C_LCD_putch(addr, *(s++));
}




void I2C_Lcd_Chr( unsigned char  addr,  unsigned char  row,  unsigned char  col,  unsigned char  out_char){
 I2C_LCD_goto(addr,row,col);
 I2C_LCD_putch(addr, out_char);
}



void I2C_LCD_init( unsigned char  addr){

 I2C_LCD_putcmd(addr,  0x33 ,0);
 Delay_ms(30);
 I2C_LCD_putcmd(addr,  0x32 ,0);
 Delay_ms(30);
 I2C_LCD_putcmd(addr,  0x28 ,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr,  0x20 ,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr,  0x28 ,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr,  0x08 ,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr,  0x01 ,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr,  0x06 ,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr,  0x0c ,0);
 Delay_ms(25);
}

void I2CNo_Init(I2C_Type I2C_No){
 I2CUnit = I2C_No;
}
