#include "game.h"

#include <stdio.h>
#include <stdlib.h>

#include "gba.h"
#include "states.h"

GBAState state;

u32 oldButtons;
u32 buttons;

int main(void) {
  /* TODO: */
  // Manipulate REG_DISPCNT here to set Mode 3. //
  REG_DISPCNT = MODE3 | BG2_ENABLE;

  // Save current and previous state of button input.


  // Load initial game state
  initStart();

  while (1) {
    oldButtons = buttons;  // Store the current state of the buttons
    buttons = BUTTONS;  // Load the current state of the buttons

    if (KEY_JUST_PRESSED(BUTTON_SELECT)) {
      //reset the game completely
      initStart();
    }

    /* TODO: */
    // Manipulate the state machine below as needed //
    // NOTE: Call waitForVBlank() before you draw

    switch (state) {
      case START:
        start();
        break;
      case SELECT:
        select();
        break;
      case PLAY:
        play();
        break;
    }

  }
  return 0;
}
