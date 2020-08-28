#include "I2C_LCD.h"


 #include "I2C_LCD.h"
 #include "built_in.h"

 ///////////////////////////////////////////////////
//SEND DATA VIA I2C_libray
UChar I2C_PCF8574_Write(UChar addr,UChar Data){
UChar S,dummy;                         //temprary variables to catch error from i2c bus

        I2C2_Start();                //Start send ACK
        S = I2C2_Write(addr);        //Send address and check for error
       // if(S != 0){                //if S then there must be bus collision
       //    LATE3_bit = 1;//!LATE3_bit;
         // dummy = SSPBUF;        //clear the buffer
         // WCOL_bit = 0;                //clear collision status bit
        // }else  LATE3_bit = 0;
        I2C2_Write(Data);
        I2C2_Stop();

}

//////////////////////////////////////////////////////////
//Extract CMD and send to I2C Write functio

void I2C_LCD_putcmd(UChar addr, UChar dta,UChar cmdtype){
 unsigned char lcddataA,lcddataB;                // member variables
 // Write Hi nibble
 lcddataA = ((cmdtype & 0XFF)|HI_NIBBLE(dta)|LCD_BL);
 I2C_PCF8574_Write(addr,lcddataA );
 I2C_PCF8574_Write(addr,lcddataA |  LCD_EN);    // LCD_EN = 0X04
 I2C_PCF8574_Write(addr,lcddataA & ~LCD_EN);    // Reset LCD bus
 // Write low nibble
 lcddataB = ((cmdtype & 0XFF)|LO_NIBBLE(dta)| LCD_BL) ;
 I2C_PCF8574_Write(addr,lcddataB);
 I2C_PCF8574_Write(addr,lcddataB | LCD_EN);        // LCD_EN = 0X04
 I2C_PCF8574_Write(addr,lcddataB & ~LCD_EN);    // Reset LCD bus
} // LCD_putcmd())

////////////////////////////////////////////////////////
// Goto line number. On line err, goto line 1.

void I2C_LCD_goto(UChar addr,UChar row, UChar col){
     switch(row){
         case 1 : I2C_LCD_putcmd(addr,LCD_LINE1 + (col - 1), 0); break;
         case 2 : I2C_LCD_putcmd(addr,LCD_LINE2 + (col - 1), 0); break;
         case 3 : I2C_LCD_putcmd(addr,LCD_LINE3 + (col - 1), 0); break;
         case 4 : I2C_LCD_putcmd(addr,LCD_LINE4 + (col - 1), 0); break;
         default: I2C_LCD_putcmd(addr,LCD_LINE1 + (col - 1), 0); break;
     }

 } // LCD_GOTO()

//////////////////////////////////////////////////////////
//create an enum inside the header function for these cmds "typedef enum{,,,,,}Cmd_Type;"

void I2C_Lcd_Cmd(UChar addr,Cmd_Type cmd,UChar col){
     switch(cmd){
         case 1: I2C_LCD_goto(addr,LCD_LINE1 + 1,col); //_LCD_FIRST_ROW
                 break;
         case 2: I2C_LCD_goto(addr,LCD_LINE2 + 1,col);//_LCD_SECOND_ROW
                 break;
         case 3: I2C_LCD_goto(addr,LCD_LINE3 + 1,col);//_LCD_THIRD_ROW
                 break;
         case 4: I2C_LCD_goto(addr,LCD_LINE4 + 1,col);//_LCD_FOURTH_ROW
                 break;
         case 5: I2C_LCD_putcmd(addr,0x01,0);         //_LCD_CLEAR
                 delay_ms(10);
                 break;
         case 6: I2C_LCD_putcmd(addr,0x02,0);         //_LCD_RETURN_HOME
                break;
         case 7: I2C_LCD_putcmd(addr,0x0C,0);         //_LCD_CURSOR_OFF
                break;
         case 8: I2C_LCD_putcmd(addr,0x0E,0);         //_LCD_UNDERLINE_ON
                break;
         case 9: I2C_LCD_putcmd(addr,0x0F,0);         //_LCD_BLINK_CURSOR_ON
                break;
         case 10: I2C_LCD_putcmd(addr,0x10,0);        //_LCD_MOVE_CURSOR_LEFT
                break;
         case 11: I2C_LCD_putcmd(addr,0x14,0);        //_LCD_MOVE_CURSOR_RIGHT
                break;
         case 12: I2C_LCD_putcmd(addr,0x0C,0);        //_LCD_TURN_ON
                break;
         case 13: I2C_LCD_putcmd(addr,0x08,0);        //_LCD_TURN_OFF
                break;
        case 14: I2C_LCD_putcmd(addr,0x18,0);         //_LCD_SHIFT_LEFT
                break;
         case 15: I2C_LCD_putcmd(addr,0x1C,0);        //_LCD_SHIFT_RIGHT
                break;
         case 16: I2C_LCD_putcmd(addr,0x06,0);        //_LCD_INCREMENT_NO_SHIFT
                break;
         default:break;
     }

}

/////////////////////////////////////////////////////////
// Extract data high and low nible and send it to I2C LCD

void I2C_LCD_putch(UChar addr, UChar dta){
 UChar lcddata;
 // Write Hi nibble
 lcddata = HI_NIBBLE(dta)|LCD_BL|LCD_RS; // Get high nibble
 I2C_PCF8574_Write(addr,lcddata & 0X08);
 I2C_PCF8574_Write(addr,lcddata | LCD_EN); // Send it!
 I2C_PCF8574_Write(addr,lcddata & ~LCD_EN); // Reset LCD bus
 // Write low nibble
 lcddata = LO_NIBBLE(dta)|LCD_BL|LCD_RS; // Get low nibble
 I2C_PCF8574_Write(addr,lcddata & 0X08);
 I2C_PCF8574_Write(addr,lcddata | LCD_EN); // Send it!
 I2C_PCF8574_Write(addr,lcddata & ~LCD_EN); // Reset LCD bus
} // LCD_putch()

/////////////////////////////////////////////////////////
// Note: The string must be zero terminated!
// Example: char callSign[] = "ve2cuy\0";

void I2C_LCD_Out(UChar addr, UChar row, UChar col, UChar *s){
  I2C_LCD_goto(addr,row,col);
  while(*s != 0 )I2C_LCD_putch(addr, *(s++));
}

////////////////////////////////////////////////////////
//write single char

void I2C_Lcd_Chr(UChar addr, UChar row, UChar col, UChar out_char){
  I2C_LCD_goto(addr,row,col);
  I2C_LCD_putch(addr, out_char);
}

////////////////////////////////////////////////////////
// Init the LCD: DATA bus 4 bits, cursor off, auto increment, no shift.
void I2C_LCD_init(UChar addr){

 I2C_LCD_putcmd(addr, LCD_INIT_BYTEA,0);
 Delay_ms(30);
 I2C_LCD_putcmd(addr, LCD_INIT_BYTEB,0);
 Delay_ms(30);
 I2C_LCD_putcmd(addr, LCD_INIT_BYTEC,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr, LCD_BUS_WIDTH_4Bit,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr, LCD_4BITS_2LINES_5x8FONT,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr, LCD_DISPLAY_OFF_CURSOR_OFF_BLINK_OFF,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr, LCD_CLEAR,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr, LCD_INCREMENT_NO_SHIFT,0);
 Delay_ms(25);
 I2C_LCD_putcmd(addr, LCD_DISPLAY_ON_CURSOR_OFF,0);
 Delay_ms(25);
} // LCD_init()
