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
	.file	"gba.c"
	.text
	.align	2
	.global	waitForVBlank
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L2:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L2
	mov	r2, #67108864
.L3:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L3
	ldr	r2, .L7
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	randint
	.syntax unified
	.arm
	.fpu softvfp
	.type	randint, %function
randint:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L11
	str	lr, [sp, #-4]!
	ldr	r2, [ip]
	ldr	lr, .L11+4
	ldr	r3, .L11+8
	mla	r2, lr, r2, r3
	ldr	r3, .L11+12
	sub	r1, r1, r0
	and	r3, r3, r2, asr #16
	mul	r3, r1, r3
	str	r2, [ip]
	add	r0, r0, r3, asr #15
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR1
	.word	1664525
	.word	1013904223
	.word	32767
	.size	randint, .-randint
	.align	2
	.global	dmaCall
	.syntax unified
	.arm
	.fpu softvfp
	.type	dmaCall, %function
dmaCall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #2
	add	r0, r0, #67108864
	orr	r3, r3, #-2147483648
	str	lr, [r0, #184]
	str	r1, [r0, #176]
	ldr	lr, [sp], #4
	str	r2, [r0, #180]
	str	r3, [r0, #184]
	bx	lr
	.size	dmaCall, .-dmaCall
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	rsb	r0, r0, r0, lsl #4
	ldr	r3, [r3, #4]
	add	r1, r1, r0, lsl #4
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR1
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRectDMA
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectDMA, %function
drawRectDMA:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r3, r0, r3
	cmp	r0, r3
	bxge	lr
	push	{r4, r5, lr}
	mov	ip, #67108864
	mov	r4, #0
	ldr	lr, .L27
	rsb	r5, r3, r3, lsl #4
	ldr	lr, [lr, #4]
	rsb	r0, r0, r0, lsl #4
	add	r3, r1, r0, lsl #4
	add	r1, r1, r5, lsl #4
	orr	r2, r2, #-2130706432
	add	r3, lr, r3, lsl #1
	add	r1, lr, r1, lsl #1
.L20:
	add	r0, sp, #12
	str	r4, [ip, #220]
	str	r0, [ip, #212]
	str	r3, [ip, #216]
	add	r3, r3, #480
	cmp	r3, r1
	str	r2, [ip, #220]
	bne	.L20
	pop	{r4, r5, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR1
	.size	drawRectDMA, .-drawRectDMA
	.align	2
	.global	drawFullScreenImageDMA
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullScreenImageDMA, %function
drawFullScreenImageDMA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	ip, #0
	ldr	r1, .L30
	ldr	r2, .L30+4
	ldr	r1, [r1, #4]
	str	ip, [r3, #220]
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR1
	.word	-2147445248
	.size	drawFullScreenImageDMA, .-drawFullScreenImageDMA
	.align	2
	.global	drawImageDMA
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImageDMA, %function
drawImageDMA:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r3, r0, r3
	cmp	r0, r3
	bxge	lr
	push	{r4, r5, r6, lr}
	mov	ip, #67108864
	mov	r5, #0
	ldr	r4, .L41
	rsb	r0, r0, r0, lsl #4
	ldr	r4, [r4, #4]
	rsb	r6, r3, r3, lsl #4
	ldr	lr, [sp, #16]
	add	r3, r1, r0, lsl #4
	add	r1, r1, r6, lsl #4
	orr	r0, r2, #-2147483648
	add	r3, r4, r3, lsl #1
	add	r1, r4, r1, lsl #1
	lsl	r2, r2, #1
.L34:
	str	r5, [ip, #220]
	str	lr, [ip, #212]
	str	r3, [ip, #216]
	add	r3, r3, #480
	cmp	r1, r3
	str	r0, [ip, #220]
	add	lr, lr, r2
	bne	.L34
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR1
	.size	drawImageDMA, .-drawImageDMA
	.align	2
	.global	fillScreenDMA
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreenDMA, %function
fillScreenDMA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #67108864
	mov	lr, #0
	ldr	r1, .L45
	sub	sp, sp, #12
	ldr	r1, [r1, #4]
	ldr	r2, .L45+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #220]
	str	ip, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR1
	.word	-2130668032
	.size	fillScreenDMA, .-fillScreenDMA
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L57
	rsb	r0, r0, r0, lsl #4
	ldr	lr, [ip, #4]
	ldr	ip, .L57+4
	add	r0, r1, r0, lsl #4
	add	r2, r2, r2, lsl #1
	add	lr, lr, r0, lsl #1
	add	ip, ip, r2, lsl #4
.L48:
	mov	r1, lr
	sub	r2, ip, #48
.L50:
	ldrb	r0, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	r0, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, ip
	add	r1, r1, #480
	bne	.L50
	add	r4, r4, #1
	cmp	r4, #6
	add	ip, r2, #1
	add	lr, lr, #2
	bne	.L48
	pop	{r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR1
	.word	fontdata_6x8+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L59
	mov	r6, r0
	mov	r4, r1
.L61:
	mov	r1, r4
	mov	r0, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L61
.L59:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	drawCenteredString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCenteredString, %function
drawCenteredString:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, [sp, #24]
	mov	r4, r2
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	mov	r8, r3
	ldrh	r3, [sp, #28]
	beq	.L67
	mov	ip, r5
	rsb	r7, r5, #1
.L68:
	add	r6, ip, r7
	ldrb	lr, [ip, #1]!	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L68
	add	r6, r6, r6, lsl #1
	sub	r6, r4, r6, lsl #1
	sub	r8, r8, #8
	add	r6, r1, r6, lsr #1
	add	r8, r0, r8, lsr #1
.L70:
	mov	r1, r6
	mov	r0, r8
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r6, r6, #6
	bne	.L70
.L67:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawCenteredString, .-drawCenteredString
	.align	2
	.global	getNumString
	.syntax unified
	.arm
	.fpu softvfp
	.type	getNumString, %function
getNumString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	moveq	r3, #48
	push	{r4, r5, r6, lr}
	strbeq	r0, [r1, #1]
	mov	r4, r1
	strbeq	r3, [r1]
	beq	.L77
	sub	r6, r1, #1
	mov	r5, r6
	mov	ip, r6
	ldr	lr, .L87
.L80:
	smull	r3, r2, lr, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r2, r3, r3, lsl #2
	sub	r2, r0, r2, lsl #1
	add	r2, r2, #48
	subs	r0, r3, #0
	add	r3, ip, #2
	sub	r3, r3, r4
	strb	r2, [ip, #1]!
	bne	.L80
	strb	r0, [r4, r3]
	ldr	r3, .L87+4
	mov	r0, r4
	mov	lr, pc
	bx	r3
	asrs	r3, r0, #1
	beq	.L77
	add	r4, r4, r0
	add	r6, r6, r3
.L82:
	ldrb	r3, [r5, #1]!	@ zero_extendqisi2
	ldrb	r2, [r4, #-1]!	@ zero_extendqisi2
	cmp	r5, r6
	strb	r2, [r5]
	strb	r3, [r4]
	bne	.L82
.L77:
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	1717986919
	.word	strlen
	.size	getNumString, .-getNumString
	.global	vBlankCounter
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__qran_seed, %object
	.size	__qran_seed, 4
__qran_seed:
	.word	42
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vBlankCounter, %object
	.size	vBlankCounter, 4
vBlankCounter:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
