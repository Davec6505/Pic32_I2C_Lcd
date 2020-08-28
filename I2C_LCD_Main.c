#include "I2C_LCD.h"
#include "built_in.h"

//UChar LCD_01_ADDRESS =  0x7E;     //PCF8574A
UChar LCD_01_ADDRESS = 0x4E;        //PCF8574T

char txt[] = "Hello World";

void main() {
  int i = 0;
  int j = 1;
  int k = 0;
//CHECON = 0x00;
  TRISE3_bit = 0;
  AD1PCFG = 0xFFFFFFFF;
  JTAGEN_bit = 0;
  I2C2_Init(100000);//INIT I2C AT 100KHZ
  I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write, &I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C1 module active
  Delay_ms(100);
  I2C_LCD_init(LCD_01_ADDRESS);
  Delay_ms(100);
  I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_FIRST_ROW,1);
  I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CURSOR_OFF,1);     // Cursor off
  I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);          // Clear display
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
          I2C_Lcd_Cmd(LCD_01_ADDRESS,_LCD_CLEAR,1);          // Clear display
  }
}