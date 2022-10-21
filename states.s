	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"states.c"
	.text
	.align	2
	.global	initStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStart, %function
initStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L4
	ldr	r3, .L4+4
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	waitForVBlank
	.word	title
	.word	drawFullScreenImageDMA
	.size	initStart, .-initStart
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Choose Level:\000"
	.align	2
.LC1:
	.ascii	"0\000"
	.align	2
.LC2:
	.ascii	"High Score:\000"
	.text
	.align	2
	.global	initSelect
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSelect, %function
initSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, #1
	mov	r4, #0
	ldr	r3, .L8
	sub	sp, sp, #16
	ldr	ip, .L8+4
	add	r1, sp, #8
	ldr	r0, [r3, #4]
	ldr	r2, .L8+8
	strb	lr, [ip]
	str	r4, [r3]
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L8+20
	ldr	r1, .L8+24
	mov	r3, r4
	mov	r2, r4
	stm	sp, {r1, r5}
	ldr	r6, .L8+28
	mov	r1, #120
	mov	r0, #72
	mov	lr, pc
	bx	r6
	ldr	r1, .L8+32
	mov	r3, r4
	mov	r2, r4
	str	r1, [sp]
	mov	r0, #88
	mov	r1, #120
	str	r5, [sp, #4]
	mov	lr, pc
	bx	r6
	ldr	r4, .L8+36
	mov	r3, r5
	mov	r1, #56
	mov	r0, #128
	ldr	r2, .L8+40
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #136
	mov	r0, #128
	add	r2, sp, #8
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.word	state
	.word	getNumString
	.word	waitForVBlank
	.word	fillScreenDMA
	.word	32767
	.word	.LC0
	.word	drawCenteredString
	.word	.LC1
	.word	drawString
	.word	.LC2
	.size	initSelect, .-initSelect
	.align	2
	.global	initPlay
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlay, %function
initPlay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #2
	mov	r5, #0
	ldr	r4, .L12
	ldr	r2, .L12+4
	sub	sp, sp, #16
	ldr	r0, [r4]
	ldr	r3, .L12+8
	strb	r1, [r2]
	str	r5, [r4, #8]
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	add	r6, sp, #12
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	mov	r1, r6
	ldr	r0, [r4]
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L12+28
	ldr	r3, .L12+32
	mov	lr, pc
	bx	r3
	ldr	r1, .L12+36
	mov	r3, r5
	str	r1, [sp, #4]
	mov	r2, r5
	mov	r1, #196
	mov	r0, #116
	str	r6, [sp]
	ldr	r4, .L12+40
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	state
	.word	setDropSpeed
	.word	initializeGrid
	.word	newPiece
	.word	getNumString
	.word	waitForVBlank
	.word	gameImage
	.word	drawFullScreenImageDMA
	.word	32767
	.word	drawCenteredString
	.size	initPlay, .-initPlay
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	ldr	r3, .L19+4
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	initSelect
.L20:
	.align	2
.L19:
	.word	buttons
	.word	oldButtons
	.size	start, .-start
	.align	2
	.global	select
	.syntax unified
	.arm
	.fpu softvfp
	.type	select, %function
select:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L38
	ldr	r0, [r5]
	ldr	r4, .L38+4
	cmp	r0, #18
	ldr	r3, [r4]
	sub	sp, sp, #20
	bgt	.L22
	tst	r3, #16
	bne	.L23
	ldr	r6, .L38+8
	ldr	r2, [r6]
	tst	r2, #16
	beq	.L23
.L24:
	add	r7, sp, #8
	mov	r1, r7
	ldr	r9, .L38+12
	mov	lr, pc
	bx	r9
	ldr	r3, [r4]
	tst	r3, #16
	mvnne	r0, #0
	bne	.L26
	ldr	r3, [r6]
	tst	r3, #16
	mvneq	r0, #0
	movne	r0, #1
.L26:
	mov	r6, #0
	ldr	r3, [r5]
	add	r8, sp, #12
	add	r0, r0, r3
	mov	r1, r8
	str	r0, [r5]
	mov	lr, pc
	bx	r9
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L38+20
	mov	r3, r6
	mov	r2, r6
	mov	r1, #120
	mov	r0, #88
	str	r7, [sp]
	str	r6, [sp, #4]
	mov	lr, pc
	bx	r5
	ldr	r1, .L38+24
	mov	r3, r6
	str	r1, [sp, #4]
	mov	r2, r6
	mov	r1, #120
	mov	r0, #88
	str	r8, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
.L25:
	tst	r3, #8
	bne	.L27
	ldr	r3, .L38+8
	ldr	r3, [r3]
	tst	r3, #8
	bne	.L37
.L27:
	ldr	r2, .L38+28
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L23:
	cmp	r0, #0
	ble	.L25
.L22:
	tst	r3, #32
	bne	.L25
	ldr	r6, .L38+8
	ldr	r2, [r6]
	tst	r2, #32
	beq	.L25
	b	.L24
.L37:
	bl	initPlay
	b	.L27
.L39:
	.align	2
.L38:
	.word	.LANCHOR0
	.word	buttons
	.word	oldButtons
	.word	getNumString
	.word	waitForVBlank
	.word	drawCenteredString
	.word	32767
	.word	seed
	.size	select, .-select
	.align	2
	.global	play
	.syntax unified
	.arm
	.fpu softvfp
	.type	play, %function
play:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	sub	sp, sp, #16
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+4
	add	r5, sp, #12
	mov	r1, r5
	ldr	r0, [r3, #8]
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L42+20
	str	r4, [sp]
	mov	r3, #16
	mov	r2, #42
	mov	r1, #172
	mov	r0, #40
	mov	lr, pc
	bx	r6
	ldr	r1, .L42+24
	mov	r3, r4
	mov	r2, r4
	str	r1, [sp, #4]
	mov	r0, #44
	mov	r1, #196
	str	r5, [sp]
	ldr	r4, .L42+28
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	updatePiece
	.word	.LANCHOR0
	.word	getNumString
	.word	waitForVBlank
	.word	drawCurrPiece
	.word	drawRectDMA
	.word	32767
	.word	drawCenteredString
	.size	play, .-play
	.global	highScore
	.global	score
	.global	level
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	level, %object
	.size	level, 4
level:
	.space	4
	.type	highScore, %object
	.size	highScore, 4
highScore:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
