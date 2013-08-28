	.file	"myLib.c"
@ GNU C version 3.3.2 (arm-thumb-elf)
@	compiled by GNU C version 3.3.1 (cygming special).
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed -mthumb-interwork -mlong-calls
@ -auxbase-strip -O2 -Wall -fverbose-asm
@ options enabled:  -fdefer-pop -fomit-frame-pointer
@ -foptimize-sibling-calls -fcse-follow-jumps -fcse-skip-blocks
@ -fexpensive-optimizations -fthread-jumps -fstrength-reduce -fpeephole
@ -fforce-mem -ffunction-cse -fkeep-static-consts -fcaller-saves
@ -freg-struct-return -fgcse -fgcse-lm -fgcse-sm -floop-optimize
@ -fcrossjumping -fif-conversion -fif-conversion2 -frerun-cse-after-loop
@ -frerun-loop-opt -fdelete-null-pointer-checks -fschedule-insns
@ -fschedule-insns2 -fsched-interblock -fsched-spec -fbranch-count-reg
@ -freorder-blocks -freorder-functions -fcprop-registers -fcommon
@ -fverbose-asm -fgnu-linker -fregmove -foptimize-register-move
@ -fargument-alias -fstrict-aliasing -fmerge-constants
@ -fzero-initialized-in-bss -fident -fpeephole2 -fguess-branch-probability
@ -fmath-errno -ftrapping-math -mapcs -mapcs-frame -mapcs-32 -msoft-float
@ -mthumb-interwork -mlong-calls

	.global	videoBuffer
	.data
	.align	2
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, asl #4	@  row,  row
	add	r1, r1, r0, asl #4	@  col
	ldr	r0, [r3, #0]	@  videoBuffer
	mov	r1, r1, asl #1
	@ lr needed for prologue
	strh	r2, [r1, r0]	@ movhi 
	bx	lr
.L3:
	.align	2
.L2:
	.word	videoBuffer
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #4
	mov	r5, r2	@  height
	ldr	r2, [sp, #16]	@  color
	cmp	r5, #0	@  height
	strh	r2, [sp, #2]	@ movhi 	@  color
	mov	ip, r1	@  col
	mov	r4, r3	@  width
	ble	.L11
	ldr	r2, .L12
	rsb	r3, r0, r0, asl #4	@  row,  row
	ldr	r1, [r2, #0]	@  videoBuffer
	add	r3, ip, r3, asl #4	@  col
	mov	lr, #67108864
	add	r0, r1, r3, asl #1
	mov	r2, r5	@  r,  height
	orr	r3, r4, #-2130706432	@  width
	add	ip, sp, #2
	add	r1, lr, #212
.L9:
	subs	r2, r2, #1	@  r,  r
	str	ip, [lr, #212]	@  <variable>.src
	str	r0, [r1, #4]	@  <variable>.dst
	str	r3, [r1, #8]	@  <variable>.cnt
	add	r0, r0, #480
	bne	.L9
.L11:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	videoBuffer
	.size	drawRect3, .-drawRect3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r0, r0, r0, asl #4	@  row,  row
	add	r0, r1, r0, asl #4	@  whichPixel,  col
	add	r0, r0, r0, lsr #31	@  whichPixel,  whichPixel
	mov	r0, r0, asr #1	@  whichShort
	tst	r1, #1	@  col
	str	lr, [sp, #-4]!
	mov	ip, r0, asl #1	@  whichShort
	and	lr, r2, #255	@  index
	mov	r0, r0, asl #1	@  whichShort
	beq	.L15
	ldr	r3, .L17
	ldr	r1, [r3, #0]	@  videoBuffer
	ldrb	r2, [r0, r1]	@ zero_extendqisi2
	orr	r2, r2, lr, asl #8	@  index
	strh	r2, [r0, r1]	@ movhi 
.L14:
	ldr	lr, [sp], #4
	bx	lr
.L15:
	ldr	r3, .L17
	ldr	r1, [r3, #0]	@  videoBuffer
	ldrh	r2, [ip, r1]
	and	r2, r2, #65280
	orr	r2, r2, lr	@  index
	strh	r2, [ip, r1]	@ movhi 
	b	.L14
.L18:
	.align	2
.L17:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4OLD
	.type	drawRect4OLD, %function
drawRect4OLD:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	sl, r2	@  height
	mov	r8, #0	@  r
	ldr	r2, [fp, #4]	@  index
	cmp	r8, sl	@  r,  height
	strb	r2, [fp, #-41]	@  index
	mov	r9, r0	@  row
	mov	r7, r1	@  col
	mov	r6, r3	@  width
	bge	.L31
.L29:
	mov	r4, #0	@  c
	cmp	r4, r6	@  c,  width
	bge	.L33
	add	r5, r9, r8	@  row,  row,  r
.L28:
	ldrb	r2, [fp, #-41]	@ zero_extendqisi2	@  index
	add	r1, r7, r4	@  col,  col,  c
	and	r2, r2, #255	@  height
	mov	r0, r5	@  row
	add	r4, r4, #1	@  c,  c
	bl	setPixel4
	cmp	r4, r6	@  c,  width
	blt	.L28
.L33:
	add	r8, r8, #1	@  r,  r
	cmp	r8, sl	@  r,  height
	blt	.L29
.L31:
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
	.size	drawRect4OLD, .-drawRect4OLD
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #4
	ldr	ip, [sp, #20]	@  index
	strb	ip, [sp, #3]	@  index
	ldrb	lr, [sp, #3]	@ zero_extendqisi2	@  index
	ldrb	ip, [sp, #3]	@ zero_extendqisi2	@  index
	mov	r6, r2	@  height
	orr	ip, ip, lr, asl #8
	add	r2, r1, r1, lsr #31	@  col,  col
	cmp	r6, #0	@  height
	strh	ip, [sp, #0]	@ movhi 	@  indexindex
	bic	r4, r2, #1	@  col
	ble	.L41
	ldr	r2, .L42
	add	r3, r3, r3, lsr #31	@  width,  width
	rsb	r1, r0, r0, asl #4	@  row,  row
	mov	r3, r3, asr #1
	mov	r5, #67108864
	add	r0, r4, r1, asl #4	@  col
	ldr	lr, [r2, #0]	@  videoBuffer
	orr	ip, r3, #-2130706432
	mov	r2, r6	@  r,  height
	mov	r4, sp
	add	r1, r5, #212
.L39:
	bic	r3, r0, #1
	add	r3, lr, r3
	subs	r2, r2, #1	@  r,  r
	str	r4, [r5, #212]	@  <variable>.src
	add	r0, r0, #240
	str	r3, [r1, #4]	@  <variable>.dst
	str	ip, [r1, #8]	@  <variable>.cnt
	bne	.L39
.L41:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	videoBuffer
	.size	drawRect4, .-drawRect4
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	mov	r2, #67108864
.L45:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L45
	mov	r2, #67108864
.L48:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L48
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0	@  i
	cmp	r3, r0	@  i,  clicks
	@ lr needed for prologue
	bxcs	lr
.L56:
	add	r3, r3, #1	@  i,  i
	cmp	r3, r0	@  i,  clicks
	bcc	.L56
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #8
	strh	r0, [sp, #6]	@ movhi 	@  color
	ldr	r3, .L60
	ldrh	lr, [sp, #6]	@  color
	ldrh	r2, [sp, #6]	@  color
	mov	ip, #67108864
	ldr	r4, [r3, #0]	@  videoBuffer
	mov	r1, #-2063597568
	add	r0, ip, #212
	orr	r2, r2, lr, asl #16
	add	r1, r1, #19200
	str	r2, [sp, #0]	@  colorcolor
	str	sp, [ip, #212]	@  <variable>.src
	str	r4, [r0, #4]	@  <variable>.dst
	str	r1, [r0, #8]	@  <variable>.cnt
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	videoBuffer
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillPicture3
	.type	fillPicture3, %function
fillPicture3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L63
	mov	r1, #67108864
	ldr	ip, [r3, #0]	@  videoBuffer
	mov	r3, #-2147483648
	add	r2, r1, #212
	add	r3, r3, #38400
	str	r0, [r1, #212]	@  picture,  <variable>.src
	@ lr needed for prologue
	str	ip, [r2, #4]	@  <variable>.dst
	str	r3, [r2, #8]	@  <variable>.cnt
	bx	lr
.L64:
	.align	2
.L63:
	.word	videoBuffer
	.size	fillPicture3, .-fillPicture3
	.align	2
	.global	drawBitmap3
	.type	drawBitmap3, %function
drawBitmap3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0	@  height
	stmfd	sp!, {r4, r5, r6, lr}
	mov	ip, r1	@  col
	mov	r6, r3	@  height
	mov	r5, r2	@  width
	ble	.L72
	ldr	r2, .L73
	rsb	r3, r0, r0, asl #4	@  row,  row
	ldr	r1, [r2, #0]	@  videoBuffer
	add	r3, ip, r3, asl #4	@  col
	mov	r4, #67108864
	ldr	ip, [sp, #16]	@  bitmap,  bitmap
	add	r0, r1, r3, asl #1
	mov	lr, r5, asl #1	@  width
	mov	r3, r6	@  r,  height
	orr	r2, r5, #-2147483648	@  width
	add	r1, r4, #212
.L70:
	subs	r3, r3, #1	@  r,  r
	str	ip, [r4, #212]	@  bitmap,  <variable>.src
	str	r0, [r1, #4]	@  <variable>.dst
	add	ip, ip, lr	@  bitmap,  bitmap
	str	r2, [r1, #8]	@  <variable>.cnt
	add	r0, r0, #480
	bne	.L70
.L72:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	videoBuffer
	.size	drawBitmap3, .-drawBitmap3
	.align	2
	.global	copyPicture4
	.type	copyPicture4, %function
copyPicture4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L76
	mov	r1, #67108864
	ldr	ip, [r3, #0]	@  videoBuffer
	mov	r3, #-2147483648
	add	r2, r1, #212
	add	r3, r3, #19200
	str	r0, [r1, #212]	@  buffer,  <variable>.src
	@ lr needed for prologue
	str	ip, [r2, #4]	@  <variable>.dst
	str	r3, [r2, #8]	@  <variable>.cnt
	bx	lr
.L77:
	.align	2
.L76:
	.word	videoBuffer
	.size	copyPicture4, .-copyPicture4
	.align	2
	.global	drawString0
	.type	drawString0, %function
drawString0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, fp, ip, lr, pc}
	add	r1, r1, r0, asl #5	@  col,  row
	mov	r8, #100663296
	ldr	sl, .L85
	sub	fp, ip, #4
	mov	r6, r2	@  string
	and	r7, r3, #255	@  palIndex
	mov	r4, r1, asl #1
	mov	r5, #0	@  i
	add	r8, r8, #63488
.L79:
	mov	r0, r6	@  string
	mov	lr, pc
	bx	sl
	cmp	r5, r0	@  i,  row
	bcs	.L84
	ldrb	r3, [r6, r5]	@ zero_extendqisi2	@ * i
	add	r3, r3, r7, asl #12	@  palIndex
	strh	r3, [r4, r8]	@ movhi 	@  <variable>.tilemap
	add	r5, r5, #1	@  i,  i
	add	r4, r4, #2
	b	.L79
.L84:
	ldmea	fp, {r4, r5, r6, r7, r8, sl, fp, sp, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	strlen
	.size	drawString0, .-drawString0
	.align	2
	.global	eraseString0
	.type	eraseString0, %function
eraseString0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0	@  len
	@ lr needed for prologue
	bxle	lr
	add	r3, r1, r0, asl #5	@  col,  row
	mov	ip, #100663296
	mov	r0, r3, asl #1
	add	ip, ip, #63488
.L92:
	mov	r3, #0	@ movhi
	subs	r2, r2, #1	@  i,  i
	strh	r3, [r0, ip]	@ movhi 	@  <variable>.tilemap
	add	r0, r0, #2
	bne	.L92
	bx	lr
	.size	eraseString0, .-eraseString0
	.align	2
	.global	clearStrings0
	.type	clearStrings0, %function
clearStrings0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #67108864
	mov	r2, #100663296
	mov	r1, #-2130706432
	add	r0, ip, #212
	add	r2, r2, #63488
	add	r1, r1, #528
	mov	r3, #0
	str	r3, [ip, #212]	@  <variable>.src
	@ lr needed for prologue
	str	r2, [r0, #4]	@  <variable>.dst
	str	r1, [r0, #8]	@  <variable>.cnt
	bx	lr
	.size	clearStrings0, .-clearStrings0
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #67108864
	ldrh	r3, [r0, #0]
	mov	r2, #100663296
	tst	r3, #16
	orr	ip, r3, #16
	bic	r1, r3, #16
	ldr	r3, .L100
	add	r2, r2, #40960
	moveq	r2, #100663296
	@ lr needed for prologue
	strneh	r1, [r0, #0]	@ movhi 
	streqh	ip, [r0, #0]	@ movhi 
	str	r2, [r3, #0]	@  videoBuffer
	bx	lr
.L101:
	.align	2
.L100:
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.comm	lastButtons, 4, 32
	.comm	buttons, 4, 32
	.ident	"GCC: (GNU) 3.3.2"
