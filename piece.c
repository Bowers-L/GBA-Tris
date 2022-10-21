#include "piece.h"

#include "states.h"
#include "block.h"

//piece data
const Piece pieces[7] = {
    //T
    {
        1, 1, WHITE, {
            {
                0, 0, 0, 0,
                1, 1, 1, 0,
                0, 1, 0, 0,
                0, 0, 0, 0,

                1, 0, 1, 1,
            },
            {
                0, 1, 0, 0,
                1, 1, 0, 0,
                0, 1, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1,
            },
            {
                0, 1, 0, 0,
                1, 1, 1, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                1, 1, 1, 0,
            },
            {
                0, 1, 0, 0,
                0, 1, 1, 0,
                0, 1, 0, 0,
                0, 0, 0, 0,

                0, 1, 1, 1,
            }
        }
    }, 

    //S
    {
        1, 1, BLUE, {
            {
                0, 0, 0, 0,
                0, 1, 1, 0,
                1, 1, 0, 0,
                0, 0, 0, 0,

                1, 0, 1, 1,
            },
            {
                1, 0, 0, 0,
                1, 1, 0, 0,
                0, 1, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1, 
            },
            {
                0, 0, 0, 0,
                0, 1, 1, 0,
                1, 1, 0, 0,
                0, 0, 0, 0,

                1, 0, 1, 1, 
            },
            {
                1, 0, 0, 0,
                1, 1, 0, 0,
                0, 1, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1
            }
        }
    }, 

    //Z
    {
        1, 1, RED, {
            {
                0, 0, 0, 0,
                1, 1, 0, 0,
                0, 1, 1, 0,
                0, 0, 0, 0,

                1, 0, 1, 1, 
            },
            {
                0, 1, 0, 0,
                1, 1, 0, 0,
                1, 0, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1, 
            },
            {
                0, 0, 0, 0,
                1, 1, 0, 0,
                0, 1, 1, 0,
                0, 0, 0, 0,

                1, 0, 1, 1, 
            },
            {
                0, 1, 0, 0,
                1, 1, 0, 0,
                1, 0, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1, 
            }
        }
    },

    //I
    {
        1, 1, WHITE, {
            {
                0, 0, 0, 0,
                1, 1, 1, 1,
                0, 0, 0, 0,
                0, 0, 0, 0, 

                1, 0, 2, 0,
            },
            {
                0, 1, 0, 0,
                0, 1, 0, 0,
                0, 1, 0, 0,
                0, 1, 0, 0, 

                0, 1, 0, 2,
            },
            {
                0, 0, 0, 0,
                1, 1, 1, 1,
                0, 0, 0, 0,
                0, 0, 0, 0, 

                1, 0, 2, 0,
            },
            {
                0, 1, 0, 0,
                0, 1, 0, 0,
                0, 1, 0, 0,
                0, 1, 0, 0, 

                0, 1, 0, 2,
            }
        }
    },

    //J
    {
        1, 1, RED, {
            {
                0, 0, 0, 0,
                1, 1, 1, 0, 
                0, 0, 1, 0,
                0, 0, 0, 0,

                1, 0, 1, 1, 
            },
            {
                0, 1, 0, 0,
                0, 1, 0, 0, 
                1, 1, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1,
            },
            {
                1, 0, 0, 0,
                1, 1, 1, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                1, 1, 1, 0, 
            },
            {
                0, 1, 1, 0,
                0, 1, 0, 0,
                0, 1, 0, 0,
                0, 0, 0, 0,

                0, 1, 1, 1, 
            }
        }
    },

    //L
    {
        1, 1, BLUE, {
            {
                0, 0, 0, 0,
                1, 1, 1, 0, 
                1, 0, 0, 0,
                0, 0, 0, 0,

                1, 0, 1, 1, 
            },
            {
                1, 1, 0, 0,
                0, 1, 0, 0, 
                0, 1, 0, 0,
                0, 0, 0, 0,

                1, 1, 0, 1,
            },
            {
                0, 0, 1, 0,
                1, 1, 1, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                1, 1, 1, 0,
            },
            {
                0, 1, 0, 0,
                0, 1, 0, 0,
                0, 1, 1, 0,
                0, 0, 0, 0,

                0, 1, 1, 1, 
            }
        }
    },

    //O
    {
        0, 0, WHITE, {
            {
                1, 1, 0, 0,
                1, 1, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                0, 0, 1, 1,
            },
            {
                1, 1, 0, 0,
                1, 1, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                0, 0, 1, 1,  
            },
            {
                1, 1, 0, 0,
                1, 1, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                0, 0, 1, 1,
            },
            {
                1, 1, 0, 0,
                1, 1, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,

                0, 0, 1, 1, 
            }
        }
    }
};

