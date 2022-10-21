#include "grid.h"

u16 grid[GRIDSIZE];

const int scoreIncrements[4] = {40, 100, 300, 1200};

int totalLinesCleared = 0;

void initializeGrid(void) {
    for (int i = 0; i < GRIDSIZE; i++) {
        grid[i] = 0;
    }

    totalLinesCleared = 0;
}

void getClearedLines(int* clearedLinesBuffer) {

    int numLinesCleared = 0;
    int topRow = GRIDSIZEY;
    for (int row = 0; row < GRIDSIZEY; row++) {
        //check line
        bool lineCleared = true;
        for (int col = 0; col < GRIDSIZEX; col++) {
            //iterate through each block in line
            if (!grid[OFFSET(row, col, GRIDSIZEX)]) {
                lineCleared = false;
            }
        }

        if (lineCleared) {
            if (numLinesCleared == 0) {
                topRow = row;
            }
            clearedLinesBuffer[numLinesCleared] = row;
            numLinesCleared++;
        }

        if ((numLinesCleared == 4) || (row == topRow+3)) {
            //Optimizations to break out of loop early
            break;
        }
    }

    if (numLinesCleared > 0) {
        score += (level+1) * scoreIncrements[numLinesCleared-1];
        totalLinesCleared += numLinesCleared;
        if (level < MAX_LEVEL && totalLinesCleared / 10 > (totalLinesCleared - numLinesCleared) / 10) {
            level++;    //level up on multiples of 10 lines
            setDropSpeed(level);
        }
    }

    //fill in the rest of the buffer with -1
    while (numLinesCleared < 4) {
        clearedLinesBuffer[numLinesCleared] = -1;
        numLinesCleared++;
    }
}

void clearLines(void) {
    int clearedLines[4];
    getClearedLines(clearedLines);

    for (int i = 0; i < 4; i++) {
        if (clearedLines[i] != -1) {
            int row = clearedLines[i];

            //source and dest need to go backwards from the end of the array or else the copying will not work
            //It is similar to removing from an array list

            //There was a really annoying bug so I was switching between loops and DMA trying to figure it out.
            dmaCall(3,  &grid[OFFSET(row-1, GRIDSIZEX-1, GRIDSIZEX)], 
                        &grid[OFFSET(row, GRIDSIZEX-1, GRIDSIZEX)], 
                        (row*GRIDSIZEX) | DMA_SOURCE_DECREMENT | DMA_DESTINATION_DECREMENT 
            );

            //for (int i = OFFSET(row-1, GRIDSIZEX-1, GRIDSIZEX); i >= 0; i--) {
                //grid[i+GRIDSIZEX] = grid[i];
            //}

        } else {
            break;
        }
    }
}

void redrawGrid(void) {
    for (int row = 0; row < GRIDSIZEY; row++) {
        for (int col = 0; col < GRIDSIZEX; col++) {
            if (grid[OFFSET(row, col, GRIDSIZEX)]) {
                drawBlock(col, row, false);
            } else {
                drawBlock(col, row, true);
            }
        }
    }
}