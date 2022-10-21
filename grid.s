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
	.file	"grid.c"
	.text
	.align	2
	.global	initializeGrid
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGrid, %function
initializeGrid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r3, .L6
	add	r2, r3, #400
.L2:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	grid-2
	.size	initializeGrid, .-initializeGrid
	.align	2
	.global	getClearedLines
	.syntax unified
	.arm
	.fpu softvfp
	.type	getClearedLines, %function
getClearedLines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	mov	r6, #20
	mov	r4, r5
	mov	lr, r5
	ldr	ip, .L29
.L9:
	mov	r2, #1
	sub	r3, ip, #20
.L11:
	ldrh	r1, [r3], #2
	cmp	r1, #0
	moveq	r2, #0
	cmp	r3, ip
	bne	.L11
	cmp	r2, #0
	beq	.L12
	cmp	lr, #0
	moveq	r6, r4
	str	r4, [r0, lr, lsl #2]
	add	lr, lr, #1
.L12:
	cmp	lr, #4
	beq	.L14
	add	r3, r6, #3
	cmp	r3, r4
	beq	.L15
	add	r5, r5, #10
	cmp	r5, #200
	add	r4, r4, #1
	add	ip, ip, #20
	bne	.L9
.L15:
	cmp	lr, #0
	bne	.L16
.L18:
	mvn	r2, #0
	add	lr, r0, lr, lsl #2
	add	r3, r0, #16
.L17:
	str	r2, [lr], #4
	cmp	lr, r3
	bne	.L17
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	ldr	r3, .L29+4
	ldr	r2, .L29+8
	ldr	ip, .L29+12
	ldr	r3, [r3]
	sub	r4, lr, #1
	ldr	r1, [r2]
	ldr	ip, [ip, r4, lsl #2]
	add	r3, r3, #1
	mla	r3, ip, r3, r1
	str	r3, [r2]
	b	.L18
.L14:
	ldr	r3, .L29+4
	ldr	r3, [r3]
	ldr	r1, .L29+8
	add	r3, r3, #1
	ldr	r2, [r1]
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	add	r3, r2, r3, lsl #4
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	grid+20
	.word	level
	.word	score
	.word	.LANCHOR0
	.size	getClearedLines, .-getClearedLines
	.align	2
	.global	clearLines
	.syntax unified
	.arm
	.fpu softvfp
	.type	clearLines, %function
clearLines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	mov	r0, sp
	bl	getClearedLines
	mov	r0, sp
	ldr	r1, .L42
	add	ip, sp, #16
.L35:
	ldr	r3, [r0], #4
	cmn	r3, #1
	beq	.L31
	sub	r3, r3, #1
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #1
	cmn	r3, #9
	blt	.L33
	add	r3, r3, #10
	add	r3, r1, r3, lsl #1
.L34:
	ldrh	r2, [r3, #-2]!
	cmp	r3, r1
	strh	r2, [r3, #20]	@ movhi
	bne	.L34
.L33:
	cmp	r0, ip
	bne	.L35
.L31:
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	grid
	.size	clearLines, .-clearLines
	.align	2
	.global	redrawGrid
	.syntax unified
	.arm
	.fpu softvfp
	.type	redrawGrid, %function
redrawGrid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	ldr	r8, .L52
	ldr	r7, .L52+4
	add	r9, r8, #400
.L45:
	mov	r5, r8
	mov	r4, #0
.L48:
	ldrh	r3, [r5], #2
	cmp	r3, #0
	movne	r2, #0
	moveq	r2, #1
	mov	r0, r4
	mov	r1, r6
	add	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmp	r4, #10
	bne	.L48
	add	r8, r8, #20
	cmp	r8, r9
	add	r6, r6, #1
	bne	.L45
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	grid
	.word	drawBlock
	.size	redrawGrid, .-redrawGrid
	.global	scoreIncrements
	.comm	grid,400,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	scoreIncrements, %object
	.size	scoreIncrements, 16
scoreIncrements:
	.word	40
	.word	100
	.word	300
	.word	1200
	.ident	"GCC: (devkitARM release 53) 9.1.0"