const int levelSpeeds[] = {48, 43, 38, 33, 28, 23, 18, 13, 8, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 2};

CurrPiece currPiece;

int dropSpeed;
int hardDropForgiveness = HARD_DROP_FORGIVENESS_WINDOW;
bool firstInput = false;

void setDropSpeed(int level) {
    dropSpeed = levelSpeeds[level];
}

void newPiece(void) {

    //initialize piece values
    currPiece.type = randint(0, NUM_PIECES);
    //currPiece.type = I; //DEBUG ONLY
    currPiece.x = PIECEINITIALX;
    currPiece.y = PIECEINITIALY;
    currPiece.orientation = PIECEINITIALORIENTATION;

    if (grid[GRIDSIZEX/2]) {
        //lose condition
        highScore = score;
        score = 0;
        initPlay(); //restart the game
    }

    setDropSpeed(level);
    hardDropForgiveness = HARD_DROP_FORGIVENESS_WINDOW;
}

void placePiece(PieceType p, int x, int y, int orientation) {
    for (int row = 0; row < PIECE_WH; row++) {
        for (int col = 0; col < PIECE_WH; col++) {
            //Iterate through the first 16 values of the block data
            if (pieces[p].blockData[orientation][row * PIECE_WH + col]) {
                grid[OFFSET(y+row-pieces[p].pivotY, x+col-pieces[p].pivotX, GRIDSIZEX)] = 1;
            }
        }
    }

    currPiece.erase = false;    //Don't erase the piece from the grid

    clearLines();
    waitForVBlank();
    redrawGrid();
}

void updatePiece(void) {
    static int t;

    //updating previous values
    currPiece.prevType = currPiece.type;
    currPiece.prevX = currPiece.x;
    currPiece.prevY = currPiece.y;
    currPiece.prevOrientation = currPiece.orientation;
    currPiece.erase = true;

    //get input
    Move moves[3];
    getMoves(moves);

    //handle input
    for (int i = 0; i < 3; i++) {
        executeUserAction(moves[i]);
    }
    
    if (!KEY_DOWN(BUTTON_DOWN)) {
        setDropSpeed(level);
    }

    //drop piece if time has reached the speed value
    if (t % dropSpeed == 0 && t != 0) {
        if (!checkCollisionWithGrid(0, 1, currPiece.orientation) && !checkCollision(0, 1, currPiece.orientation, C_BOTTOM)) {
            currPiece.y++;
        } else {
            placePiece(currPiece.type, currPiece.x, currPiece.y, currPiece.orientation);
            newPiece();
        }
    }

    t++;

    if (hardDropForgiveness != 0) {
        hardDropForgiveness--;
    }
}

