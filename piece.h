#ifndef PIECE_H
#define PIECE_H

#include <stdbool.h>

#include "gba.h"
#include "game.h"
#include "grid.h"
#include "input.h"

//********Macros*********//

#define BLOCK_WH 8  //A block's width and height on the screen
#define PIECE_WH 4  //Piece width and height (in blocks)
#define NUM_PIECES 7    //The number of possible pieces
#define NUM_ORIENTATIONS 4  //The number of possible orientations

//intial positions
#define PIECEINITIALX 5
#define PIECEINITIALY 0
#define PIECEINITIALORIENTATION 0

#define PIECE_BORDER_COLOR GRAY

#define HARD_DROP_FORGIVENESS_WINDOW 18 //Number of frames when a piece first spawns that 
                                        //a hard drop cannot be performed

//********Typedefs*********//
typedef enum e_Piece {
    T, Z, S, I, J, L, O
} PieceType;

typedef enum e_Collision {
    C_LEFT, C_TOP, C_RIGHT, C_BOTTOM
} Direction;

typedef struct s_Piece {

    /*
    * Pivot is essentially the point of rotation, 
    * i.e. the block that stays in the same position in every orientation.
    * It is useful for drawing pieces in consistent spots
    */
    int pivotX;
    int pivotY;

    u16 color;

    /*
    *4 orientations * 4x4 grid of blocks for each piece
    *There are also 4 extra u8s per orientation used for collision with walls,
    *These values indicate the distance from the pivot to the left, top, right, and bottom edges.
    */ 
    u8 blockData[NUM_ORIENTATIONS][PIECE_WH * PIECE_WH + 4];  
} Piece;

typedef struct s_CurrPiece {
    PieceType type;
    int x;              //x in grid coordinates
    int y;              //y in grid coordinates
    int orientation;    //A value between 0 and 3 indicating the orientation of the block

    PieceType prevType;
    int prevX;
    int prevY;
    int prevOrientation;

    bool erase;         //Flag for whether to erase the piece's previous position
} CurrPiece;

//********Global Declarations*********//

extern const Piece pieces[7];

extern const int levelSpeeds[];

//Current piece attributes
extern CurrPiece currPiece;    //The piece type of the piece that is controlled by the player

extern int dropSpeed;      //speed at which the pieces drop
extern int hardDropForgiveness;



//********Function Prototypes*********//


void newPiece(void);
void placePiece(PieceType p, int x, int y, int orientation);
void setDropSpeed(int level);

//Updates piece attributes based on time and user input
void updatePiece(void);
void executeUserAction(Move action);

//Draws block at position x, y (screen coordinates)
void drawBlock(int x, int y, bool erase);
//Draws piece at position x, y (grid coordinates) with given orientation
void drawPiece(PieceType p, int x, int y, int orientation, bool erase);

//Erases the previous position of the piece (if necessary), and draws the piece's next position
void drawCurrPiece(void);

bool checkCollision(int dx, int dy, int futureOrientation, Direction dir);
bool checkCollisionWithGrid(int dx, int dy, int futureOrientation);

#endif