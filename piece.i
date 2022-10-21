# 1 "piece.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "piece.c"
# 1 "piece.h" 1



# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdbool.h" 1 3 4
# 5 "piece.h" 2

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
# 7 "piece.h" 2
# 1 "game.h" 1
# 34 "game.h"
typedef enum {
  START,
  SELECT,
  PLAY,
} GBAState;

extern GBAState state;

extern int seed;
# 8 "piece.h" 2
# 1 "grid.h" 1




# 1 "piece.h" 1
# 6 "grid.h" 2
# 1 "states.h" 1







extern int level;
extern int score;
extern int highScore;

void initStart(void);
void initPlay(void);
void initWin(void);

void start(void);
void select(void);
void play(void);

void getNumString(int num, char *buffer);
# 7 "grid.h" 2
# 23 "grid.h"
typedef struct s_ClearedLinesData {
    int startRow;
    int numLines;
} ClearedLinesData;



extern u16 grid[((10) * (20))];

extern const int scoreIncrements[4];




void initializeGrid(void);



void getClearedLines(int *clearedLinesBuffer);


void clearLines(void);


void redrawGrid(void);
# 9 "piece.h" 2
# 1 "input.h" 1
# 10 "input.h"
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
# 10 "piece.h" 2
# 29 "piece.h"
typedef enum e_Piece {
    T, Z, S, I, J, L, O
} PieceType;

typedef enum e_Collision {
    C_LEFT, C_TOP, C_RIGHT, C_BOTTOM
} Direction;

typedef struct s_Piece {






    int pivotX;
    int pivotY;

    u16 color;






    u8 blockData[4][4 * 4 + 4];
} Piece;

typedef struct s_CurrPiece {
    PieceType type;
    int x;
    int y;
    int orientation;

    PieceType prevType;
    int prevX;
    int prevY;
    int prevOrientation;

    
# 68 "piece.h" 3 4
   _Bool 
# 68 "piece.h"
        erase;
} CurrPiece;



extern const Piece pieces[7];

extern const int levelSpeeds[];


extern CurrPiece currPiece;

extern int dropSpeed;
extern int hardDropForgiveness;






void newPiece(void);
void placePiece(PieceType p, int x, int y, int orientation);
void setDropSpeed(int level);


void updatePiece(void);
void executeUserAction(Move action);


void drawBlock(int x, int y, 
# 97 "piece.h" 3 4
                            _Bool 
# 97 "piece.h"
                                 erase);

void drawPiece(PieceType p, int x, int y, int orientation, 
# 99 "piece.h" 3 4
                                                          _Bool 
# 99 "piece.h"
                                                               erase);


void drawCurrPiece(void);


# 104 "piece.h" 3 4
_Bool 
# 104 "piece.h"
    checkCollision(Direction dir);

# 105 "piece.h" 3 4
_Bool 
# 105 "piece.h"
    checkCollisionWithGrid(int dx, int dy, int futureOrientation);
# 2 "piece.c" 2


# 1 "block.h" 1
# 16 "block.h"
extern const unsigned short block[64];
# 5 "piece.c" 2


