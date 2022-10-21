# 1 "states.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "states.c"
# 1 "states.h" 1



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
# 5 "states.h" 2



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
# 2 "states.c" 2

# 1 "game.h" 1
# 34 "game.h"
typedef enum {
  START,
  SELECT,
  PLAY,
} GBAState;

extern GBAState state;

extern int seed;
# 4 "states.c" 2
# 1 "title.h" 1
# 16 "title.h"
extern const unsigned short title[43200];
# 5 "states.c" 2
# 1 "gameImage.h" 1
# 16 "gameImage.h"
extern const unsigned short gameImage[38400];
# 6 "states.c" 2

# 1 "piece.h" 1



# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdbool.h" 1 3 4
# 5 "piece.h" 2



# 1 "grid.h" 1




# 1 "piece.h" 1
# 6 "grid.h" 2
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
# 8 "states.c" 2

# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_newlib_version.h" 1 3
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 2 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\features.h" 1 3
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 1 3
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 143 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4

# 143 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 321 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wchar_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 1 3
# 24 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3
# 41 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 1 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 1 3 4
# 9 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 1 3 4
# 35 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 1 3 4
# 20 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 2 3 4
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef unsigned int __size_t;
# 145 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef signed int _ssize_t;
# 156 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 350 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3






typedef unsigned long __ULong;
# 38 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 1 3
# 47 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 48 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 2 3
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 2 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 18 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 2 3
# 27 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 3


void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *restrict, const void *restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);
# 86 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 3
char *_strdup_r (struct _reent *, const char *);



char *_strndup_r (struct _reent *, const char *, size_t);
# 112 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 3
char * _strerror_r (struct _reent *, int, int, int *);
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 3
char *strsignal (int __signo);
# 175 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\string.h" 1 3
# 176 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\string.h" 2 3


# 10 "states.c" 2


# 11 "states.c"
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

    fillScreenDMA(0);
    drawCenteredString(160/2 - 8, 240/2, 0, 0, "Choose Level:", ((31) | (31)<<5 | (31)<<10));
    drawCenteredString(160/2 + 8, 240/2, 0, 0, "0", ((31) | (31)<<5 | (31)<<10));

    drawString(160/2+48, 240/2 - 64, "High Score:", ((31) | (31)<<5 | (31)<<10));
    drawString(160/2+48, 240/2 + 16, highScoreStr, ((31) | (31)<<5 | (31)<<10));
}

void initPlay(void) {
    state = PLAY;
    score = 0;
    setDropSpeed(level);
    initializeGrid();
    newPiece();

    char levelStr[3];
    getNumString(level, levelStr);

    waitForVBlank();
    drawFullScreenImageDMA(gameImage);
    drawCenteredString(160/2 + 36, 240 - 44, 0, 0, levelStr, ((31) | (31)<<5 | (31)<<10));
}

void start(void) {
    if ((~(buttons) & ((1<<3)) && !(~(oldButtons) & ((1<<3))))) {
        initSelect();
    }
}

void select(void) {
    if ((level < 19 && (~(buttons) & ((1<<4)) && !(~(oldButtons) & ((1<<4))))) || (level > 0 && (~(buttons) & ((1<<5)) && !(~(oldButtons) & ((1<<5)))))) {
        char prevLevelStr[3];
        char levelStr[3];

        getNumString(level, prevLevelStr);
        level += (~(buttons) & ((1<<4)) && !(~(oldButtons) & ((1<<4)))) ? 1 : -1;
        getNumString(level, levelStr);

        waitForVBlank();
        drawCenteredString(160/2 + 8, 240/2, 0, 0, prevLevelStr, 0);
        drawCenteredString(160/2 + 8, 240/2, 0, 0, levelStr, ((31) | (31)<<5 | (31)<<10));
    }

    if ((~(buttons) & ((1<<3)) && !(~(oldButtons) & ((1<<3))))) {
        initPlay();
    }

    seed++;
}

void play(void) {
    char scoreStr[3];

    updatePiece();
    getNumString(score, scoreStr);

    waitForVBlank();
    drawCurrPiece();
    drawRectDMA(160/2 - 40, 240 - 68, 6*7, 16, 0);
    drawCenteredString(160/2 - 36, 240 - 44, 0, 0, scoreStr, ((31) | (31)<<5 | (31)<<10));
}
