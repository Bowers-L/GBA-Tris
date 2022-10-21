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
	.file	"game.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	mov	r4, #67108864
	ldr	r3, .L15
	ldr	r10, .L15+4
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r10
	ldr	fp, .L15+8
	ldr	r6, .L15+12
	ldr	r5, .L15+16
	ldr	r9, .L15+20
	ldr	r8, .L15+24
	ldr	r7, .L15+28
.L6:
	ldr	r2, [fp]
	str	r2, [r6]
	ldr	r3, [r4, #304]
	tst	r3, #4
	str	r3, [fp]
	bne	.L3
	tst	r2, #4
	bne	.L14
.L3:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L4
	cmp	r3, #2
	beq	.L5
	cmp	r3, #0
	bne	.L6
	mov	lr, pc
	bx	r9
	b	.L6
.L5:
	mov	lr, pc
	bx	r7
	b	.L6
.L4:
	mov	lr, pc
	bx	r8
	b	.L6
.L14:
	mov	lr, pc
	bx	r10
	b	.L3
.L16:
	.align	2
.L15:
	.word	1027
	.word	initStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	select
	.word	play
	.size	main, .-main
	.global	seed
	.comm	buttons,4,4
	.comm	oldButtons,4,4
	.comm	state,1,1
	.bss
	.align	2
	.type	seed, %object
	.size	seed, 4
seed:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
