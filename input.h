#ifndef INPUT_H
#define INPUT_H

#include "gba.h"

/* The purpose of this file is to implement auto shifting with inputs, 
 * similar to how most Tetris games operate.
 */

typedef enum e_Move {
    NOMOVE,
    LEFT,
    RIGHT,
    DOWN,
    ROTATECW,
    ROTATECCW
} Move;

#define DELAY_AUTO 15
#define SCROLL_RESET_POINT 10

extern int timers[3];  //Right, Left, Down

//
void getMoves(Move* moveBuffer);

#endif