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
	.file	"piece.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollision.part.0, %function
checkCollision.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L3
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldr	r2, [r0, #12]
	add	r1, r3, r3, lsl #1
	rsb	r3, r3, r1, lsl #3
	add	r2, r2, r2, lsl #2
	ldr	r1, .L3+4
	lsl	r3, r3, #2
	add	r3, r3, r2, lsl #2
	add	r3, r1, r3
	ldr	r0, [r0, #4]
	ldrb	r3, [r3, #26]	@ zero_extendqisi2
	sub	r0, r0, r3
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L4:
	.align	2
.L3:
	.word	currPiece
	.word	.LANCHOR0
	.size	checkCollision.part.0, .-checkCollision.part.0
	.align	2
	.global	setDropSpeed
	.syntax unified
	.arm
	.fpu softvfp
	.type	setDropSpeed, %function
setDropSpeed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	add	r3, r3, r0, lsl #2
	ldr	r2, [r3, #644]
	ldr	r3, .L6+4
	str	r2, [r3]
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.word	dropSpeed
	.size	setDropSpeed, .-setDropSpeed
	.align	2
	.global	newPiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	newPiece, %function
newPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r0, #3
	mov	r1, #5
	ldr	r3, .L15
	ldrh	ip, [r3, #10]
	ldr	r3, .L15+4
	cmp	ip, r2
	push	{r4, lr}
	stmib	r3, {r1, r2}
	strb	r0, [r3]
	str	r2, [r3, #12]
	bne	.L14
.L9:
	mov	r2, #18
	ldr	r1, .L15+8
	ldr	r3, .L15+12
	ldr	r1, [r1]
	add	r3, r3, r1, lsl #2
	ldr	r0, [r3, #644]
	ldr	r1, .L15+16
	ldr	r3, .L15+20
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L14:
	ldr	r3, .L15+24
	ldr	r0, .L15+28
	ldr	ip, [r3]
	ldr	r1, .L15+32
	str	r2, [r3]
	str	ip, [r0]
	mov	lr, pc
	bx	r1
	b	.L9
.L16:
	.align	2
.L15:
	.word	grid
	.word	currPiece
	.word	level
	.word	.LANCHOR0
	.word	dropSpeed
	.word	.LANCHOR1
	.word	score
	.word	highScore
	.word	initPlay
	.size	newPiece, .-newPiece
	.align	2
	.global	placePiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	placePiece, %function
placePiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	mov	r6, #1
	ldr	lr, .L27
	add	r3, r3, r3, lsl #2
	add	ip, r0, r0, lsl #1
	add	r3, lr, r3, lsl #2
	rsb	r0, r0, ip, lsl #3
	add	r3, r3, r0, lsl #2
	ldr	r7, .L27+4
	add	r5, r3, #10
	add	lr, lr, r0, lsl #2
.L18:
	mov	r0, #0
	add	ip, r5, r4
.L20:
	ldrb	r3, [ip], #1	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L19
	ldr	r8, [lr, #4]
	ldr	r9, [lr]
	sub	r8, r2, r8
	add	r3, r1, r0
	add	r8, r8, r8, lsl #2
	sub	r3, r3, r9
	add	r3, r3, r8, lsl #1
	lsl	r3, r3, #1
	strh	r6, [r7, r3]	@ movhi
.L19:
	add	r0, r0, #1
	cmp	r0, #4
	bne	.L20
	add	r4, r4, #4
	cmp	r4, #16
	add	r2, r2, #1
	bne	.L18
	mov	r1, #0
	ldr	r2, .L27+8
	ldr	r3, .L27+12
	strb	r1, [r2, #32]
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	grid
	.word	currPiece
	.word	clearLines
	.word	waitForVBlank
	.word	redrawGrid
	.size	placePiece, .-placePiece
	.align	2
	.global	drawBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlock, %function
drawBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r0, r0, #10
	cmp	r2, #0
	sub	sp, sp, #8
	lsl	r2, r0, #3
	lsl	r0, r1, #3
	beq	.L30
	mov	ip, #0
	mov	r3, #8
	mov	r1, r2
	str	ip, [sp]
	mov	r2, r3
	ldr	r4, .L33
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L30:
	mov	r3, #8
	ldr	ip, .L33+4
	mov	r1, r2
	str	ip, [sp]
	mov	r2, r3
	ldr	r4, .L33+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	drawRectDMA
	.word	block
	.word	drawImageDMA
	.size	drawBlock, .-drawBlock
	.align	2
	.global	drawPiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPiece, %function
drawPiece:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, r1
	mov	r8, r2
	mov	r7, #0
	ldr	r10, .L46
	add	r3, r3, r3, lsl #2
	add	r6, r0, r0, lsl #1
	add	r3, r10, r3, lsl #2
	rsb	r6, r0, r6, lsl #3
	add	r3, r3, r6, lsl #2
	sub	sp, sp, #12
	add	r3, r3, #10
	str	r3, [sp, #4]
	ldrb	r9, [sp, #48]	@ zero_extendqisi2
.L36:
	mov	r4, #0
	ldr	r3, [sp, #4]
	add	r5, r3, r7
.L38:
	ldrb	r3, [r5], #1	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L45
.L37:
	add	r4, r4, #1
	cmp	r4, #4
	bne	.L38
	add	r7, r7, #4
	cmp	r7, #16
	add	r8, r8, #1
	bne	.L36
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	add	r3, r10, r6, lsl #2
	ldr	r1, [r3, #4]
	ldr	r3, [r10, r6, lsl #2]
	add	r0, fp, r4
	mov	r2, r9
	sub	r1, r8, r1
	sub	r0, r0, r3
	bl	drawBlock
	b	.L37
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.size	drawPiece, .-drawPiece
	.align	2
	.global	drawCurrPiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurrPiece, %function
drawCurrPiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L55
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	cmp	r3, #0
	sub	sp, sp, #8
	bne	.L54
.L49:
	mov	r2, #0
	ldr	r3, [r4, #12]
	str	r2, [sp]
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldmib	r4, {r1, r2}
	bl	drawPiece
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L54:
	mov	r2, #1
	str	r2, [sp]
	add	r1, r4, #20
	ldr	r3, [r4, #28]
	ldm	r1, {r1, r2}
	ldrb	r0, [r4, #16]	@ zero_extendqisi2
	bl	drawPiece
	b	.L49
.L56:
	.align	2
.L55:
	.word	currPiece
	.size	drawCurrPiece, .-drawCurrPiece
	.align	2
	.global	checkCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollision, %function
checkCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #2
	beq	.L58
	cmp	r0, #3
	beq	.L59
	cmp	r0, #0
	beq	.L62
	mov	r0, #0
	bx	lr
.L58:
	ldr	r0, .L63
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldr	r2, [r0, #12]
	add	r1, r3, r3, lsl #1
	rsb	r3, r3, r1, lsl #3
	add	r2, r2, r2, lsl #2
	ldr	r1, .L63+4
	lsl	r3, r3, #2
	add	r3, r3, r2, lsl #2
	add	r3, r1, r3
	ldr	r2, [r0, #4]
	ldrb	r0, [r3, #28]	@ zero_extendqisi2
	add	r0, r0, r2
	cmp	r0, #8
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L62:
	b	checkCollision.part.0
.L59:
	ldr	r0, .L63
	ldrb	r3, [r0]	@ zero_extendqisi2
	ldr	r2, [r0, #12]
	add	r1, r3, r3, lsl #1
	rsb	r3, r3, r1, lsl #3
	add	r2, r2, r2, lsl #2
	ldr	r1, .L63+4
	lsl	r3, r3, #2
	add	r3, r3, r2, lsl #2
	add	r3, r1, r3
	ldr	r2, [r0, #8]
	ldrb	r0, [r3, #29]	@ zero_extendqisi2
	add	r0, r0, r2
	cmp	r0, #18
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L64:
	.align	2
.L63:
	.word	currPiece
	.word	.LANCHOR0
	.size	checkCollision, .-checkCollision
	.align	2
	.global	checkCollisionWithGrid
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionWithGrid, %function
checkCollisionWithGrid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L77
	mov	r4, r1
	ldrb	r1, [r8]	@ zero_extendqisi2
	mov	r6, r0
	ldr	r10, .L77+4
	add	ip, r1, r1, lsl #1
	rsb	ip, r1, ip, lsl #3
	mov	r5, r2
	add	r9, r10, ip, lsl #2
	sub	sp, sp, #96
	mov	r1, r9
	mov	r2, #92
	ldr	r3, .L77+8
	add	r0, sp, #4
	lsl	r7, ip, #2
	mov	lr, pc
	bx	r3
	mov	lr, #0
	ldr	ip, [r8, #8]
	ldr	r2, [r9, #4]
	ldr	r3, [r10, r7]
	ldr	r0, [r8, #4]
	add	ip, r4, ip
	sub	ip, ip, r2
	rsb	r3, r3, r3, lsl #31
	add	r6, r6, r0
	add	r2, ip, ip, lsl #2
	add	r5, r5, r5, lsl #2
	ldr	ip, .L77+12
	add	r3, r3, r6
	add	r1, sp, #4
	add	r5, r1, r5, lsl #2
	add	r3, r3, r2, lsl #1
	add	r5, r5, #10
	add	ip, ip, r3, lsl #1
.L66:
	mov	r3, #0
	add	r2, r5, lr
.L69:
	ldrb	r1, [r2], #1	@ zero_extendqisi2
	cmp	r1, #0
	lsl	r0, r3, #1
	add	r3, r3, #1
	beq	.L67
	ldrh	r1, [ip, r0]
	cmp	r1, #0
	bne	.L70
.L67:
	cmp	r3, #4
	bne	.L69
	add	lr, lr, #4
	cmp	lr, #16
	add	ip, ip, #20
	bne	.L66
	mov	r0, #0
	add	sp, sp, #96
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L70:
	mov	r0, #1
	add	sp, sp, #96
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	currPiece
	.word	.LANCHOR0
	.word	memcpy
	.word	grid
	.size	checkCollisionWithGrid, .-checkCollisionWithGrid
	.align	2
	.global	executeUserAction
	.syntax unified
	.arm
	.fpu softvfp
	.type	executeUserAction, %function
executeUserAction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r0, r0, #1
	push	{r4, r5, r6, lr}
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L79
.L82:
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L81
.L85:
	ldr	r5, .L101
	ldr	r4, [r5, #12]
	mov	r1, #0
	mov	r2, r4
	mov	r0, #1
	bl	checkCollisionWithGrid
	cmp	r0, #0
	bne	.L79
	ldrb	r3, [r5]	@ zero_extendqisi2
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	add	r4, r4, r4, lsl #2
	ldr	r2, .L101+4
	lsl	r3, r3, #2
	add	r3, r3, r4, lsl #2
	add	r3, r2, r3
	ldrb	r3, [r3, #28]	@ zero_extendqisi2
	ldr	r2, [r5, #4]
	add	r3, r3, r2
	cmp	r3, #8
	addle	r2, r2, #1
	strle	r2, [r5, #4]
.L79:
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	ldr	r4, .L101
	ldr	r6, [r4, #12]
	sub	r5, r6, #1
	cmp	r5, #0
	str	r5, [r4, #12]
	blt	.L100
	bl	checkCollision.part.0
	cmp	r0, #0
	beq	.L90
.L91:
	cmp	r6, #3
	str	r6, [r4, #12]
	ble	.L79
.L92:
	mov	r3, #0
	str	r3, [r4, #12]
	b	.L79
.L86:
	ldr	r4, .L101
	mov	r1, #0
	mvn	r0, #0
	ldr	r2, [r4, #12]
	bl	checkCollisionWithGrid
	cmp	r0, #0
	bne	.L79
	bl	checkCollision.part.0
	cmp	r0, #0
	ldreq	r3, [r4, #4]
	subeq	r3, r3, #1
	streq	r3, [r4, #4]
	b	.L79
.L84:
	ldr	r3, .L101+8
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #2
	ldreq	r3, .L101+12
	streq	r2, [r3]
	b	.L79
.L83:
	ldr	r4, .L101
	ldr	r6, [r4, #12]
	add	r5, r6, #1
	cmp	r5, #3
	str	r5, [r4, #12]
	ble	.L93
	mov	r3, #0
	str	r3, [r4, #12]
	bl	checkCollision.part.0
	subs	r5, r0, #0
	beq	.L94
.L96:
	mov	r3, #3
	str	r3, [r4, #12]
	b	.L79
.L100:
	mov	r5, #3
	str	r5, [r4, #12]
	bl	checkCollision.part.0
	cmp	r0, #0
	bne	.L92
.L90:
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	lsl	r2, r3, #2
	ldr	r1, .L101+4
	add	r3, r5, r5, lsl #2
	add	r3, r2, r3, lsl #2
	add	r3, r1, r3
	ldrb	r3, [r3, #28]	@ zero_extendqisi2
	ldr	r2, [r4, #4]
	add	r3, r3, r2
	cmp	r3, #8
	ble	.L79
	add	r6, r5, #1
	b	.L91
.L93:
	bl	checkCollision.part.0
	cmp	r0, #0
	bne	.L95
.L94:
	ldrb	r3, [r4]	@ zero_extendqisi2
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	lsl	r2, r3, #2
	ldr	r1, .L101+4
	add	r3, r5, r5, lsl #2
	add	r3, r2, r3, lsl #2
	add	r3, r1, r3
	ldrb	r3, [r3, #28]	@ zero_extendqisi2
	ldr	r2, [r4, #4]
	add	r3, r3, r2
	cmp	r3, #8
	ble	.L79
	sub	r6, r5, #1
.L95:
	cmp	r6, #0
	str	r6, [r4, #12]
	bge	.L79
	b	.L96
.L102:
	.align	2
.L101:
	.word	currPiece
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	dropSpeed
	.size	executeUserAction, .-executeUserAction
	.global	__aeabi_idivmod
	.align	2
	.global	updatePiece
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePiece, %function
updatePiece:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L117
	ldmib	r4, {r3, ip}
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldr	r1, [r4, #12]
	sub	sp, sp, #12
	strb	r0, [r4, #16]
	str	r3, [r4, #20]
	add	r0, sp, #4
	ldr	r3, .L117+4
	str	r1, [r4, #28]
	strb	r2, [r4, #32]
	str	ip, [r4, #24]
	mov	lr, pc
	bx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	bl	executeUserAction
	ldrb	r0, [sp, #5]	@ zero_extendqisi2
	bl	executeUserAction
	ldrb	r0, [sp, #6]	@ zero_extendqisi2
	bl	executeUserAction
	ldr	r3, .L117+8
	ldr	r3, [r3]
	tst	r3, #128
	ldrne	r2, .L117+12
	ldrne	r3, .L117+16
	ldrne	r2, [r2]
	ldr	r6, .L117+20
	addne	r3, r3, r2, lsl #2
	ldrne	r1, [r3, #644]
	ldreq	r3, .L117+24
	ldrne	r3, .L117+24
	ldr	r5, [r6]
	ldreq	r1, [r3]
	strne	r1, [r3]
	mov	r0, r5
	ldr	r3, .L117+28
	mov	lr, pc
	bx	r3
	subs	r3, r5, #0
	movne	r3, #1
	cmp	r1, #0
	movne	r3, #0
	cmp	r3, #0
	bne	.L116
.L106:
	ldr	r2, .L117+32
	ldr	r3, [r2]
	cmp	r3, #0
	add	r5, r5, #1
	subne	r3, r3, #1
	str	r5, [r6]
	strne	r3, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L116:
	ldr	r7, [r4, #12]
	mov	r1, #1
	mov	r2, r7
	mov	r0, #0
	bl	checkCollisionWithGrid
	cmp	r0, #0
	ldr	r2, [r4, #8]
	ldrb	r0, [r4]	@ zero_extendqisi2
	bne	.L107
	add	r1, r0, r0, lsl #1
	rsb	r1, r0, r1, lsl #3
	ldr	r3, .L117+16
	lsl	ip, r1, #2
	add	r1, r7, r7, lsl #2
	add	r1, ip, r1, lsl #2
	add	r1, r3, r1
	ldrb	r3, [r1, #29]	@ zero_extendqisi2
	add	r3, r3, r2
	cmp	r3, #18
	addle	r2, r2, #1
	strle	r2, [r4, #8]
	ble	.L106
.L107:
	mov	r3, r7
	ldr	r1, [r4, #4]
	bl	placePiece
	bl	newPiece
	ldr	r5, [r6]
	b	.L106
.L118:
	.align	2
.L117:
	.word	currPiece
	.word	getMoves
	.word	buttons
	.word	level
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	dropSpeed
	.word	__aeabi_idivmod
	.word	.LANCHOR1
	.size	updatePiece, .-updatePiece
	.global	firstInput
	.global	hardDropForgiveness
	.comm	dropSpeed,4,4
	.comm	currPiece,36,4
	.global	levelSpeeds
	.global	pieces
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pieces, %object
	.size	pieces, 644
pieces:
	.word	1
	.word	1
	.short	32767
	.ascii	"\000\000\000\000\001\001\001\000\000\001\000\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\000\001\000\000\001\001\000\000\000\001\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.ascii	"\000\001\000\000\001\001\001\000\000\000\000\000\000"
	.ascii	"\000\000\000\001\001\001\000"
	.ascii	"\000\001\000\000\000\001\001\000\000\001\000\000\000"
	.ascii	"\000\000\000\000\001\001\001"
	.space	2
	.word	1
	.word	1
	.short	31744
	.ascii	"\000\000\000\000\000\001\001\000\001\001\000\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\001\000\000\000\001\001\000\000\000\001\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.ascii	"\000\000\000\000\000\001\001\000\001\001\000\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\001\000\000\000\001\001\000\000\000\001\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.space	2
	.word	1
	.word	1
	.short	31
	.ascii	"\000\000\000\000\001\001\000\000\000\001\001\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\000\001\000\000\001\001\000\000\001\000\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.ascii	"\000\000\000\000\001\001\000\000\000\001\001\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\000\001\000\000\001\001\000\000\001\000\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.space	2
	.word	1
	.word	1
	.short	32767
	.ascii	"\000\000\000\000\001\001\001\001\000\000\000\000\000"
	.ascii	"\000\000\000\001\000\002\000"
	.ascii	"\000\001\000\000\000\001\000\000\000\001\000\000\000"
	.ascii	"\001\000\000\000\001\000\002"
	.ascii	"\000\000\000\000\001\001\001\001\000\000\000\000\000"
	.ascii	"\000\000\000\001\000\002\000"
	.ascii	"\000\001\000\000\000\001\000\000\000\001\000\000\000"
	.ascii	"\001\000\000\000\001\000\002"
	.space	2
	.word	1
	.word	1
	.short	31
	.ascii	"\000\000\000\000\001\001\001\000\000\000\001\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\000\001\000\000\000\001\000\000\001\001\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.ascii	"\001\000\000\000\001\001\001\000\000\000\000\000\000"
	.ascii	"\000\000\000\001\001\001\000"
	.ascii	"\000\001\001\000\000\001\000\000\000\001\000\000\000"
	.ascii	"\000\000\000\000\001\001\001"
	.space	2
	.word	1
	.word	1
	.short	31744
	.ascii	"\000\000\000\000\001\001\001\000\001\000\000\000\000"
	.ascii	"\000\000\000\001\000\001\001"
	.ascii	"\001\001\000\000\000\001\000\000\000\001\000\000\000"
	.ascii	"\000\000\000\001\001\000\001"
	.ascii	"\000\000\001\000\001\001\001\000\000\000\000\000\000"
	.ascii	"\000\000\000\001\001\001\000"
	.ascii	"\000\001\000\000\000\001\000\000\000\001\001\000\000"
	.ascii	"\000\000\000\000\001\001\001"
	.space	2
	.word	0
	.word	0
	.short	32767
	.ascii	"\001\001\000\000\001\001\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\001\001"
	.ascii	"\001\001\000\000\001\001\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\001\001"
	.ascii	"\001\001\000\000\001\001\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\001\001"
	.ascii	"\001\001\000\000\001\001\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\001\001"
	.space	2
	.type	levelSpeeds, %object
	.size	levelSpeeds, 80
levelSpeeds:
	.word	48
	.word	43
	.word	38
	.word	33
	.word	28
	.word	23
	.word	18
	.word	13
	.word	8
	.word	6
	.word	5
	.word	5
	.word	5
	.word	4
	.word	4
	.word	4
	.word	3
	.word	3
	.word	3
	.word	2
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hardDropForgiveness, %object
	.size	hardDropForgiveness, 4
hardDropForgiveness:
	.word	18
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	t.4181, %object
	.size	t.4181, 4
t.4181:
	.space	4
	.type	firstInput, %object
	.size	firstInput, 1
firstInput:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