const Piece pieces[7] = {

    {
        1, 1, ((31) | (31)<<5 | (31)<<10), {
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


    {
        1, 1, ((0) | (0)<<5 | (31)<<10), {
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


    {
        1, 1, ((31) | (0)<<5 | (0)<<10), {
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


    {
        1, 1, ((31) | (31)<<5 | (31)<<10), {
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


    {
        1, 1, ((31) | (0)<<5 | (0)<<10), {
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


    {
        1, 1, ((0) | (0)<<5 | (31)<<10), {
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


    {
        0, 0, ((31) | (31)<<5 | (31)<<10), {
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
int hardDropForgiveness = 18;

# 281 "piece.c" 3 4
_Bool 
# 281 "piece.c"
    firstInput = 
# 281 "piece.c" 3 4
                 0
# 281 "piece.c"
                      ;

void setDropSpeed(int level) {
    dropSpeed = levelSpeeds[level];
}

void newPiece(void) {



    currPiece.type = I;
    currPiece.x = 5;
    currPiece.y = 0;
    currPiece.orientation = 0;

    if (grid[10/2]) {

        highScore = score;
        score = 0;
        initPlay();
    }

    setDropSpeed(level);
    hardDropForgiveness = 18;
}

void placePiece(PieceType p, int x, int y, int orientation) {
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 4; col++) {

            if (pieces[p].blockData[orientation][row * 4 + col]) {
                grid[((x+col-pieces[p].pivotX)+(10)*(y+row-pieces[p].pivotY))] = 1;
            }
        }
    }

    currPiece.erase = 
# 317 "piece.c" 3 4
                     0
# 317 "piece.c"
                          ;

    clearLines();
    waitForVBlank();
    redrawGrid();
}

void updatePiece(void) {
    static int t;


    currPiece.prevType = currPiece.type;
    currPiece.prevX = currPiece.x;
    currPiece.prevY = currPiece.y;
    currPiece.prevOrientation = currPiece.orientation;
    currPiece.erase = 
# 332 "piece.c" 3 4
                     1
# 332 "piece.c"
                         ;


    Move moves[3];
    getMoves(moves);


    for (int i = 0; i < 3; i++) {
        executeUserAction(moves[i]);
    }

    if (!(~(buttons) & ((1<<7)))) {
        setDropSpeed(level);
    }


    if (t % dropSpeed == 0 && t != 0) {
        if (!checkCollisionWithGrid(0, 1, currPiece.orientation) && !checkCollision(C_BOTTOM)) {
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
    switch(action) {
        case NOMOVE:
            break;
        case RIGHT:
            if (!checkCollisionWithGrid(1, 0, currPiece.orientation) && !checkCollision(C_RIGHT)) {
                currPiece.x++;
            }
            break;
        case LEFT:
            if (!checkCollisionWithGrid(-1, 0, currPiece.orientation) && !checkCollision(C_LEFT)) {
                currPiece.x--;
            }
            break;
        case DOWN:
            if (hardDropForgiveness == 0) {
                dropSpeed = 2;
            }
# 394 "piece.c"
            break;
        case ROTATECCW:
            currPiece.orientation--;


            if (currPiece.orientation < 0) {
                currPiece.orientation = 4 - 1;
            }

            if (checkCollision(C_LEFT) || checkCollision(C_RIGHT)) {
                currPiece.orientation++;

                if (currPiece.orientation >= 4) {
                    currPiece.orientation = 0;
                }
            }


            break;
        case ROTATECW:
            currPiece.orientation++;


            if (currPiece.orientation >= 4) {
                currPiece.orientation = 0;
            }

            if (checkCollision(C_LEFT) || checkCollision(C_RIGHT)) {
                currPiece.orientation--;

                if (currPiece.orientation < 0) {
                    currPiece.orientation = 4 - 1;
                }
            }


            break;
    }
}

void drawBlock(int x, int y, 
# 434 "piece.c" 3 4
                            _Bool 
# 434 "piece.c"
                                 erase) {
    if(erase) {
        drawRectDMA((0 + (y) * 8), ((((240) - 10 * (8)) / 2) + (x) * 8), 8, 8, 0);
    } else {
        drawImageDMA((0 + (y) * 8), ((((240) - 10 * (8)) / 2) + (x) * 8), 8, 8, block);
    }
}

void drawPiece(PieceType p, int x, int y, int orientation, 
# 442 "piece.c" 3 4
                                                          _Bool 
# 442 "piece.c"
                                                               erase) {
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 4; col++) {

            if (pieces[p].blockData[orientation][row * 4 + col]) {

                drawBlock( x + col - pieces[p].pivotX,
                            y + row - pieces[p].pivotY,
                            erase
                );
            }
        }
    }
}

void drawCurrPiece(void) {

    if (currPiece.erase) {
        drawPiece(currPiece.prevType, currPiece.prevX, currPiece.prevY, currPiece.prevOrientation, 
# 460 "piece.c" 3 4
                                                                                                  1
# 460 "piece.c"
                                                                                                      );
    }


    drawPiece(currPiece.type, currPiece.x, currPiece.y, currPiece.orientation, 
# 464 "piece.c" 3 4
                                                                              0
# 464 "piece.c"
                                                                                   );
}


# 467 "piece.c" 3 4
_Bool 
# 467 "piece.c"
    checkCollision(Direction dir) {
    switch (dir) {
        case C_LEFT:;
            u8 collisionDataLeft = pieces[currPiece.type].blockData[currPiece.orientation][4 * 4 + C_LEFT];
            if (currPiece.x - collisionDataLeft <= 0) {
                return 
# 472 "piece.c" 3 4
                      1
# 472 "piece.c"
                          ;
            }
            break;
        case C_RIGHT:;
            u8 collisionDataRight = pieces[currPiece.type].blockData[currPiece.orientation][4 * 4 + C_RIGHT];
            if (currPiece.x + collisionDataRight >= 10 -1) {
                return 
# 478 "piece.c" 3 4
                      1
# 478 "piece.c"
                          ;
            }
            break;
        case C_BOTTOM:;
            u8 collisionDataBottom = pieces[currPiece.type].blockData[currPiece.orientation][4 * 4 + C_BOTTOM];
            if (currPiece.y + collisionDataBottom >= 20 -1) {
                return 
# 484 "piece.c" 3 4
                      1
# 484 "piece.c"
                          ;
            }
            break;

        case C_TOP:;
            break;
    }

    return 
# 492 "piece.c" 3 4
          0
# 492 "piece.c"
               ;
}


# 495 "piece.c" 3 4
_Bool 
# 495 "piece.c"
    checkCollisionWithGrid(int dx, int dy, int futureOrientation) {
    Piece p = pieces[currPiece.type];
    int futureX = currPiece.x + dx;
    int futureY = currPiece.y + dy;
    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 4; col++) {
            if (p.blockData[futureOrientation][((col)+(4)*(row))]) {
                
# 502 "piece.c" 3 4
               _Bool 
# 502 "piece.c"
                    futureSpotTaken = grid[((futureX+col-p.pivotX)+(10)*(futureY+row-p.pivotY))];
                if (futureSpotTaken) {
                    return 
# 504 "piece.c" 3 4
                          1
# 504 "piece.c"
                              ;
                }
            }
        }
    }

    return 
# 510 "piece.c" 3 4
          0
# 510 "piece.c"
               ;
}
