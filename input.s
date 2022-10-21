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
	.file	"input.c"
	.text
	.align	2
	.global	getMoves
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	getMoves, %function
getMoves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L31
	strb	r3, [r0]
	strb	r3, [r0, #1]
	strb	r3, [r0, #2]
	ldr	r3, [r2]
	tst	r3, #2
	bne	.L2
	ldr	r1, .L31+4
	ldr	r1, [r1]
	tst	r1, #2
	beq	.L2
	mov	r3, #4
	strb	r3, [r0]
	ldr	r3, [r2]
.L3:
	ands	r1, r3, #16
	bne	.L4
.L29:
	ldr	ip, .L31+4
	ldr	ip, [ip]
	tst	ip, #16
	beq	.L4
	mov	ip, #2
	ldr	r3, .L31+8
	strb	ip, [r0, #1]
	str	r1, [r3]
	ldr	r3, [r2]
.L5:
	ands	r1, r3, #128
	bne	.L6
	ldr	ip, .L31+4
	ldr	ip, [ip]
	tst	ip, #128
	movne	ip, #3
	ldrne	r3, .L31+8
	strbne	ip, [r0, #2]
	strne	r1, [r3, #8]
	ldrne	r3, [r2]
.L6:
	tst	r3, #16
	bne	.L7
	ldr	ip, .L31+8
	ldr	r1, [ip]
	cmp	r1, #14
	movgt	r1, #2
	movgt	r3, #10
	strbgt	r1, [r0, #1]
	addle	r1, r1, #1
	strgt	r3, [ip]
	strle	r1, [ip]
	ldrgt	r3, [r2]
.L9:
	tst	r3, #128
	bxne	lr
.L30:
	ldr	r2, .L31+8
	ldr	r3, [r2, #8]
	cmp	r3, #14
	movgt	r1, #3
	movgt	r3, #10
	addle	r3, r3, #1
	strbgt	r1, [r0, #2]
	str	r3, [r2, #8]
	bx	lr
.L2:
	tst	r3, #1
	bne	.L3
	ldr	r1, .L31+4
	ldr	r1, [r1]
	tst	r1, #1
	movne	r3, #5
	strbne	r3, [r0]
	ldrne	r3, [r2]
	ands	r1, r3, #16
	beq	.L29
.L4:
	ands	r1, r3, #32
	bne	.L5
	ldr	ip, .L31+4
	ldr	ip, [ip]
	tst	ip, #32
	movne	ip, #1
	ldrne	r3, .L31+8
	strbne	ip, [r0, #1]
	strne	r1, [r3, #4]
	ldrne	r3, [r2]
	b	.L5
.L7:
	tst	r3, #32
	bne	.L9
	ldr	ip, .L31+8
	ldr	r1, [ip, #4]
	cmp	r1, #14
	movgt	r1, #1
	movgt	r3, #10
	strbgt	r1, [r0, #1]
	strgt	r3, [ip, #4]
	ldrgt	r3, [r2]
	addle	r1, r1, #1
	strle	r1, [ip, #4]
	tst	r3, #128
	bxne	lr
	b	.L30
.L32:
	.align	2
.L31:
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0
	.size	getMoves, .-getMoves
	.global	timers
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timers, %object
	.size	timers, 12
timers:
	.space	12
	.ident	"GCC: (devkitARM release 53) 9.1.0"
