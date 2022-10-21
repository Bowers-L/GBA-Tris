#ifndef GRID_H
#define GRID_H

#include "gba.h"
#include "piece.h"
#include "states.h"

//********Macros*********//

//grid dimensions
#define GRIDOFFSETX (((WIDTH) - 10 * (BLOCK_WH)) / 2)
#define GRIDOFFSETY 0
#define GRIDSIZEX 10
#define GRIDSIZEY 20
#define GRIDSIZE ((GRIDSIZEX) * (GRIDSIZEY))

//Conversions from grid coordinates into the coordinates on the screen
#define GRIDXTOSCREENX(x) (GRIDOFFSETX + (x) * BLOCK_WH)
#define GRIDYTOSCREENY(y) (GRIDOFFSETY + (y) * BLOCK_WH)

//********Typedefs*********//

typedef struct s_ClearedLinesData {
    int startRow;
    int numLines;
} ClearedLinesData;

//********Global Declarations*********//

extern u16 grid[GRIDSIZE];   //Grid of filled in blocks excluding the current piece

extern const int scoreIncrements[4];

extern int totalLinesCleared;

//********Function Prototypes*********//

//Initialize all grid values to zero
void initializeGrid(void);

//Populates the buffer with the lines that were cleared
//The buffer must be at least 4 ints
void getClearedLines(int *clearedLinesBuffer); 

//Clear all lines that are filled
void clearLines(void);

//Redraws the grid
void redrawGrid(void);


#endif