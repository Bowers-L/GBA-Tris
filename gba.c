#include "gba.h"
#include <string.h>

volatile unsigned short *videoBuffer = (volatile unsigned short *)0x6000000;
u32 vBlankCounter = 0;

void waitForVBlank(void) {
  // TODO: IMPLEMENT

  // (1)
  // Write a while loop that loops until we're NOT in vBlank anymore:
  // (This prevents counting one VBlank more than once if your app is too fast)
  while (SCANLINECOUNTER >= 160);

  // (2)
  // Write a while loop that keeps going until we're in vBlank:
  while (SCANLINECOUNTER < 160);

  // (3)
  // Finally, increment the vBlank counter:
  vBlankCounter++;
}

static int __qran_seed = 42;
static int qran(void) {
  __qran_seed = 1664525 * __qran_seed + 1013904223;
  return (__qran_seed >> 16) & 0x7FFF;
}

int randint(int min, int max) { return (qran() * (max - min) >> 15) + min; }

//Helper method for doing DMA in one call
void dmaCall(unsigned int channel, const volatile void* src, const volatile void* dst, u32 cnt) {
  DMA[channel].cnt = 0; //Turn DMA off

  DMA[channel].src = src;
  DMA[channel].dst = dst;
  DMA[channel].cnt = cnt | DMA_ON;
}

void setPixel(int row, int col, u16 color) {
  videoBuffer[OFFSET(row, col, WIDTH)] = color;
}

void drawRectDMA(int row, int col, int width, int height, volatile u16 color) {
  for (int r = row; r < row + height; r++) {
    dmaCall(3, &color, &videoBuffer[OFFSET(r, col, WIDTH)], width | DMA_SOURCE_FIXED);
  }
}

void drawFullScreenImageDMA(const u16 *image) {
  dmaCall(3, image, videoBuffer, WIDTH*HEIGHT);
}

void drawImageDMA(int row, int col, int width, int height, const u16 *image) {
  for (int r = row; r < row + height; r++) {
    dmaCall(3, &image[OFFSET(r-row, 0, width)], &videoBuffer[OFFSET(r, col, WIDTH)], width);
  }
}

void fillScreenDMA(volatile u16 color) {
  dmaCall(3, &color, videoBuffer, WIDTH*HEIGHT | DMA_SOURCE_FIXED);
}

void drawChar(int row, int col, char ch, u16 color) {
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 8; j++) {
      if (fontdata_6x8[OFFSET(j, i, 6) + ch * 48]) {
        setPixel(row + j, col + i, color);
      }
    }
  }
}

void drawString(int row, int col, char *str, u16 color) {
  while (*str) {
    drawChar(row, col, *str++, color);
    col += 6;
  }
}

void drawCenteredString(int row, int col, int width, int height, char *str,
                        u16 color) {
  u32 len = 0;
  char *strCpy = str;
  while (*strCpy) {
    len++;
    strCpy++;
  }

  u32 strWidth = 6 * len;
  u32 strHeight = 8;

  int new_row = row + ((height - strHeight) >> 1);
  int new_col = col + ((width - strWidth) >> 1);
  drawString(new_row, new_col, str, color);
}

/**
 * @brief Converts num into a string and places it into buffer
 */
void getNumString(int num, char *buffer) {
    if (num == 0) {
        buffer[0] = '0';
        buffer[1] = '\0';
        return;
    }

    //put in the digits backwards because it is easier
    int i = 0;
    while (num != 0) {
        buffer[i] = '0' + (num % 10);
        i++;
        num /= 10;
    }
    buffer[i] = '\0';

    //reverse the string
    int len = strlen(buffer);
    for (int i = 0; i < len / 2; i++) {
        int temp = *(buffer+i);
        *(buffer+i) = *(buffer+len-1-i);
        *(buffer+len-1-i) = temp;
    }
}