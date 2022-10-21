#include "input.h"

int timers[3] = {0, 0, 0};

void getMoves(Move* moveBuffer) {

    for (int i = 0; i < 3; i++) {
        moveBuffer[i] = NOMOVE;
    }

    //want rotation to be performed before movement for sake of usability.
    if (KEY_JUST_PRESSED(BUTTON_B)) {
        moveBuffer[0] = ROTATECW;
    } else if (KEY_JUST_PRESSED(BUTTON_A)) {
        moveBuffer[0] = ROTATECCW;
    }
    
    //Right overrides left in this implementation
    if (KEY_JUST_PRESSED(BUTTON_RIGHT)) {
        moveBuffer[1] = RIGHT;
        timers[0] = 0;
    } else if (KEY_JUST_PRESSED(BUTTON_LEFT)) {
        moveBuffer[1] = LEFT;
        timers[1] = 0;
    }

    if (KEY_JUST_PRESSED(BUTTON_DOWN)) {
        moveBuffer[2] = DOWN;
        timers[2] = 0;
    }
 
    //handle auto shift if button is held
    if (KEY_DOWN(BUTTON_RIGHT)) {
        if (timers[0] >= DELAY_AUTO) {
            moveBuffer[1] = RIGHT;
            timers[0] = SCROLL_RESET_POINT;
        } else {
            timers[0]++;
        }
    } else if (KEY_DOWN(BUTTON_LEFT)) {
        if (timers[1] >= DELAY_AUTO) {
            moveBuffer[1] = LEFT;
            timers[1] = SCROLL_RESET_POINT;
        } else {
            timers[1]++;
        }
    }
    
    if (KEY_DOWN(BUTTON_DOWN)) {
        if (timers[2] >= DELAY_AUTO) {
            moveBuffer[2] = DOWN;
            timers[2] = SCROLL_RESET_POINT;
        } else {
            timers[2]++;
        }
    }
}