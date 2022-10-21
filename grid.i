# 1 "grid.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "grid.c"
# 1 "grid.h" 1



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
# 5 "grid.h" 2
# 1 "piece.h" 1



# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdbool.h" 1 3 4
# 5 "piece.h" 2


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
# 2 "grid.c" 2

u16 grid[((10) * (20))];

const int scoreIncrements[4] = {40, 100, 300, 1200};

void initializeGrid(void) {
    for (int i = 0; i < ((10) * (20)); i++) {
        grid[i] = 0;
    }
}

void getClearedLines(int* clearedLinesBuffer) {

    int numLinesCleared = 0;
    int topRow = 20;
    for (int row = 0; row < 20; row++) {

        
# 19 "grid.c" 3 4
       _Bool 
# 19 "grid.c"
            lineCleared = 
# 19 "grid.c" 3 4
                          1
# 19 "grid.c"
                              ;
        for (int col = 0; col < 10; col++) {

            if (!grid[((col)+(10)*(row))]) {
                lineCleared = 
# 23 "grid.c" 3 4
                             0
# 23 "grid.c"
                                  ;
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

            break;
        }
    }

    if (numLinesCleared > 0) {
        score += (level+1) * scoreIncrements[numLinesCleared-1];
    }


    while (numLinesCleared != 4) {
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
# 67 "grid.c"
            for (int i = ((10 -1)+(10)*(row-1)); i >= 0; i--) {
                grid[i+10] = grid[i];
            }

        } else {
            break;
        }
    }
}

void redrawGrid(void) {
    for (int row = 0; row < 20; row++) {
        for (int col = 0; col < 10; col++) {
            if (grid[((col)+(10)*(row))]) {
                drawBlock(col, row, 
# 81 "grid.c" 3 4
                                   0
# 81 "grid.c"
                                        );
            } else {
                drawBlock(col, row, 
# 83 "grid.c" 3 4
                                   1
# 83 "grid.c"
                                       );
            }
        }
    }
}
