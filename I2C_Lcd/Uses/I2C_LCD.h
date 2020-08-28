#ifndef I2C_LCD_H
#define I2C_LCD_H

//////////////////////////////////////////////////////////////////
//defines

/// ###### types ######
#define UChar unsigned char

/// ###### I2C LCD macros ######
#define LO_NIBBLE(b) (((b) << 4) & 0xF0)
#define HI_NIBBLE(b) ((b) & 0xF0)

/// ###### I2C LCD defines ######
#define LCD_WAIT_DELAY 2
#define LCD_BL         0x08
#define LCD_EN         0x04
#define LCD_RW         0x02
#define LCD_RS         0x01

/// ###### LCD Command ######
#define LCD_LINE1  0x80
#define LCD_LINE2  0xC0
#define LCD_LINE3  0x94
#define LCD_LINE4  0xD4
#define LCD_DISPLAY_ON_CURSOR_OFF             0x0c
#define LCD_DISPLAY_OFF_CURSOR_OFF_BLINK_OFF  0x08
#define LCD_4BITS_2LINES_5x8FONT              0x28
#define LCD_INCREMENT_NO_SHIFT                0x06
#define LCD_INIT_BYTE          0x30
#define LCD_BUS_WIDTH_4Bit     0x20
#define LCD_BUS_WIDTH_8Bit     0x30
#define LCD_CLEAR              0x01
#define LCD_INIT_BYTEA         0x33
#define LCD_INIT_BYTEB         0x32
#define LCD_INIT_BYTEC         0x28





 /////////////////////////////////////////////////////////////////
 //enum
 
/// ###### I2C LCD enum codes ######
/**
 LCD_HOME               0x02
 LCD_ON                 0x0C
 LCD_OFF                0x08
 LCD_CURSOR_OFF         0x0C
 LCD_UNDERLINE_ON       0x0E
 LCD_BLINK_CURSOR_ON    0x0F
 LCD_MOVE_CURSOR_LEFT   0x10
 LCD_MOVE_CURSOR_RIGHT  0x14
 LCD_SHIFT_LEFT         0x18
 LCD_SHIFT_RIGHT        0x1C
**/

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

 ////////////////////////////////////////////////////////////////
 //function prototypes
 UChar I2C_PCF8574_Write(UChar addr,UChar Data);
 void I2C_LCD_putcmd(UChar addr, UChar dta,UChar cmdtype);
 void I2C_LCD_goto(UChar addr,UChar row, UChar col);
 void I2C_Lcd_Cmd(UChar addr,Cmd_Type cmd,UChar col);
 void I2C_LCD_putch(UChar addr, UChar dta);
 void I2C_LCD_Out(UChar addr, UChar row, UChar col, UChar *s);
 void I2C_Lcd_Chr(UChar addr, UChar row, UChar col, UChar out_char);
 void I2C_LCD_init(UChar addr);
 void I2C_LCD_init4l(UChar addr);






#endif