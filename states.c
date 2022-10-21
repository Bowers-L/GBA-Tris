#include "states.h"

#include "game.h"
#include "title.h"
#include "gameImage.h"

#include "piece.h"
#include "grid.h"

#include <string.h>

int level = 0;
int score = 0;
int highScore = 0;

void initStart(void) {
    state = START;
    
    waitForVBlank();
    drawFullScreenImageDMA(title);
}

void initSelect(void) {
    state = SELECT;
    level = 0;

    char highScoreStr[7];
    getNumString(highScore, highScoreStr);

    waitForVBlank();
    //drawFullScreenImageDMA(selectImage);
    fillScreenDMA(BLACK);
    drawCenteredString(HEIGHT/2 - 8, WIDTH/2, 0, 0, "Choose Level:", WHITE);
    drawCenteredString(HEIGHT/2 + 8, WIDTH/2, 0, 0, "0", WHITE);

    drawString(HEIGHT/2+48, WIDTH/2 - 64, "High Score:", WHITE);
    drawString(HEIGHT/2+48, WIDTH/2 + 16, highScoreStr, WHITE);
}

void initPlay(void) {
    state = PLAY;
    score = 0;
    setDropSpeed(level);
    initializeGrid();
    newPiece();

    waitForVBlank();
    drawFullScreenImageDMA(gameImage);
}

void start(void) {
    if (KEY_JUST_PRESSED(BUTTON_START)) {
        initSelect();
    }
}

void select(void) {
    if ((level < MAX_LEVEL && KEY_JUST_PRESSED(BUTTON_RIGHT)) || (level > 0 && KEY_JUST_PRESSED(BUTTON_LEFT))) {
        char prevLevelStr[3];
        char levelStr[3];

        getNumString(level, prevLevelStr);
        level += KEY_JUST_PRESSED(BUTTON_RIGHT) ? 1 : -1;
        getNumString(level, levelStr);

        waitForVBlank();
        drawCenteredString(HEIGHT/2 + 8, WIDTH/2, 0, 0, prevLevelStr, BLACK);
        drawCenteredString(HEIGHT/2 + 8, WIDTH/2, 0, 0, levelStr, WHITE);
    }

    if (KEY_JUST_PRESSED(BUTTON_START)) {
        initPlay();
    }
}

void play(void) {
    static char scoreStr[3];
    static char levelStr[3];


    updatePiece();
    getNumString(score, scoreStr);
    getNumString(level, levelStr);

    waitForVBlank();
    drawCurrPiece();
    drawRectDMA(HEIGHT/2 - 40, WIDTH - 68, 6*7, 16, BLACK);
    drawRectDMA(HEIGHT/2 + 32, WIDTH - 52, 6*3, 16, BLACK);
    drawCenteredString(HEIGHT/2 - 36, WIDTH - 44, 0, 0, scoreStr, WHITE);
    drawCenteredString(HEIGHT/2 + 36, WIDTH - 44, 0, 0, levelStr, WHITE);
}