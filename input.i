# 1 "input.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "input.c"
# 1 "input.h" 1



# 1 "gba.h" 1







typedef unsigned int u32;


typedef unsigned short u16;


typedef unsigned char u8;
# 41 "gba.h"
extern volatile unsigned short *videoBuffer;
# 59 "gba.h"
extern u32 buttons;
extern u32 oldButtons;
# 73 "gba.h"
typedef struct
{
 const volatile void *src;
 const volatile void *dst;
 u32 cnt;
} DMA_CONTROLLER;
# 110 "gba.h"
void dmaCall(unsigned int channel, const volatile void* src, const volatile void* dst, u32 cnt);
# 119 "gba.h"
extern u32 vBlankCounter;




void waitForVBlank(void);
# 138 "gba.h"
int randint(int min, int max);




void setPixel(int row, int col, u16 color);
void drawRectDMA(int row, int col, int width, int height, volatile u16 color);
void drawFullScreenImageDMA(const u16 *image);
void drawImageDMA(int row, int col, int width, int height, const u16 *image);
void fillScreenDMA(volatile u16 color);
void drawChar(int row, int col, char ch, u16 color);
void drawString(int row, int col, char *str, u16 color);
void drawCenteredString(int row, int col, int width, int height, char *str, u16 color);
void getNumString(int num, char *buffer);



extern const unsigned char fontdata_6x8[12288];
# 5 "input.h" 2





typedef enum e_Move {
    NOMOVE,
    LEFT,
    RIGHT,
    DOWN,
    ROTATECW,
    ROTATECCW
} Move;




extern int timers[3];


void getMoves(Move* moveBuffer);
# 2 "input.c" 2

int timers[3] = {0, 0, 0};

void getMoves(Move* moveBuffer) {

    for (int i = 0; i < 3; i++) {
        moveBuffer[i] = NOMOVE;
    }


    if ((~(buttons) & ((1<<1)) && !(~(oldButtons) & ((1<<1))))) {
        moveBuffer[0] = ROTATECW;
    } else if ((~(buttons) & ((1<<0)) && !(~(oldButtons) & ((1<<0))))) {
        moveBuffer[0] = ROTATECCW;
    }


    if ((~(buttons) & ((1<<4)) && !(~(oldButtons) & ((1<<4))))) {
        moveBuffer[1] = RIGHT;
        timers[0] = 0;
    } else if ((~(buttons) & ((1<<5)) && !(~(oldButtons) & ((1<<5))))) {
        moveBuffer[1] = LEFT;
        timers[1] = 0;
    }

    if ((~(buttons) & ((1<<7)) && !(~(oldButtons) & ((1<<7))))) {
        moveBuffer[2] = DOWN;
        timers[2] = 0;
    }


    if ((~(buttons) & ((1<<4)))) {
        if (timers[0] >= 15) {
            moveBuffer[1] = RIGHT;
            timers[0] = 10;
        } else {
            timers[0]++;
        }
    } else if ((~(buttons) & ((1<<5)))) {
        if (timers[1] >= 15) {
            moveBuffer[1] = LEFT;
            timers[1] = 10;
        } else {
            timers[1]++;
        }
    }

    if ((~(buttons) & ((1<<7)))) {
        if (timers[2] >= 15) {
            moveBuffer[2] = DOWN;
            timers[2] = 10;
        } else {
            timers[2]++;
        }
    }
}
