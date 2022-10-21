#ifndef STATES_H
#define STATES_H

#include "gba.h"

#define MAX_LEVEL 19

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

#endif