void executeUserAction(Move action) {
    int orientation;

    switch(action) {
        case NOMOVE:
            break;
        case RIGHT:
            if (!checkCollisionWithGrid(1, 0, currPiece.orientation) && !checkCollision(1, 0, currPiece.orientation, C_RIGHT)) {
                currPiece.x++;
            }
            break;
        case LEFT:
            if (!checkCollisionWithGrid(-1, 0, currPiece.orientation) && !checkCollision(-1, 0, currPiece.orientation, C_LEFT)) {
                currPiece.x--;
            }
            break;
        case DOWN:
            if (hardDropForgiveness == 0) {
                dropSpeed = 2; 
            }

            /*
            if (!checkCollisionWithGrid(0, 1, currPiece.orientation)) {
                currPiece.y++;
            }

            if (checkCollision(C_BOTTOM)) {
                currPiece.y--;
                placePiece(&pieces[currPiece.type], currPiece.x, currPiece.y, currPiece.orientation);
                newPiece();
            }
            */
            break;
        case ROTATECCW:
            orientation = currPiece.orientation - 1;

            //wrap around
            if (orientation < 0) {
                orientation = NUM_ORIENTATIONS - 1;
            }

            if (!checkCollision(0, 0, orientation, C_LEFT) && !checkCollision(0, 0, orientation, C_RIGHT)) {
                currPiece.orientation = orientation;
            }


            break;
        case ROTATECW:
            orientation = currPiece.orientation + 1;

            //wrap around
            if (orientation >= NUM_ORIENTATIONS) {
                orientation = 0;
            }

            if (!checkCollision(0, 0, orientation, C_LEFT) && !checkCollision(0, 0, orientation, C_RIGHT)) {
                currPiece.orientation = orientation;
            }

 
            break;
    }
}

void drawBlock(int x, int y, bool erase) {
    if(erase) {
        drawRectDMA(GRIDYTOSCREENY(y), GRIDXTOSCREENX(x), BLOCK_WH, BLOCK_WH, BLACK);
    } else {
        drawImageDMA(GRIDYTOSCREENY(y), GRIDXTOSCREENX(x), BLOCK_WH, BLOCK_WH, block);
    }
}

void drawPiece(PieceType p, int x, int y, int orientation, bool erase) {
    for (int row = 0; row < PIECE_WH; row++) {
        for (int col = 0; col < PIECE_WH; col++) {
            //Iterate through the first 16 values of the block data
            if (pieces[p].blockData[orientation][row * PIECE_WH + col]) {
                //block data is a 1, so draw the block
                drawBlock(  x + col - pieces[p].pivotX, 
                            y + row - pieces[p].pivotY,
                            erase
                );
            }
        }
    }
}

void drawCurrPiece(void) {
    //erase previous piece
    if (currPiece.erase) {
        drawPiece(currPiece.prevType, currPiece.prevX, currPiece.prevY, currPiece.prevOrientation, true);
    }

    //draw current piece
    drawPiece(currPiece.type, currPiece.x, currPiece.y, currPiece.orientation, false);
}

bool checkCollision(int dx, int dy, int futureOrientation, Direction dir) {
    int futureX = currPiece.x + dx;
    int futureY = currPiece.y + dy;
    switch (dir) {
        case C_LEFT:;
            u8 collisionDataLeft = pieces[currPiece.type].blockData[futureOrientation][PIECE_WH * PIECE_WH + C_LEFT];
            if (futureX - collisionDataLeft < 0) {
                return true;
            }
            break;
        case C_RIGHT:;
            u8 collisionDataRight = pieces[currPiece.type].blockData[futureOrientation][PIECE_WH * PIECE_WH + C_RIGHT];
            if (futureX + collisionDataRight > GRIDSIZEX-1) {
                return true;
            }
            break;
        case C_BOTTOM:;
            u8 collisionDataBottom = pieces[currPiece.type].blockData[futureOrientation][PIECE_WH * PIECE_WH + C_BOTTOM];
            if (futureY + collisionDataBottom > GRIDSIZEY-1) {
                return true;
            }
            break;

        case C_TOP:;
            break;
    }

    return false;
}

bool checkCollisionWithGrid(int dx, int dy, int futureOrientation) {
    Piece p = pieces[currPiece.type];
    int futureX = currPiece.x + dx;
    int futureY = currPiece.y + dy;
    for (int row = 0; row < PIECE_WH; row++) {
        for (int col = 0; col < PIECE_WH; col++) {
            if (p.blockData[futureOrientation][OFFSET(row, col, PIECE_WH)]) {
                bool futureSpotTaken = grid[OFFSET(futureY+row-p.pivotY, futureX+col-p.pivotX, GRIDSIZEX)];
                if (futureSpotTaken) {
                    return true;
                }
            }
        }
    }

    return false;
}
