	.file	"main.c"
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

	.global	bkrndSnd
	.data
	.align	2
	.type	bkrndSnd, %object
	.size	bkrndSnd, 16
bkrndSnd:
	.word	s_background
	.word	843
	.word	11025
	.word	-1521
	.global	explSnd
	.align	2
	.type	explSnd, %object
	.size	explSnd, 16
explSnd:
	.word	s_explosion
	.word	35
	.word	11025
	.word	-1521
	.global	longExplSnd
	.align	2
	.type	longExplSnd, %object
	.size	longExplSnd, 16
longExplSnd:
	.word	s_longexpl
	.word	209
	.word	11025
	.word	-1521
	.global	synthSnd
	.align	2
	.type	synthSnd, %object
	.size	synthSnd, 16
synthSnd:
	.word	s_synth
	.word	39
	.word	11025
	.word	-1521
	.global	introSnd
	.align	2
	.type	introSnd, %object
	.size	introSnd, 16
introSnd:
	.word	s_ravenx
	.word	67
	.word	11025
	.word	-1521
	.global	vblankcount
	.bss
	.global	vblankcount
	.align	2
	.type	vblankcount, %object
	.size	vblankcount, 4
vblankcount:
	.space	4
	.global	chanACount
	.global	chanACount
	.align	2
	.type	chanACount, %object
	.size	chanACount, 4
chanACount:
	.space	4
	.global	playingA
	.global	playingA
	.type	playingA, %object
	.size	playingA, 1
playingA:
	.space	1
	.global	chanBCount
	.global	chanBCount
	.align	2
	.type	chanBCount, %object
	.size	chanBCount, 4
chanBCount:
	.space	4
	.global	playingB
	.global	playingB
	.type	playingB, %object
	.size	playingB, 1
playingB:
	.space	1
	.global	bg1
	.data
	.align	2
	.type	bg1, %object
	.size	bg1, 24
bg1:
	.word	background1Tiles
	.word	background1Map
	.word	background1Pal
	.word	640
	.word	4096
	.word	512
	.global	bg2
	.align	2
	.type	bg2, %object
	.size	bg2, 24
bg2:
	.word	background2Tiles
	.word	background2Map
	.word	background2Pal
	.word	4224
	.word	4096
	.word	512
	.global	bgClouds
	.align	2
	.type	bgClouds, %object
	.size	bgClouds, 24
bgClouds:
	.word	bgCloudsTiles
	.word	bgCloudsMap
	.word	bgCloudsPal
	.word	3648
	.word	2048
	.word	512
	.global	shipPal
	.section	.rodata
	.type	shipPal, %object
	.size	shipPal, 1
shipPal:
	.byte	5
	.global	shipFrame1
	.align	1
	.type	shipFrame1, %object
	.size	shipFrame1, 2
shipFrame1:
	.short	0
	.global	shipFrame2
	.align	1
	.type	shipFrame2, %object
	.size	shipFrame2, 2
shipFrame2:
	.short	128
	.global	shipShape
	.align	1
	.type	shipShape, %object
	.size	shipShape, 2
shipShape:
	.short	0
	.global	shipSize
	.align	1
	.type	shipSize, %object
	.size	shipSize, 2
shipSize:
	.short	-32768
	.global	shipSpeed
	.type	shipSpeed, %object
	.size	shipSpeed, 1
shipSpeed:
	.byte	2
	.global	enemy1Pal
	.type	enemy1Pal, %object
	.size	enemy1Pal, 1
enemy1Pal:
	.byte	6
	.global	enemy2Pal
	.type	enemy2Pal, %object
	.size	enemy2Pal, 1
enemy2Pal:
	.byte	8
	.global	enemyHitPal
	.type	enemyHitPal, %object
	.size	enemyHitPal, 1
enemyHitPal:
	.byte	0
	.global	enemy1Image
	.align	1
	.type	enemy1Image, %object
	.size	enemy1Image, 2
enemy1Image:
	.short	256
	.global	enemy2Image
	.align	1
	.type	enemy2Image, %object
	.size	enemy2Image, 2
enemy2Image:
	.short	384
	.global	enemy1Shape
	.align	1
	.type	enemy1Shape, %object
	.size	enemy1Shape, 2
enemy1Shape:
	.short	0
	.global	enemy2Shape
	.align	1
	.type	enemy2Shape, %object
	.size	enemy2Shape, 2
enemy2Shape:
	.short	0
	.global	enemy1Size
	.align	1
	.type	enemy1Size, %object
	.size	enemy1Size, 2
enemy1Size:
	.short	-32768
	.global	enemy2Size
	.align	1
	.type	enemy2Size, %object
	.size	enemy2Size, 2
enemy2Size:
	.short	-32768
	.global	enemy1Health
	.type	enemy1Health, %object
	.size	enemy1Health, 1
enemy1Health:
	.byte	-96
	.global	enemy2Health
	.type	enemy2Health, %object
	.size	enemy2Health, 1
enemy2Health:
	.byte	60
	.global	enemy1Pts
	.type	enemy1Pts, %object
	.size	enemy1Pts, 1
enemy1Pts:
	.byte	10
	.global	enemy2Pts
	.type	enemy2Pts, %object
	.size	enemy2Pts, 1
enemy2Pts:
	.byte	5
	.global	enemy1Spawn
	.align	2
	.type	enemy1Spawn, %object
	.size	enemy1Spawn, 4
enemy1Spawn:
	.word	305
	.global	enemy2Spawn
	.align	2
	.type	enemy2Spawn, %object
	.size	enemy2Spawn, 4
enemy2Spawn:
	.word	110
	.global	flashAmt
	.type	flashAmt, %object
	.size	flashAmt, 1
flashAmt:
	.byte	5
	.global	maxVDist
	.type	maxVDist, %object
	.size	maxVDist, 1
maxVDist:
	.byte	50
	.global	projPal
	.type	projPal, %object
	.size	projPal, 1
projPal:
	.byte	7
	.global	projImage
	.align	1
	.type	projImage, %object
	.size	projImage, 2
projImage:
	.short	5
	.global	projShape
	.align	1
	.type	projShape, %object
	.size	projShape, 2
projShape:
	.short	0
	.global	projSize
	.align	1
	.type	projSize, %object
	.size	projSize, 2
projSize:
	.short	0
	.global	maxProjs
	.type	maxProjs, %object
	.size	maxProjs, 1
maxProjs:
	.byte	4
	.global	projDelay
	.type	projDelay, %object
	.size	projDelay, 1
projDelay:
	.byte	8
	.global	projDamage
	.type	projDamage, %object
	.size	projDamage, 1
projDamage:
	.byte	30
	.global	missilePal
	.type	missilePal, %object
	.size	missilePal, 1
missilePal:
	.byte	7
	.global	missileImage
	.align	1
	.type	missileImage, %object
	.size	missileImage, 2
missileImage:
	.short	6
	.global	missileShape
	.align	1
	.type	missileShape, %object
	.size	missileShape, 2
missileShape:
	.short	0
	.global	missileSize
	.align	1
	.type	missileSize, %object
	.size	missileSize, 2
missileSize:
	.short	0
	.global	maxMissiles
	.type	maxMissiles, %object
	.size	maxMissiles, 1
maxMissiles:
	.byte	2
	.global	missDelay
	.type	missDelay, %object
	.size	missDelay, 1
missDelay:
	.byte	60
	.global	missDamage
	.type	missDamage, %object
	.size	missDamage, 1
missDamage:
	.byte	50
	.global	homingLvl
	.type	homingLvl, %object
	.size	homingLvl, 1
homingLvl:
	.byte	2
	.global	explDelay
	.type	explDelay, %object
	.size	explDelay, 1
explDelay:
	.byte	3
	.global	currentExpl
	.bss
	.global	currentExpl
	.type	currentExpl, %object
	.size	currentExpl, 1
currentExpl:
	.space	1
	.global	explPal
	.section	.rodata
	.type	explPal, %object
	.size	explPal, 1
explPal:
	.byte	7
	.global	explFrame1
	.align	1
	.type	explFrame1, %object
	.size	explFrame1, 2
explFrame1:
	.short	4
	.global	explFrame2
	.align	1
	.type	explFrame2, %object
	.size	explFrame2, 2
explFrame2:
	.short	36
	.global	explFrame3
	.align	1
	.type	explFrame3, %object
	.size	explFrame3, 2
explFrame3:
	.short	100
	.global	explFrame4
	.align	1
	.type	explFrame4, %object
	.size	explFrame4, 2
explFrame4:
	.short	228
	.global	explFrame5
	.align	1
	.type	explFrame5, %object
	.size	explFrame5, 2
explFrame5:
	.short	356
	.global	explFrame6
	.align	1
	.type	explFrame6, %object
	.size	explFrame6, 2
explFrame6:
	.short	580
	.global	maxW
	.type	maxW, %object
	.size	maxW, 1
maxW:
	.byte	-17
	.global	maxH
	.type	maxH, %object
	.size	maxH, 1
maxH:
	.byte	-97
	.global	oamStart
	.type	oamStart, %object
	.size	oamStart, 1
oamStart:
	.byte	5
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	ip, sp
	mov	r3, #128
	mvn	r1, #1264
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	r1, r1, #1
	str	r3, [r2, #132]
	mov	r3, #0	@ movhi
	strh	r3, [r2, #128]	@ movhi 
	sub	fp, ip, #4
	ldr	r3, .L6
	strh	r1, [r2, #130]	@ movhi 
	mov	lr, pc
	bx	r3
	ldr	r4, .L6+4
	ldr	r3, .L6+8
	str	r3, [r4, #0]	@  gameState
.L5:
	ldr	ip, [r4, #0]	@  gameState
	mov	lr, pc
	bx	ip
	b	.L5
.L7:
	.align	2
.L6:
	.word	setupInterrupts
	.word	gameState
	.word	splashScreen
	.size	main, .-main
	.align	2
	.global	splashScreen
	.type	splashScreen, %function
splashScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	mov	r3, #1024
	stmfd	sp!, {r4, fp, ip, lr, pc}
	add	r3, r3, #3
	mov	r4, #67108864
	sub	fp, ip, #4
	ldr	r2, .L15
	strh	r3, [r4, #0]	@ movhi 
	mov	lr, pc
	bx	r2
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L15+8
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+16
	ldr	r0, .L15+20
	mov	lr, pc
	bx	r3
	mov	r0, #356352
	add	r0, r0, #3648
	ldr	r2, .L15+24
	mov	lr, pc
	bx	r2
	ldr	r3, [r4, #304]
	mvn	r3, r3
	tst	r3, #8
	mov	r0, #0	@  rannum
	bne	.L14
	mov	r2, r4
.L12:
	ldr	r3, [r2, #304]
	mvn	r3, r3
	tst	r3, #8
	add	r0, r0, #1	@  rannum,  rannum
	beq	.L12
.L14:
	ldr	r3, .L15+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+32
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r2, .L15+36
	ldr	r3, .L15+40
	str	r2, [r3, #0]	@  gameState
	ldmea	fp, {r4, fp, sp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	stopSound1
	.word	stopSound2
	.word	introSnd
	.word	playSound
	.word	fillPicture3
	.word	img_splashBitmap
	.word	delay
	.word	srand
	.word	fillScreen3
	.word	startGame
	.word	gameState
	.size	splashScreen, .-splashScreen
	.global	__modsi3
	.global	__floatsidf
	.global	__truncdfsf2
	.global	__divsf3
	.global	__floatsisf
	.global	__mulsf3
	.global	__fixsfsi
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"S:\000"
	.align	2
.LC2:
	.ascii	"GAME OVER\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"Final Score:\000"
	.align	2
.LC1:
	.ascii	"PAUSED\000"
	.text
	.align	2
	.global	startGame
	.type	startGame, %function
startGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
	ldr	r0, .L265
	sub	fp, ip, #4
	mov	r2, #0	@  paused
	sub	sp, sp, #136
	ldr	r3, .L265+4
	str	r2, [r0, #0]	@  paused,  score
	str	r2, [fp, #-140]	@  paused,  paused
	mov	lr, pc
	bx	r3
	ldr	r1, .L265+8
	mov	lr, pc
	bx	r1
	mov	r2, #7296
	mov	r3, #67108864
	add	r2, r2, #3
	strh	r2, [r3, #8]	@ movhi 
	mov	r1, #7680
	ldr	r2, [fp, #-140]	@  paused
	mov	r0, #7936
	add	r1, r1, #6
	add	r0, r0, #8
	mov	ip, #6912	@ movhi
	strh	r2, [r3, #16]	@ movhi 
	mov	r7, #100663296
	strh	r1, [r3, #10]	@ movhi 
	ldr	r6, .L265+12
	strh	r2, [r3, #20]	@ movhi 
	strh	ip, [r3, #0]	@ movhi 
	strh	r0, [r3, #14]	@ movhi 
	str	sp, [fp, #-152]
	mov	r4, r2	@  imgptr
	mov	lr, r2	@  dataptr,  imgptr
	mov	r8, r2	@  i,  dataptr
	add	r7, r7, #32768
.L27:
	mov	r5, #7	@  r
.L26:
	add	r2, lr, r6	@  dataptr
	ldrb	r1, [r2, #1]	@ zero_extendqisi2	@  fontdata_6x8
	ldrb	r3, [r6, lr]	@ zero_extendqisi2	@  fontdata_6x8
	ldrb	ip, [r2, #2]	@ zero_extendqisi2	@  fontdata_6x8
	ldrb	r0, [r2, #3]	@ zero_extendqisi2	@  fontdata_6x8
	orr	r3, r3, r1, asl #4
	orr	r3, r3, ip, asl #8
	mov	r2, r4, asl #1	@  imgptr
	orr	r3, r3, r0, asl #12
	strh	r3, [r2, r7]	@ movhi 	@  <variable>.tileimg
	add	lr, lr, #4	@  dataptr,  dataptr
	add	r3, lr, r6	@  dataptr
	ldrb	r1, [r3, #1]	@ zero_extendqisi2	@  fontdata_6x8
	ldrb	r2, [r6, lr]	@ zero_extendqisi2	@  fontdata_6x8
	add	r4, r4, #1	@  imgptr,  imgptr
	mov	r3, r4, asl #1	@  imgptr
	orr	r2, r2, r1, asl #4
	subs	r5, r5, #1	@  r,  r
	strh	r2, [r3, r7]	@ movhi 	@  <variable>.tileimg
	add	r4, r4, #1	@  imgptr,  imgptr
	add	lr, lr, #2	@  dataptr,  dataptr
	bpl	.L26
	add	r8, r8, #1	@  i,  i
	cmp	r8, #255	@  i
	ble	.L27
	ldr	r3, .L265+16
	mov	r4, #67108864
	str	r3, [r4, #212]	@  <variable>.src
	mov	r0, #-2147483648
	ldr	r3, .L265+20
	mov	r2, #67108864
	mov	r1, #100663296
	add	r2, r2, #212
	mov	lr, r0
	add	r1, r1, #65536
	add	r0, r0, #16384
	mov	ip, #83886080
	mov	r8, #0	@  i
	str	r1, [r2, #4]	@  <variable>.dst
	mov	r5, #1	@  i
	str	r0, [r2, #8]	@  <variable>.cnt
	add	ip, ip, #512
	str	r3, [r4, #212]	@  <variable>.src
	add	lr, lr, #256
	mov	r4, #27
	mov	r3, #30
	str	ip, [r2, #4]	@  <variable>.dst
	strh	r8, [fp, #-54]	@ movhi 	@  i,  ship
	str	lr, [r2, #8]	@  <variable>.cnt
	ldr	r1, .L265+212
	strb	r3, [fp, #-55]	@  ship
	str	r8, [fp, #-64]	@  i,  ship
	str	r8, [fp, #-60]	@  i,  ship
	strb	r4, [fp, #-56]	@  ship
	strb	r5, [fp, #-52]	@  i,  ship
	mov	lr, pc
	bx	r1
	ldr	r3, .L265+24
	smull	ip, r2, r3, r0	@  rDist
	mov	r3, r0, asr #31	@  rDist
	add	r2, r2, r0	@  rDist
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #3
	sub	r0, r0, r3, asl #2	@  rDist
	add	r0, r0, #50
	str	r0, [fp, #-112]
	mov	r6, #239
	mvn	r0, #0	@ movhi
	mov	r1, #160	@ movhi
	strb	r8, [fp, #-91]	@  i
	strh	r8, [fp, #-98]	@ movhi 	@  i
	strh	r8, [fp, #-94]	@ movhi 	@  i
	strb	r4, [fp, #-103]
	strh	r0, [fp, #-100]	@ movhi 
	str	r6, [fp, #-108]
	strb	r4, [fp, #-104]
	strh	r5, [fp, #-102]	@ movhi 	@  i
	strb	r5, [fp, #-92]
	strh	r1, [fp, #-96]	@ movhi 
	sub	lr, fp, #112
	ldmia	lr!, {r0, r1, r2, r3}
	sub	ip, fp, #88	@  rDist
	stmia	ip!, {r0, r1, r2, r3}	@  rDist
	ldmia	lr, {r0, r1}
	ldr	r2, .L265+212
	stmia	ip, {r0, r1}	@  rDist
	mov	lr, pc
	bx	r2
	ldr	r3, .L265+28
	smull	ip, r2, r3, r0	@  rDist
	mov	r3, r0, asr #31	@  rDist
	add	r2, r2, r0	@  rDist
	rsb	r3, r3, r2, asr #7
	add	r1, r3, r3, asl #5
	add	r3, r3, r1, asl #2
	rsb	r0, r3, r0	@  rDist
	mov	r3, #26
	str	r0, [fp, #-136]
	strb	r3, [fp, #-128]
	mov	r2, #32
	mov	r3, #2
	mvn	r0, #2	@ movhi
	mov	r1, #60	@ movhi
	strh	r8, [fp, #-126]	@ movhi 	@  i
	strh	r8, [fp, #-122]	@ movhi 	@  i
	strh	r8, [fp, #-118]	@ movhi 	@  i
	str	r6, [fp, #-132]
	strb	r2, [fp, #-127]
	strb	r3, [fp, #-116]
	strb	r5, [fp, #-115]
	strh	r0, [fp, #-124]	@ movhi 
	strh	r1, [fp, #-120]	@ movhi 
	sub	lr, fp, #136
	ldmia	lr!, {r0, r1, r2, r3}
	sub	ip, fp, #112	@  rDist
	stmia	ip!, {r0, r1, r2, r3}	@  rDist
	ldmia	lr, {r0, r1}
	mov	r3, #110
	mov	r2, #304
	stmia	ip, {r0, r1}	@  rDist
	add	r2, r2, r5
	mov	r1, r8	@  i,  i
	str	r3, [fp, #-148]	@  enemy2Timer
	ldr	r3, .L265+32
	str	r2, [fp, #-144]	@  enemy1Timer
	mov	r8, r5	@  i,  i
	mov	r2, r1	@  i,  i
.L32:
	ldr	ip, .L265+32
	mov	r0, #4	@ movhi
	str	r1, [r2, ip]	@  i,  <variable>.row
	strh	r0, [r3, #14]	@ movhi 	@  <variable>.currentFrame
	mov	ip, #36	@ movhi
	mov	r0, #3	@ movhi
	subs	r8, r8, #1	@  i,  i
	str	r1, [r3, #4]	@  i,  <variable>.col
	strb	r1, [r3, #8]	@  i,  <variable>.height
	strb	r1, [r3, #9]	@  i,  <variable>.width
	strh	r1, [r3, #10]	@ movhi 	@  i,  <variable>.shape
	strh	r1, [r3, #12]	@ movhi 	@  i,  <variable>.size
	strh	ip, [r3, #16]	@ movhi 	@  <variable>.nextFrame
	strh	r0, [r3, #18]	@ movhi 	@  <variable>.timer
	strb	r1, [r3, #20]	@  i,  <variable>.active
	add	r2, r2, #24	@  i,  i
	add	r3, r3, #24
	bpl	.L32
	ldr	r3, .L265+36
	ldrb	r2, [r3, #0]	@ zero_extendqisi2	@  maxProjs
	sub	sp, sp, r2, asl #4
	ldr	r2, .L265+208
	mov	r3, #8
	mov	ip, #1
	strb	r1, [r2, #0]	@  i,  activeProjs
	str	r3, [fp, #-160]	@  projTimer
	str	sp, [fp, #-156]
	str	ip, [fp, #-164]	@  canFireProj
	mov	r8, r1	@  i,  i
	mov	r0, r1	@  i,  i
	mov	lr, #3
	mov	ip, #7
.L37:
	ldr	r1, [fp, #-156]
	add	r3, r1, r8, asl #4	@  i
	str	r0, [r1, r8, asl #4]	@  i,  <variable>.row
	add	r8, r8, #1	@  i,  i
	add	r2, r3, #8
	add	r1, r3, #12
	cmp	r8, #3	@  i
	strh	r0, [r2, #2]	@ movhi 	@  i,  <variable>.rdel
	strh	r0, [r3, #12]	@ movhi 	@  i,  <variable>.cdel
	strb	r0, [r1, #3]	@  i,  <variable>.active
	str	r0, [r3, #4]	@  i,  <variable>.col
	strb	lr, [r3, #8]	@  <variable>.height
	strb	ip, [r2, #1]	@  <variable>.width
	strb	r0, [r1, #2]	@  i,  <variable>.isMissile
	ble	.L37
	ldr	r3, .L265+40
	ldrb	r2, [r3, #0]	@ zero_extendqisi2	@  maxMissiles
	sub	sp, sp, r2, asl #4
	ldr	r2, .L265+204
	mov	r3, #1
	mov	ip, #60
	strb	r0, [r2, #0]	@  i,  activeMissiles
	str	r3, [fp, #-176]	@  canFireMiss
	str	sp, [fp, #-168]
	str	ip, [fp, #-172]	@  missileTimer
	mov	r8, r0	@  i,  i
	mov	ip, #4	@  i
	mov	lr, #7
	mov	r4, r3	@  canFireMiss
.L42:
	ldr	r1, [fp, #-168]
	add	r3, r1, r8, asl #4	@  i
	str	r0, [r1, r8, asl #4]	@  i,  <variable>.row
	add	r8, r8, #1	@  i,  i
	add	r2, r3, #8
	add	r1, r3, #12
	cmp	r8, #1	@  i
	strh	r0, [r2, #2]	@ movhi 	@  i,  <variable>.rdel
	strh	r0, [r3, #12]	@ movhi 	@  i,  <variable>.cdel
	strb	r0, [r1, #3]	@  i,  <variable>.active
	str	r0, [r3, #4]	@  i,  <variable>.col
	strb	ip, [r3, #8]	@  i,  <variable>.height
	strb	lr, [r2, #1]	@  <variable>.width
	strb	r4, [r1, #2]	@  canFireMiss,  <variable>.isMissile
	ble	.L42
	ldr	r7, .L265+44
	mov	r8, r0	@  i,  i
.L47:
	mov	r3, r8, asl #3	@  i
	add	r8, r8, #1	@  i,  i
	mov	r2, #512	@ movhi
	cmp	r8, #127	@  i
	strh	r2, [r3, r7]	@ movhi 	@  <variable>.attr0
	ble	.L47
	ldrh	r0, [fp, #-108]	@  enemy2.col
	ldrh	r3, [fp, #-60]	@  ship.col
	ldrh	r2, [fp, #-54]	@  ship.currentFrame
	orr	r0, r0, #32768
	ldrh	r1, [fp, #-84]	@  enemy.col
	mvn	ip, #31232
	orr	r3, r3, #32768
	sub	ip, ip, #127
	strh	r0, [r7, #18]	@ movhi 	@  <variable>.attr1
	ldrh	r0, [fp, #-112]	@ movhi	@  enemy2.row
	orr	r2, r2, #21504
	orr	r1, r1, #32768
	strh	r3, [r7, #2]	@ movhi 	@  <variable>.attr1
	strh	ip, [r7, #20]	@ movhi 	@  <variable>.attr2
	ldrh	r3, [fp, #-64]	@ movhi	@  ship.row
	mov	ip, #25856	@ movhi
	strh	r2, [r7, #4]	@ movhi 	@  <variable>.attr2
	strh	r1, [r7, #10]	@ movhi 	@  <variable>.attr1
	mov	r2, #29696
	strh	ip, [r7, #12]	@ movhi 	@  <variable>.attr2
	strh	r0, [r7, #16]	@ movhi 	@  <variable>.attr0
	strh	r3, [r7, #0]	@ movhi 	@  <variable>.attr0
	add	r2, r2, #5
	mov	r3, r7
	mov	r8, #3	@  i
.L52:
	subs	r8, r8, #1	@  i,  i
	strh	r2, [r3, #44]	@ movhi 	@  <variable>.attr2
	add	r3, r3, #8
	bpl	.L52
	mov	r2, #29696
	add	r2, r2, #6
	mov	r3, r7
	mov	r8, #1	@  i
.L57:
	subs	r8, r8, #1	@  i,  i
	strh	r2, [r3, #76]	@ movhi 	@  <variable>.attr2
	add	r3, r3, #8
	bpl	.L57
	ldr	r1, .L265+32
	ldrh	r3, [r1, #14]	@  <variable>.currentFrame
	ldrh	r2, [r1, #38]	@  <variable>.currentFrame
	orr	r3, r3, #29696
	orr	r2, r2, #29696
	strh	r3, [r7, #28]	@ movhi 	@  <variable>.attr2
	strh	r2, [r7, #36]	@ movhi 	@  <variable>.attr2
	ldr	r2, .L265+212
	mov	lr, pc
	bx	r2
	add	r3, r0, r0, lsr #31	@  rDist,  rDist
	bic	r3, r3, #1
	rsb	r0, r3, r0	@  rDist
	ldr	r3, .L265+48
	strb	r0, [r3, #0]	@  currentBkrnd
	ldr	r3, .L265+192
	mov	lr, pc
	bx	r3
	mov	r1, #30
	mov	r2, #1
	ldr	ip, .L265+52
	mov	r3, #0
	ldr	r0, .L265+56
	mov	lr, pc
	bx	ip
	ldr	r0, .L265+60
	ldr	r3, .L265+64
	mov	lr, pc
	bx	r3
	mov	r0, #0
	mov	r1, #55
	ldr	r2, .L265+68
	mov	r3, #255
	ldr	ip, .L265+224
	mov	lr, pc
	bx	ip
.L246:
	mov	r1, #67108864
	ldr	r3, [r1, #304]
	ldr	r0, .L265+72
	mvn	r3, r3
	ldr	r2, [r0, #0]	@  buttons
	str	r3, [r0, #0]	@  buttons
	ldr	r3, .L265+76
	ands	r4, r2, #4	@  paused
	str	r2, [r3, #0]	@  lastButtons
	bne	.L61
	ldr	r3, [r1, #304]
	mvn	r3, r3
	tst	r3, #4
	beq	.L61
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2	@  ship.active
	cmp	r3, #0
	beq	.L61
	ldr	ip, [fp, #-140]	@  paused
	cmp	ip, #0
	beq	.L62
	mov	r0, #69632
	add	r0, r0, #368
	ldr	r3, .L265+80
	mov	lr, pc
	bx	r3
	mov	r0, #9
	mov	r1, #12
	mov	r2, #6
	ldr	r3, .L265+140
	mov	lr, pc
	bx	r3
	mov	r2, #256
	mov	r3, #128	@ movhi
	add	r2, r2, #67108866
	strh	r3, [r2, #0]	@ movhi 
	ldr	r3, .L265+228
	mov	r0, #1
	strb	r0, [r3, #0]	@  playingA
	mov	r1, #260
	ldr	r3, .L265+232
	add	r1, r1, #67108866
	mov	ip, #128	@ movhi
	strh	ip, [r1, #0]	@ movhi 
	str	r4, [fp, #-140]	@  paused,  paused
	strb	r0, [r3, #0]	@  playingB
.L242:
	mov	r2, #67108864
	ldr	r3, [r2, #304]
	mvn	r3, r3
	tst	r3, #32
	beq	.L65
	ldr	r3, [fp, #-60]	@  ship.col
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [fp, #-60]	@  ship.col
	ldrlt	r3, [fp, #-140]	@  paused
	strlt	r3, [fp, #-60]	@  ship.col
.L65:
	mov	ip, #67108864
	ldr	r3, [ip, #304]
	mvn	r3, r3
	tst	r3, #16
	beq	.L67
	ldr	r3, [fp, #-60]	@  ship.col
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2	@  ship.width
	add	r3, r3, #2
	rsb	r2, r2, #240
	cmp	r3, r2
	str	r3, [fp, #-60]	@  ship.col
	strgt	r2, [fp, #-60]	@  ship.col
.L67:
	mov	r0, #67108864
	ldr	r3, [r0, #304]
	mvn	r3, r3
	tst	r3, #64
	beq	.L69
	ldr	r3, [fp, #-64]	@  ship.row
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [fp, #-64]	@  ship.row
	movlt	r3, #0
	strlt	r3, [fp, #-64]	@  ship.row
.L69:
	mov	r1, #67108864
	ldr	r3, [r1, #304]
	mvn	r3, r3
	tst	r3, #128
	beq	.L71
	ldr	r3, [fp, #-64]	@  ship.row
	ldrb	r2, [fp, #-56]	@ zero_extendqisi2	@  ship.height
	add	r3, r3, #2
	rsb	r2, r2, #160
	cmp	r3, r2
	str	r3, [fp, #-64]	@  ship.row
	strgt	r2, [fp, #-64]	@  ship.row
.L71:
	ldr	r2, [fp, #-160]	@  projTimer
	ldr	ip, [fp, #-172]	@  missileTimer
	cmp	r2, #0
	subgt	r2, r2, #1
	movle	r3, #1
	strgt	r2, [fp, #-160]	@  projTimer
	strle	r3, [fp, #-164]	@  canFireProj
	cmp	ip, #0
	subgt	ip, ip, #1
	strgt	ip, [fp, #-172]	@  missileTimer
	ble	.L75
.L76:
	mov	ip, #67108864
	ldr	r3, [ip, #304]
	mvn	r3, r3
	tst	r3, #1
	beq	.L77
	ldrb	r3, [fp, #-52]	@ zero_extendqisi2	@  ship.active
	cmp	r3, #0
	beq	.L77
	ldr	r0, [fp, #-164]	@  canFireProj
	cmp	r0, #0
	beq	.L78
	ldr	r1, .L265+208
	ldrb	r3, [r1, #0]	@ zero_extendqisi2	@  activeProjs
	cmp	r3, #3
	bhi	.L78
	ldr	r2, [fp, #-156]
	mov	r8, #0	@  i
	add	r3, r2, #12
	mov	r4, r2	@  rDist
.L84:
	ldrb	r5, [r3, #3]	@ zero_extendqisi2	@  canFireProj,  <variable>.active
	cmp	r5, #0	@  canFireProj
	beq	.L243
	add	r8, r8, #1	@  i,  i
	cmp	r8, #3	@  i
	add	r4, r4, #16	@  rDist,  rDist
	add	r3, r3, #16
	ble	.L84
.L78:
	ldr	r3, [fp, #-176]	@  canFireMiss
	cmp	r3, #0
	beq	.L85
	ldr	ip, .L265+204
	ldrb	r3, [ip, #0]	@ zero_extendqisi2	@  activeMissiles
	cmp	r3, #1
	bhi	.L85
	ldr	r0, [fp, #-168]
	mov	r8, #0	@  i
	add	r3, r0, #12
.L91:
	ldrb	ip, [r3, #3]	@ zero_extendqisi2	@  canFireMiss,  <variable>.active
	cmp	ip, #0	@  canFireMiss
	beq	.L244
	add	r8, r8, #1	@  i,  i
	cmp	r8, #1	@  i
	add	r0, r0, #16	@  rDist,  rDist
	add	r3, r3, #16
	ble	.L91
.L85:
	ldr	r3, .L265+228
	ldrb	r2, [r3, #0]	@ zero_extendqisi2	@  playingA
	cmp	r2, #0
	beq	.L249
.L77:
	ldr	r1, .L265+76
	ldr	r3, [r1, #0]	@  lastButtons
	tst	r3, #512
	bne	.L93
	mov	r2, #67108864
	ldr	r3, [r2, #304]
	mvn	r3, r3
	tst	r3, #512
	bne	.L250
.L93:
	ldrsh	r3, [fp, #-54]	@  ship.currentFrame
	ldr	r1, [fp, #-144]	@  enemy1Timer
	cmp	r3, #0
	moveq	ip, #128	@ movhi
	movne	r0, #0	@ movhi
	streqh	ip, [fp, #-54]	@ movhi 	@  ship.currentFrame
	strneh	r0, [fp, #-54]	@ movhi 	@  ship.currentFrame
	cmp	r1, #0
	subgt	r3, r1, #1
	movgt	r3, r3, asl #16
	ldrle	r3, .L265+184
	ldrb	r4, [fp, #-67]	@ zero_extendqisi2	@  enemy.active
	movgt	r3, r3, asr #16
	movle	r2, #1
	strgt	r3, [fp, #-144]	@  enemy1Timer
	strleb	r2, [r3, #0]	@  canSpawnE1
	cmp	r4, #0
	beq	.L98
	ldrh	r3, [fp, #-74]	@  enemy.vdist
	ldrh	lr, [fp, #-78]	@  enemy.rdel
	add	r3, r3, lr
	strh	r3, [fp, #-74]	@ movhi 	@  enemy.vdist
	ldrh	r1, [fp, #-74]	@  enemy.vdist
	ldrsh	ip, [fp, #-78]	@  enemy.rdel
	ldr	r2, [fp, #-84]	@  enemy.col
	ldr	r3, [fp, #-88]	@  enemy.row
	add	r1, r1, #50
	ldrsh	r0, [fp, #-76]	@  enemy.cdel
	mov	r1, r1, asl #16
	cmp	r1, #6553600
	add	r2, r2, r0
	add	r3, r3, ip
	str	r2, [fp, #-84]	@  enemy.col
	str	r3, [fp, #-88]	@  enemy.row
	movhi	r2, #0	@ movhi
	mvnhi	r3, lr
	strhih	r3, [fp, #-78]	@ movhi 	@  enemy.rdel
	strhih	r2, [fp, #-74]	@ movhi 	@  enemy.vdist
	ldr	r3, [fp, #-84]	@  enemy.col
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2	@  enemy.width
	cmn	r3, r2
	movmi	r3, #0
	strmib	r3, [fp, #-67]	@  enemy.active
.L101:
	ldr	ip, [fp, #-148]	@  enemy2Timer
	cmp	ip, #0
	subgt	r3, ip, #1
	movgt	r3, r3, asl #16
	ldrle	r3, .L265+180
	ldrb	r4, [fp, #-91]	@ zero_extendqisi2	@  enemy2.active
	movgt	r3, r3, asr #16
	movle	r2, #1
	strgt	r3, [fp, #-148]	@  enemy2Timer
	strleb	r2, [r3, #0]	@  canSpawnE2
	cmp	r4, #0
	beq	.L105
	ldrsh	r3, [fp, #-100]	@  enemy2.cdel
	ldr	r2, [fp, #-108]	@  enemy2.col
	ldrb	r1, [fp, #-103]	@ zero_extendqisi2	@  enemy2.width
	add	r2, r2, r3
	cmn	r2, r1
	movmi	r3, #0
	str	r2, [fp, #-108]	@  enemy2.col
	strmib	r3, [fp, #-91]	@  enemy2.active
.L107:
	ldr	r4, [fp, #-156]	@  rDist
	mov	r8, #3	@  i
.L115:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	beq	.L111
	ldrsh	r3, [r4, #12]	@  <variable>.cdel
	ldr	r2, [r4, #4]	@  <variable>.col
	add	r2, r2, r3
	add	r3, r2, r3
	cmp	r3, #239
	mov	r0, r4	@  rDist
	str	r2, [r4, #4]	@  <variable>.col
	bgt	.L251
.L111:
	subs	r8, r8, #1	@  i,  i
	add	r4, r4, #16	@  rDist,  rDist
	bpl	.L115
	ldr	r6, [fp, #-168]	@  rDist
	mov	r8, #0	@  i
.L132:
	ldrb	r3, [r6, #15]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	beq	.L118
	ldrb	r3, [fp, #-67]	@ zero_extendqisi2	@  enemy.active
	cmp	r3, #0
	ldrne	r2, [fp, #-84]	@  enemy.col
	ldrneb	r3, [fp, #-79]	@ zero_extendqisi2	@  enemy.width
	ldrne	r1, [r6, #4]	@  <variable>.col
	addne	r2, r2, r3, lsr #1
	ldrb	r3, [fp, #-91]	@ zero_extendqisi2	@  enemy2.active
	moveq	r0, #8960	@  cDist1
	rsbne	r0, r1, r2	@  cDist1
	addeq	r0, r0, #40	@  cDist1,  cDist1
	cmp	r3, #0
	ldrneb	r3, [fp, #-103]	@ zero_extendqisi2	@  enemy2.width
	ldrne	r2, [fp, #-108]	@  enemy2.col
	ldrne	r1, [r6, #4]	@  <variable>.col
	addne	r2, r2, r3, lsr #1
	moveq	r2, #8960	@  cDist2
	rsbne	r2, r1, r2	@  cDist2
	addeq	r2, r2, #40	@  cDist2,  cDist2
	cmp	r0, r2	@  cDist1,  cDist2
	mov	ip, #0	@  cDist
	sublt	r3, fp, #88	@  nearestE
	movlt	ip, r0	@  cDist,  cDist1
	blt	.L126
	movgt	ip, r2	@  cDist,  cDist2
	subgt	r3, fp, #112	@  nearestE
	movle	r3, #0	@  nearestE
.L126:
	cmp	r3, #0	@  nearestE
	streqh	r3, [r6, #10]	@ movhi 	@  nearestE,  <variable>.rdel
	beq	.L130
	ldr	r4, [r3, #0]	@  <variable>.row
	ldrb	r3, [r3, #8]	@ zero_extendqisi2	@  <variable>.height
	ldr	r2, [r6, #0]	@  <variable>.row
	add	r4, r4, r3, lsr #1
	rsb	r4, r2, r4	@  rDist
	mul	r3, r4, r4	@  rDist,  rDist
	mla	r0, ip, ip, r3	@  rDist,  cDist,  cDist
	ldr	r3, .L265+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L265+88
	mov	lr, pc
	bx	r3
	ldr	r2, .L265+92
	mov	lr, pc
	bx	r2
	ldr	r3, .L265+96
	mov	r1, r0	@  length
	mov	r0, #1073741824
	mov	lr, pc
	bx	r3
	ldr	r3, .L265+100
	mov	r5, r0	@  scale
	mov	r0, r4	@  rDist
	mov	lr, pc
	bx	r3
	mov	r1, r5	@  scale
	ldr	r3, .L265+104
	mov	lr, pc
	bx	r3
	ldr	r3, .L265+108
	mov	lr, pc
	bx	r3
	strh	r0, [r6, #10]	@ movhi 	@  rDist,  <variable>.rdel
.L130:
	ldrsh	r2, [r6, #12]	@  <variable>.cdel
	ldr	r1, [r6, #4]	@  <variable>.col
	ldr	r3, [r6, #0]	@  <variable>.row
	add	r1, r1, r2
	ldrsh	r0, [r6, #10]	@  <variable>.rdel
	add	r2, r1, r2
	add	r3, r3, r0
	cmp	r2, #239
	str	r3, [r6, #0]	@  <variable>.row
	str	r1, [r6, #4]	@  <variable>.col
	bgt	.L252
.L118:
	add	r8, r8, #1	@  i,  i
	cmp	r8, #1	@  i
	add	r6, r6, #16	@  rDist,  rDist
	ble	.L132
	ldr	r5, .L265+172
	ldr	r6, .L265+112
	ldr	r4, [fp, #-156]	@  rDist
	mov	r8, #0	@  i
.L140:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	add	r8, r8, #1	@  i,  i
	beq	.L135
	ldrb	r3, [fp, #-67]	@ zero_extendqisi2	@  enemy.active
	cmp	r3, #0
	sub	r1, fp, #88
	mov	r0, r4	@  rDist
	bne	.L253
.L138:
	ldrb	r3, [fp, #-91]	@ zero_extendqisi2	@  enemy2.active
	cmp	r3, #0
	mov	r0, r4	@  rDist
	sub	r1, fp, #112
	bne	.L254
.L135:
	cmp	r8, #3	@  i
	add	r4, r4, #16	@  rDist,  rDist
	ble	.L140
	ldr	r5, .L265+172
	ldr	r6, .L265+112
	ldr	r4, [fp, #-168]	@  rDist
	mov	r8, #0	@  i
.L148:
	ldrb	r3, [r4, #15]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	add	r8, r8, #1	@  i,  i
	beq	.L143
	ldrb	r3, [fp, #-67]	@ zero_extendqisi2	@  enemy.active
	cmp	r3, #0
	sub	r1, fp, #88
	mov	r0, r4	@  rDist
	bne	.L255
.L146:
	ldrb	r3, [fp, #-91]	@ zero_extendqisi2	@  enemy2.active
	cmp	r3, #0
	mov	r0, r4	@  rDist
	sub	r1, fp, #112
	bne	.L256
.L143:
	cmp	r8, #1	@  i
	add	r4, r4, #16	@  rDist,  rDist
	ble	.L148
	ldrb	r1, [fp, #-52]	@ zero_extendqisi2	@  ship.active
	cmp	r1, #0
	beq	.L247
	ldrb	r3, [fp, #-67]	@ zero_extendqisi2	@  enemy.active
	cmp	r3, #0
	bne	.L257
.L151:
	ldrb	r3, [fp, #-91]	@ zero_extendqisi2	@  enemy2.active
	cmp	r3, #0
	bne	.L258
.L241:
	ldrb	r1, [fp, #-52]	@ zero_extendqisi2	@  ship.active
.L149:
	cmp	r1, #0
	beq	.L247
	mov	r0, #0
	mov	r1, #57
	mov	r2, #4
	ldr	r3, .L265+140
	mov	lr, pc
	bx	r3
	ldr	r3, .L265
	sub	r4, fp, #48	@  rDist
	ldr	r2, [r3, #0]	@  rDist,  score
	ldr	r1, .L265+148
	ldr	r3, .L265+152
	mov	r0, r4	@  rDist
	mov	lr, pc
	bx	r3
	mov	r1, #57
	mov	r2, r4	@  rDist
	mov	r0, #0
	mov	r3, #255
	ldr	ip, .L265+224
	mov	lr, pc
	bx	ip
	ldrb	r1, [fp, #-52]	@ zero_extendqisi2	@  ship.active
.L153:
	ldr	r0, .L265+116
	ldr	ip, .L265+120
	ldr	r3, [r0, #0]	@  bkrndHoff
	ldr	r2, [ip, #0]	@  cloudsHoff
	cmp	r1, #0
	add	r3, r3, #1
	add	r2, r2, #2
	str	r3, [r0, #0]	@  bkrndHoff
	str	r2, [ip, #0]	@  cloudsHoff
	ldrneh	r3, [fp, #-60]	@  ship.col
	ldrneh	r2, [fp, #-54]	@  ship.currentFrame
	ldrneh	r0, [fp, #-64]	@ movhi	@  ship.row
	orrne	r3, r3, #32768
	orrne	r2, r2, #21504
	moveq	r1, #512	@ movhi
	strneh	r3, [r7, #2]	@ movhi 	@  <variable>.attr1
	strneh	r2, [r7, #4]	@ movhi 	@  <variable>.attr2
	strneh	r0, [r7, #0]	@ movhi 	@  <variable>.attr0
	streqh	r1, [r7, #0]	@ movhi 	@  <variable>.attr0
	ldrb	r3, [fp, #-67]	@ zero_extendqisi2	@  enemy.active
	cmp	r3, #0
	moveq	r3, #512	@ movhi
	streqh	r3, [r7, #8]	@ movhi 	@  <variable>.attr0
	beq	.L159
	ldrh	r3, [fp, #-84]	@  enemy.col
	ldrb	r1, [fp, #-88]	@ zero_extendqisi2	@  enemy.row
	bic	r3, r3, #65024
	orr	r3, r3, #32768
	ldrsh	r2, [fp, #-70]	@  enemy.flashTimer
	strh	r1, [r7, #8]	@ movhi 	@  <variable>.attr0
	strh	r3, [r7, #10]	@ movhi 	@  <variable>.attr1
	cmp	r2, #0
	ldrh	r3, [fp, #-70]	@  enemy.flashTimer
	ldrle	r3, .L265+44
	subgt	r3, r3, #1
	movle	r2, #25856	@ movhi
	strgth	r3, [fp, #-70]	@ movhi 	@  enemy.flashTimer
	strleh	r2, [r3, #12]	@ movhi 	@  <variable>.attr2
.L159:
	ldrb	r3, [fp, #-91]	@ zero_extendqisi2	@  enemy2.active
	cmp	r3, #0
	moveq	ip, #512	@ movhi
	streqh	ip, [r7, #16]	@ movhi 	@  <variable>.attr0
	beq	.L163
	ldrh	r3, [fp, #-108]	@  enemy2.col
	ldrb	r1, [fp, #-112]	@ zero_extendqisi2	@  enemy2.row
	bic	r3, r3, #65024
	orr	r3, r3, #32768
	ldrsh	r2, [fp, #-94]	@  enemy2.flashTimer
	strh	r1, [r7, #16]	@ movhi 	@  <variable>.attr0
	strh	r3, [r7, #18]	@ movhi 	@  <variable>.attr1
	cmp	r2, #0
	ldrh	r3, [fp, #-94]	@  enemy2.flashTimer
	mvnle	r2, #31232
	ldrle	r3, .L265+44
	subgt	r3, r3, #1
	suble	r2, r2, #127
	strgth	r3, [fp, #-94]	@ movhi 	@  enemy2.flashTimer
	strleh	r2, [r3, #20]	@ movhi 	@  <variable>.attr2
.L163:
	ldr	r1, [fp, #-156]	@  rDist
	mov	r8, #0	@  i
	mov	r0, r7
.L170:
	ldrb	r3, [r1, #15]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	ldrne	ip, [fp, #-156]
	mov	r2, r8, asl #4	@  i
	ldrneh	r3, [r1, #4]	@  <variable>.col
	ldrneb	r2, [r2, ip]	@ zero_extendqisi2	@  <variable>.row
	bicne	r3, r3, #65024
	moveq	r2, #512	@ movhi
	add	r8, r8, #1	@  i,  i
	strneh	r2, [r0, #40]	@ movhi 	@  <variable>.attr0
	strneh	r3, [r0, #42]	@ movhi 	@  <variable>.attr1
	streqh	r2, [r0, #40]	@ movhi 	@  <variable>.attr0
	cmp	r8, #3	@  i
	add	r1, r1, #16	@  rDist,  rDist
	add	r0, r0, #8
	ble	.L170
	ldr	r1, [fp, #-168]	@  rDist
	mov	r8, #0	@  i
	mov	r0, r7
.L177:
	ldrb	r3, [r1, #15]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	ldrne	ip, [fp, #-168]
	mov	r2, r8, asl #4	@  i
	ldrneh	r3, [r1, #4]	@  <variable>.col
	ldrneb	r2, [r2, ip]	@ zero_extendqisi2	@  <variable>.row
	bicne	r3, r3, #65024
	moveq	r2, #512	@ movhi
	add	r8, r8, #1	@  i,  i
	strneh	r2, [r0, #72]	@ movhi 	@  <variable>.attr0
	strneh	r3, [r0, #74]	@ movhi 	@  <variable>.attr1
	streqh	r2, [r0, #72]	@ movhi 	@  <variable>.attr0
	cmp	r8, #1	@  i
	add	r1, r1, #16	@  rDist,  rDist
	add	r0, r0, #8
	ble	.L177
	ldr	r3, .L265+32
	mov	r9, #0	@  i
	add	sl, r3, #12
	mov	r4, r3
	mov	r6, r7
	mov	r8, #1	@  i
.L198:
	ldrb	r3, [r4, #20]	@ zero_extendqisi2	@  <variable>.active
	cmp	r3, #0
	beq	.L180
	ldrsh	r3, [sl, #2]	@  <variable>.currentFrame
	cmn	r3, #1
	moveq	r3, #0
	moveq	ip, #512	@ movhi
	streqb	r3, [r4, #20]	@  <variable>.active
	streqh	ip, [r6, #24]	@ movhi 	@  <variable>.attr0
	beq	.L180
	cmp	r3, #4
	beq	.L259
	cmp	r3, #36
	beq	.L260
	cmp	r3, #100
	beq	.L261
	cmp	r3, #228
	beq	.L262
	cmp	r3, #356
	beq	.L263
	cmp	r3, #580
	beq	.L264
.L186:
	ldr	r2, .L265+32
	add	ip, r4, #8
	ldrb	r0, [ip, #1]	@ zero_extendqisi2	@  <variable>.width
	ldrb	r1, [r4, #8]	@ zero_extendqisi2	@  <variable>.height
	ldrh	r3, [r9, r2]	@  <variable>.row
	ldrh	r2, [r4, #4]	@  <variable>.col
	sub	r3, r3, r1, lsr #1
	sub	r2, r2, r0, lsr #1
	ldrh	r1, [ip, #2]	@  <variable>.shape
	ldrh	r0, [r4, #12]	@  <variable>.size
	ldrh	ip, [sl, #2]	@  <variable>.currentFrame
	add	r3, r3, #24
	add	r2, r2, #24
	and	r3, r3, #255
	bic	r2, r2, #65024
	add	r5, r4, #16
	orr	ip, ip, #29696
	orr	r1, r1, r3
	orr	r0, r0, r2
	ldrsh	lr, [r5, #2]	@  <variable>.timer
	strh	r1, [r6, #24]	@ movhi 	@  <variable>.attr0
	strh	r0, [r6, #26]	@ movhi 	@  <variable>.attr1
	strh	ip, [r6, #28]	@ movhi 	@  <variable>.attr2
	cmp	lr, #0
	ldrh	r3, [r5, #2]	@  <variable>.timer
	ldrleh	ip, [r4, #16]	@ movhi	@  <variable>.nextFrame
	subgt	r3, r3, #1
	movle	r3, #3	@ movhi
	strgth	r3, [r5, #2]	@ movhi 	@  <variable>.timer
	strleh	r3, [r5, #2]	@ movhi 	@  <variable>.timer
	strleh	ip, [sl, #2]	@ movhi 	@  <variable>.currentFrame
.L180:
	subs	r8, r8, #1	@  i,  i
	add	r6, r6, #8
	add	r9, r9, #24	@  i,  i
	add	r4, r4, #24
	add	sl, sl, #24
	bpl	.L198
	ldr	r3, .L265+124
	mov	lr, pc
	bx	r3
	ldr	r0, .L265+116
	ldr	r1, .L265+120
	ldrh	r2, [r0, #0]	@  bkrndHoff
	ldrh	r3, [r1, #0]	@  cloudsHoff
	mov	ip, #67108864
	strh	r2, [ip, #16]	@ movhi 
	strh	r3, [ip, #20]	@ movhi 
	mov	r8, #0	@  i
.L203:
	mov	r3, r8, asl #3	@  i
	add	r2, r3, r7
	add	r8, r8, #1	@  i,  i
	ldmia	r2, {r0-r1}	@  shadowOAM
	add	r3, r3, #117440512
	cmp	r8, #127	@  i
	stmia	r3, {r0-r1}
	ble	.L203
	b	.L246
.L264:
	mov	r2, #48
	mov	r3, #49152
	strb	r2, [r4, #9]	@  <variable>.width
	strb	r2, [r4, #8]	@  <variable>.height
	mvn	r2, #0	@ movhi
	strh	r3, [r4, #12]	@ movhi 	@  <variable>.size
	strh	r2, [r4, #16]	@ movhi 	@  <variable>.nextFrame
	b	.L186
.L263:
	mov	r2, #40
	mov	r3, #49152
	strh	r3, [r4, #12]	@ movhi 	@  <variable>.size
	strb	r2, [r4, #9]	@  <variable>.width
	strb	r2, [r4, #8]	@  <variable>.height
	mov	r1, #580	@ movhi
.L248:
	strh	r1, [r4, #16]	@ movhi 	@  <variable>.nextFrame
	b	.L186
.L262:
	mov	r2, #32
	mov	r3, #32768
	mov	r0, #356	@ movhi
	strh	r3, [r4, #12]	@ movhi 	@  <variable>.size
	strb	r2, [r4, #9]	@  <variable>.width
	strb	r2, [r4, #8]	@  <variable>.height
	strh	r0, [r4, #16]	@ movhi 	@  <variable>.nextFrame
	b	.L186
.L261:
	mov	r2, #21
	mov	r3, #32768
	mov	ip, #228	@ movhi
	strh	r3, [r4, #12]	@ movhi 	@  <variable>.size
	strb	r2, [r4, #9]	@  <variable>.width
	strb	r2, [r4, #8]	@  <variable>.height
	strh	ip, [r4, #16]	@ movhi 	@  <variable>.nextFrame
	b	.L186
.L260:
	mov	r3, #15
	strb	r3, [r4, #9]	@  <variable>.width
	mov	r2, #16384	@ movhi
	strb	r3, [r4, #8]	@  <variable>.height
	mov	r3, #100	@ movhi
	strh	r2, [r4, #12]	@ movhi 	@  <variable>.size
	strh	r3, [r4, #16]	@ movhi 	@  <variable>.nextFrame
	b	.L186
.L259:
	mov	r3, #7
	mov	r0, #0	@ movhi
	mov	r1, #36	@ movhi
	strb	r3, [r4, #9]	@  <variable>.width
	strh	r0, [r4, #12]	@ movhi 	@  <variable>.size
	strb	r3, [r4, #8]	@  <variable>.height
	b	.L248
.L247:
	mov	r2, #67108864
	ldr	r3, [r2, #304]
	mvn	r3, r3
	tst	r3, #8
	beq	.L153
	ldr	r2, .L265+128
	ldr	r3, .L265+132
	str	r2, [r3, #0]	@  gameState
	ldr	sp, [fp, #-152]
	ldmea	fp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
	bx	lr
.L266:
	.align	2
.L265:
	.word	score
	.word	stopSound1
	.word	stopSound2
	.word	fontdata_6x8
	.word	img_spritesheetTiles
	.word	img_spritesheetPal
	.word	-1840700269
	.word	-161464935
	.word	expls
	.word	maxProjs
	.word	maxMissiles
	.word	shadowOAM
	.word	currentBkrnd
	.word	setBackground
	.word	bgClouds
	.word	bkrndSnd
	.word	playLoop
	.word	.LC0
	.word	buttons
	.word	lastButtons
	.word	delay
	.word	__floatsidf
	.word	sqrt
	.word	__truncdfsf2
	.word	__divsf3
	.word	__floatsisf
	.word	__mulsf3
	.word	__fixsfsi
	.word	projHitEnemy
	.word	bkrndHoff
	.word	cloudsHoff
	.word	waitForVblank
	.word	splashScreen
	.word	gameState
	.word	.LC2
	.word	eraseString0
	.word	score
	.word	.LC3
	.word	sprintf
	.word	strlen
	.word	.LC4
	.word	stopSound2
	.word	createExpl
	.word	areColliding
	.word	resetProj
	.word	canSpawnE2
	.word	canSpawnE1
	.word	resetEnemy
	.word	switchBackground
	.word	synthSnd
	.word	playSound
	.word	activeMissiles
	.word	activeProjs
	.word	rand
	.word	__modsi3
	.word	.LC1
	.word	drawString0
	.word	playingA
	.word	playingB
.L258:
	sub	r0, fp, #64
	sub	r1, fp, #112
	ldr	r3, .L265+172
	mov	lr, pc
	bx	r3
	tst	r0, #255	@  rDist
	beq	.L241
.L150:
	ldr	ip, .L265+224
	mov	r3, #255
	mov	r0, #8
	mov	r1, #10
	ldr	r2, .L265+136
	mov	lr, pc
	bx	ip
	mov	r0, #0
	mov	r1, #51
	mov	r2, #10
	ldr	r3, .L265+140
	mov	lr, pc
	bx	r3
	ldr	r0, .L265+144
	sub	r5, fp, #48	@  rDist
	ldr	r2, [r0, #0]	@  rDist,  score
	ldr	r1, .L265+148
	ldr	r3, .L265+152
	mov	r0, r5	@  rDist
	mov	lr, pc
	bx	r3
	ldr	r3, .L265+156
	mov	r0, r5	@  rDist
	mov	lr, pc
	bx	r3
	add	r4, r0, #13	@  rDist
	mov	r4, r4, lsr #1
	and	r4, r4, #255	@  offset
	rsb	r1, r4, #15	@  length,  offset
	mov	r0, #10
	ldr	r2, .L265+160
	mov	r3, #255
	ldr	ip, .L265+224
	rsb	r4, r4, #28	@  length,  offset
	mov	lr, pc
	bx	ip
	mov	r1, r4	@  length
	mov	r2, r5	@  rDist
	mov	r3, #255
	ldr	ip, .L265+224
	mov	r0, #10
	mov	lr, pc
	bx	ip
	ldr	r0, .L265+164
	mov	lr, pc
	bx	r0
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2	@  ship.height
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2	@  ship.width
	sub	r0, fp, #64
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r0, r0, r3, lsr #1	@  rDist
	add	r1, r1, r2, lsr #1	@  length
	ldr	r3, .L265+168
	mov	r2, #1
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r1, r2
	strb	r2, [fp, #-52]	@  ship.active
	b	.L149
.L257:
	sub	r0, fp, #64
	sub	r1, fp, #88
	ldr	r3, .L265+172
	mov	lr, pc
	bx	r3
	tst	r0, #255	@  rDist
	bne	.L150
	b	.L151
.L256:
	mov	lr, pc
	bx	r5
	mov	r3, r0	@  rDist
	tst	r3, #255	@  rDist
	mov	r0, r4	@  rDist
	sub	r1, fp, #112
	beq	.L143
	mov	lr, pc
	bx	r6
	b	.L143
.L255:
	mov	lr, pc
	bx	r5
	mov	r3, r0	@  rDist
	tst	r3, #255	@  rDist
	mov	r0, r4	@  rDist
	sub	r1, fp, #88
	beq	.L146
	mov	lr, pc
	bx	r6
	b	.L146
.L254:
	mov	lr, pc
	bx	r5
	mov	r3, r0	@  rDist
	tst	r3, #255	@  rDist
	mov	r0, r4	@  rDist
	sub	r1, fp, #112
	beq	.L135
	mov	lr, pc
	bx	r6
	b	.L135
.L253:
	mov	lr, pc
	bx	r5
	mov	r3, r0	@  rDist
	tst	r3, #255	@  rDist
	mov	r0, r4	@  rDist
	sub	r1, fp, #88
	beq	.L138
	mov	lr, pc
	bx	r6
	b	.L138
.L252:
	mov	r0, r6	@  rDist
	ldr	r3, .L265+176
	mov	lr, pc
	bx	r3
	b	.L118
.L251:
	ldr	r3, .L265+176
	mov	lr, pc
	bx	r3
	b	.L111
.L105:
	ldr	r5, .L265+180
	ldrb	r3, [r5, #0]	@ zero_extendqisi2	@  canSpawnE2
	cmp	r3, #0
	beq	.L107
	sub	r0, fp, #112
	ldr	r3, .L265+188
	mov	lr, pc
	bx	r3
	mov	r0, #110
	strb	r4, [r5, #0]	@  canSpawnE2
	str	r0, [fp, #-148]	@  enemy2Timer
	b	.L107
.L98:
	ldr	r5, .L265+184
	ldrb	r3, [r5, #0]	@ zero_extendqisi2	@  canSpawnE1
	cmp	r3, #0
	beq	.L101
	ldr	r3, .L265+188
	sub	r0, fp, #88
	mov	lr, pc
	bx	r3
	mov	r3, #304
	add	r3, r3, #1
	strb	r4, [r5, #0]	@  canSpawnE1
	str	r3, [fp, #-144]	@  enemy1Timer
	b	.L101
.L250:
	ldr	r3, .L265+192
	mov	lr, pc
	bx	r3
	b	.L93
.L249:
	ldr	r0, .L265+196
	ldr	r3, .L265+200
	mov	lr, pc
	bx	r3
	b	.L77
.L244:
	mov	r2, #1
	strb	r2, [r3, #3]	@  <variable>.active
	ldr	r1, .L265+204
	ldrb	r3, [r1, #0]	@ zero_extendqisi2	@  activeMissiles
	add	r3, r3, r2
	strb	r3, [r1, #0]	@  activeMissiles
	ldrb	r2, [fp, #-56]	@ zero_extendqisi2	@  ship.height
	ldr	r3, [fp, #-64]	@  ship.row
	ldrb	r1, [r0, #8]	@ zero_extendqisi2	@  <variable>.height
	add	r3, r3, r2, lsr #1
	ldr	r2, [fp, #-168]
	sub	r3, r3, r1, lsr #1
	str	r3, [r2, r8, asl #4]	@  <variable>.row
	ldr	r3, [fp, #-60]	@  ship.col
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2	@  ship.width
	mov	r1, #60
	add	r3, r3, r2
	mov	r2, #2	@ movhi
	str	ip, [fp, #-176]	@  canFireMiss,  canFireMiss
	str	r1, [fp, #-172]	@  missileTimer
	str	r3, [r0, #4]	@  <variable>.col
	strh	ip, [r0, #10]	@ movhi 	@  canFireMiss,  <variable>.rdel
	strh	r2, [r0, #12]	@ movhi 	@  <variable>.cdel
	b	.L85
.L243:
	mov	r2, #1
	strb	r2, [r3, #3]	@  <variable>.active
	ldr	r0, .L265+208
	ldrb	r3, [r0, #0]	@ zero_extendqisi2	@  activeProjs
	add	r3, r3, r2
	strb	r3, [r0, #0]	@  activeProjs
	ldr	r1, .L265+212
	mov	lr, pc
	bx	r1
	ldrb	r1, [fp, #-56]	@ zero_extendqisi2	@  ship.height
	ldrb	r3, [r4, #8]	@ zero_extendqisi2	@  <variable>.height
	rsb	r1, r3, r1	@  length
	ldr	r3, .L265+216
	mov	lr, pc
	bx	r3
	ldr	r3, [fp, #-64]	@  ship.row
	ldr	r2, [fp, #-156]
	add	r3, r3, r0	@  rDist
	str	r3, [r2, r8, asl #4]	@  <variable>.row
	ldr	r3, [fp, #-60]	@  ship.col
	ldrb	r2, [fp, #-55]	@ zero_extendqisi2	@  ship.width
	mov	ip, #8
	add	r3, r3, r2
	mov	r0, #4	@ movhi
	str	r5, [fp, #-164]	@  canFireProj,  canFireProj
	str	ip, [fp, #-160]	@  projTimer
	str	r3, [r4, #4]	@  <variable>.col
	strh	r0, [r4, #12]	@ movhi 	@  <variable>.cdel
	b	.L78
.L75:
	mov	r3, #1
	str	r3, [fp, #-176]	@  canFireMiss
	b	.L76
.L62:
	mov	r0, #9
	mov	r1, #12
	ldr	r2, .L265+220
	mov	r3, #255
	ldr	ip, .L265+224
	mov	lr, pc
	bx	ip
	ldr	r3, .L265+228
	mov	r2, #256
	add	r2, r2, #67108866
	strh	r4, [r2, #0]	@ movhi 	@  paused
	mov	r1, #260
	strb	r4, [r3, #0]	@  paused,  playingA
	ldr	r3, .L265+232
	add	r1, r1, #67108866
	mov	r0, #1
	strh	r4, [r1, #0]	@ movhi 	@  paused
	str	r0, [fp, #-140]	@  paused
	strb	r4, [r3, #0]	@  paused,  playingB
.L61:
	ldr	r1, [fp, #-140]	@  paused
	cmp	r1, #0
	bne	.L246
	b	.L242
	.size	startGame, .-startGame
	.align	2
	.global	areColliding
	.type	areColliding, %function
areColliding:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldrb	r3, [r0, #8]	@ zero_extendqisi2	@  <variable>.height
	ldr	lr, [r0, #0]	@  <variable>.row
	ldr	ip, [r1, #0]	@  <variable>.row
	add	r3, lr, r3
	cmp	r3, ip
	ldr	r2, .L272
	ldr	r3, .L272+4
	mov	r4, #0	@  objPtr1
	str	r0, [r3, #0]	@  objPtr1,  obj1
	str	r1, [r2, #0]	@  objPtr2,  obj2
	blt	.L267
	ldrb	r3, [r1, #8]	@ zero_extendqisi2	@  <variable>.height
	add	r3, ip, r3
	cmp	lr, r3
	mov	r4, #0	@  objPtr1
	bgt	.L267
	ldr	ip, [r0, #4]	@  <variable>.col
	ldrb	r3, [r0, #9]	@ zero_extendqisi2	@  <variable>.width
	ldr	r2, [r1, #4]	@  <variable>.col
	add	r3, ip, r3
	cmp	r3, r2
	mov	r4, #0	@  objPtr1
	blt	.L267
	ldrb	r3, [r1, #9]	@ zero_extendqisi2	@  <variable>.width
	add	r3, r2, r3
	cmp	ip, r3
	movgt	r4, #0	@  objPtr1
	movle	r4, #1	@  objPtr1
.L267:
	mov	r0, r4	@  objPtr1
	ldmfd	sp!, {r4, lr}
	bx	lr
.L273:
	.align	2
.L272:
	.word	obj2
	.word	obj1
	.size	areColliding, .-areColliding
	.align	2
	.global	resetEnemy
	.type	resetEnemy, %function
resetEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	ldrb	r3, [r0, #20]	@ zero_extendqisi2	@  <variable>.enemyType
	mov	r2, #1
	cmp	r3, #1
	sub	fp, ip, #4
	mov	r4, r0	@  enemy
	strb	r2, [r0, #21]	@  <variable>.active
	beq	.L278
	mov	r3, #60	@ movhi
	strh	r3, [r0, #16]	@ movhi 	@  <variable>.health
	ldr	r0, .L279
	mov	lr, pc
	bx	r0
	ldrb	r1, [r4, #8]	@ zero_extendqisi2	@  <variable>.height
	ldr	r3, .L279+4
	rsb	r1, r1, #159
	mov	lr, pc
	bx	r3
.L277:
	mov	r2, #0	@ movhi
	mov	r3, #239
	str	r0, [r4, #0]	@  enemy,  <variable>.row
	strh	r2, [r4, #18]	@ movhi 	@  <variable>.flashTimer
	str	r3, [r4, #4]	@  <variable>.col
	ldmea	fp, {r4, fp, sp, lr}
	bx	lr
.L278:
	ldrh	r3, [r0, #10]	@  <variable>.rdel
	mov	r2, #0	@ movhi
	mvn	r3, r3
	strh	r2, [r0, #14]	@ movhi 	@  <variable>.vdist
	mov	r2, #160	@ movhi
	strh	r2, [r0, #16]	@ movhi 	@  <variable>.health
	strh	r3, [r0, #10]	@ movhi 	@  <variable>.rdel
	ldr	r0, .L279
	mov	lr, pc
	bx	r0
	ldrb	r1, [r4, #8]	@ zero_extendqisi2	@  <variable>.height
	ldr	r3, .L279+4
	rsb	r1, r1, #55
	mov	lr, pc
	bx	r3
	add	r0, r0, #50	@  enemy
	b	.L277
.L280:
	.align	2
.L279:
	.word	rand
	.word	__modsi3
	.size	resetEnemy, .-resetEnemy
	.align	2
	.global	resetProj
	.type	resetProj, %function
resetProj:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #14]	@ zero_extendqisi2	@  <variable>.isMissile
	mov	r2, #0
	strb	r2, [r0, #15]	@  <variable>.active
	ldr	ip, .L284
	ldr	r1, .L284+4
	cmp	r3, #0
	ldrneb	r3, [r1, #0]	@ zero_extendqisi2	@  activeMissiles
	ldreqb	r3, [ip, #0]	@ zero_extendqisi2	@  activeProjs
	subne	r3, r3, #1
	subeq	r3, r3, #1
	@ lr needed for prologue
	strneb	r3, [r1, #0]	@  activeMissiles
	streqb	r3, [ip, #0]	@  activeProjs
	bx	lr
.L285:
	.align	2
.L284:
	.word	activeProjs
	.word	activeMissiles
	.size	resetProj, .-resetProj
	.align	2
	.global	projHitEnemy
	.type	projHitEnemy, %function
projHitEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	mov	r4, r0	@  proj
	sub	fp, ip, #4
	mov	r5, r1	@  enemy
	bl	resetProj
	ldrb	r3, [r4, #14]	@ zero_extendqisi2	@  <variable>.isMissile
	cmp	r3, #0
	ldrneh	r3, [r5, #16]	@  <variable>.health
	ldreqh	r3, [r5, #16]	@  <variable>.health
	subne	r3, r3, #50
	subeq	r3, r3, #30
	strh	r3, [r5, #16]	@ movhi 	@  <variable>.health
	ldrb	r3, [r5, #20]	@ zero_extendqisi2	@  <variable>.enemyType
	cmp	r3, #1
	mov	r2, #5	@ movhi
	ldreq	r3, .L299
	ldrne	r3, .L299
	strh	r2, [r5, #18]	@ movhi 	@  <variable>.flashTimer
	moveq	r2, #1280	@ movhi
	movne	r2, #1408	@ movhi
	streqh	r2, [r3, #12]	@ movhi 	@  <variable>.attr2
	strneh	r2, [r3, #20]	@ movhi 	@  <variable>.attr2
	ldrsh	r3, [r5, #16]	@  <variable>.health
	cmp	r3, #0
	ble	.L296
.L286:
	ldmea	fp, {r4, r5, fp, sp, lr}
	bx	lr
.L296:
	ldrb	r1, [r5, #20]	@ zero_extendqisi2	@  <variable>.enemyType
	cmp	r1, #1
	beq	.L297
.L292:
	cmp	r1, #2
	beq	.L298
.L293:
	ldrb	r2, [r5, #8]	@ zero_extendqisi2	@  <variable>.height
	ldrb	r3, [r5, #9]	@ zero_extendqisi2	@  <variable>.width
	ldmia	r5, {r0, r1}	@ phole ldm
	add	r0, r0, r2, lsr #1	@  proj
	add	r1, r1, r3, lsr #1	@  enemy
	mov	r2, #0
	ldr	r3, .L299+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	strb	r2, [r5, #21]	@  <variable>.active
	b	.L286
.L298:
	ldr	r1, .L299+8
	ldr	r2, [r1, #0]	@  score
	mov	r3, #9984
	add	r2, r2, #5
	add	r3, r3, #15
	cmp	r2, r3
	strls	r2, [r1, #0]	@  score
	b	.L293
.L297:
	ldr	r0, .L299+8
	ldr	r2, [r0, #0]	@  score
	mov	r3, #9984
	add	r2, r2, #10
	add	r3, r3, #15
	cmp	r2, r3
	strls	r2, [r0, #0]	@  score
	bls	.L293
	b	.L292
.L300:
	.align	2
.L299:
	.word	shadowOAM
	.word	createExpl
	.word	score
	.size	projHitEnemy, .-projHitEnemy
	.align	2
	.global	createExpl
	.type	createExpl, %function
createExpl:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	tst	r2, #255
	stmfd	sp!, {r4, r5, fp, ip, lr, pc}
	ldr	r3, .L308
	sub	fp, ip, #4
	mov	r5, r0	@  row
	ldr	r0, .L308+4
	ldreq	r0, .L308+8
	mov	r4, r1	@  col
	mov	lr, pc
	bx	r3
	ldr	r2, .L308+12
	ldrb	r3, [r2, #0]	@ zero_extendqisi2	@  currentExpl
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	strb	r3, [r2, #0]	@  currentExpl
	ldrb	r3, [r2, #0]	@ zero_extendqisi2	@  currentExpl
	ldr	r0, .L308+16
	add	r3, r3, r3, asl #1
	mov	r3, r3, asl #3
	sub	ip, r5, #24	@  row
	add	r1, r3, r0
	str	ip, [r3, r0]	@  <variable>.row
	mov	r3, #0	@ movhi
	sub	lr, r4, #24	@  col
	mov	r2, #1
	strh	r3, [r1, #12]	@ movhi 	@  <variable>.size
	mov	r3, #4	@ movhi
	strb	r2, [r1, #20]	@  <variable>.active
	str	lr, [r1, #4]	@  <variable>.col
	strh	r3, [r1, #14]	@ movhi 	@  <variable>.currentFrame
	ldmea	fp, {r4, r5, fp, sp, lr}
	bx	lr
.L309:
	.align	2
.L308:
	.word	playSound
	.word	longExplSnd
	.word	explSnd
	.word	currentExpl
	.word	expls
	.size	createExpl, .-createExpl
	.align	2
	.global	switchBackground
	.type	switchBackground, %function
switchBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	ldr	r4, .L314
	sub	fp, ip, #4
	ldrb	ip, [r4, #0]	@ zero_extendqisi2	@  currentBkrnd
	mov	r2, #0
	cmp	ip, r2
	ldr	r0, .L314+4
	mov	r1, #28
	mov	r3, #1
	bne	.L311
	mov	r2, ip
	ldr	ip, .L314+8
	mov	lr, pc
	bx	ip
	mov	r3, #1
.L313:
	strb	r3, [r4, #0]	@  currentBkrnd
	ldmea	fp, {r4, fp, sp, lr}
	bx	lr
.L311:
	mov	r3, #1
	ldr	r0, .L314+12
	mov	r1, #28
	ldr	ip, .L314+8
	mov	lr, pc
	bx	ip
	mov	r3, #0
	b	.L313
.L315:
	.align	2
.L314:
	.word	currentBkrnd
	.word	bg2
	.word	setBackground
	.word	bg1
	.size	switchBackground, .-switchBackground
	.align	2
	.global	playLoop
	.type	playLoop, %function
playLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	mov	r1, #260
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	r1, r1, #67108866
	mov	r5, #0
	add	lr, ip, #200
	strh	r5, [r1, #0]	@ movhi 
	str	r5, [lr, #8]	@  <variable>.cnt
	ldrh	r4, [r0, #12]	@  <variable>.timerInterval
	add	r3, ip, #260
	strh	r4, [r3, #0]	@ movhi 
	mov	r3, #128	@ movhi
	strh	r3, [r1, #0]	@ movhi 
	ldr	r7, [r0, #0]	@  <variable>.soundData
	ldr	r3, .L317
	mov	r2, #-1241513984
	add	r2, r2, #4194304
	add	r6, ip, #164
	str	r7, [ip, #200]	@  <variable>.src
	str	r0, [r3, #0]	@  sound,  soundB
	str	r6, [lr, #4]	@  <variable>.dst
	ldr	r3, .L317+4
	str	r2, [lr, #8]	@  <variable>.cnt
	ldr	r2, .L317+8
	mov	r1, #1
	strb	r1, [r3, #0]	@  playingB
	str	r5, [r2, #0]	@  chanBCount
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L318:
	.align	2
.L317:
	.word	soundB
	.word	playingB
	.word	chanBCount
	.size	playLoop, .-playLoop
	.align	2
	.global	playSound
	.type	playSound, %function
playSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	mov	ip, #67108864
	ldr	r8, .L320
	ldr	sl, .L320+4
	mov	r1, #256
	mov	lr, #0
	add	r4, ip, #188
	add	r1, r1, #67108866
	strh	lr, [r1, #0]	@ movhi 
	str	lr, [r4, #8]	@  <variable>.cnt
	strb	lr, [r8, #0]	@  playingA
	str	lr, [sl, #0]	@  chanACount
	ldrh	r5, [r0, #12]	@  <variable>.timerInterval
	add	r3, ip, #256
	strh	r5, [r3, #0]	@ movhi 
	mov	r3, #128	@ movhi
	strh	r3, [r1, #0]	@ movhi 
	ldr	r3, .L320+8
	ldr	r7, [r0, #0]	@  <variable>.soundData
	mov	r2, #-1241513984
	add	r6, ip, #160
	add	r2, r2, #4194304
	str	r0, [r3, #0]	@  sound,  soundA
	mov	r3, #1
	str	r7, [ip, #188]	@  <variable>.src
	str	r6, [r4, #4]	@  <variable>.dst
	str	r2, [r4, #8]	@  <variable>.cnt
	strb	r3, [r8, #0]	@  playingA
	str	lr, [sl, #0]	@  chanACount
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L321:
	.align	2
.L320:
	.word	playingA
	.word	chanACount
	.word	soundA
	.size	playSound, .-playSound
	.align	2
	.global	setBackground
	.type	setBackground, %function
setBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	lr, r0	@  bg
	ldr	r0, [r0, #12]	@  <variable>.tileLen
	mov	r2, r2, asl #14	@  cbbNum
	mov	r0, r0, asr #1
	mov	r4, #67108864
	ldr	ip, [lr, #0]	@  <variable>.tileData
	add	r4, r4, #212
	add	r2, r2, #100663296
	orr	r0, r0, #-2147483648
	mov	r5, #67108864
	str	ip, [r5, #212]	@  <variable>.src
	str	r2, [r4, #4]	@  <variable>.dst
	str	r0, [r4, #8]	@  <variable>.cnt
	ldr	r2, [lr, #16]	@  <variable>.mapLen
	mov	r1, r1, asl #11	@  sbbNum
	mov	r2, r2, asr #1
	ldr	r0, [lr, #4]	@  <variable>.mapData
	add	r1, r1, #100663296
	orr	r2, r2, #-2147483648
	tst	r3, #255
	str	r0, [r5, #212]	@  <variable>.src
	str	r1, [r4, #4]	@  <variable>.dst
	str	r2, [r4, #8]	@  <variable>.cnt
	beq	.L322
	ldr	r3, [lr, #20]	@  <variable>.palLen
	ldr	r1, [lr, #8]	@  <variable>.palData
	mov	r3, r3, asr #1
	orr	r3, r3, #-2147483648
	mov	r2, #83886080
	str	r1, [r5, #212]	@  <variable>.src
	str	r2, [r4, #4]	@  <variable>.dst
	str	r3, [r4, #8]	@  <variable>.cnt
.L322:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
	.size	setBackground, .-setBackground
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	ldr	r3, .L325
	mov	r2, #50331648
	stmfd	sp!, {r4, fp, ip, lr, pc}
	add	r2, r2, #32512
	mov	r4, #67108864
	add	r4, r4, #520
	str	r3, [r2, #252]
	mov	r3, #0	@ movhi
	strh	r3, [r4, #0]	@ movhi 
	sub	fp, ip, #4
	ldr	r3, .L325+4
	mov	lr, pc
	bx	r3
	mov	r3, #1	@ movhi
	strh	r3, [r4, #0]	@ movhi 
	ldmea	fp, {r4, fp, sp, lr}
	bx	lr
.L326:
	.align	2
.L325:
	.word	interruptHandler
	.word	enableVBlankInterrupt
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	enableVBlankInterrupt
	.type	enableVBlankInterrupt, %function
enableVBlankInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	add	r0, r1, #512
	ldrh	r2, [r1, #4]
	ldrh	r3, [r0, #0]
	orr	r2, r2, #8
	orr	r3, r3, #1
	strh	r3, [r0, #0]	@ movhi 
	@ lr needed for prologue
	strh	r2, [r1, #4]	@ movhi 
	bx	lr
	.size	enableVBlankInterrupt, .-enableVBlankInterrupt
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	mov	r3, #67108864
	add	r3, r3, #520
	mov	r1, #0	@ movhi
	mov	r2, #512
	strh	r1, [r3, #0]	@ movhi 
	add	r2, r2, #67108866
	ldrh	r3, [r2, #0]
	cmp	r3, #1
	sub	fp, ip, #4
	ldr	r0, .L336
	beq	.L334
.L329:
	mov	r3, #512
	add	r3, r3, #67108866
	ldrh	r1, [r3, #0]
	mov	r2, #67108864
	strh	r1, [r3, #0]	@ movhi 
	add	r2, r2, #520
	mov	r3, #1	@ movhi
	strh	r3, [r2, #0]	@ movhi 
	ldmea	fp, {r4, fp, sp, lr}
	bx	lr
.L334:
	ldr	r3, .L336+4
	ldr	r2, [r0, #0]	@  vblankcount
	ldrb	r1, [r3, #0]	@ zero_extendqisi2	@  playingA
	add	r2, r2, #1
	cmp	r1, #0
	ldr	r4, .L336+8
	ldr	ip, .L336+12
	str	r2, [r0, #0]	@  vblankcount
	beq	.L330
	ldr	r3, .L336+16
	ldr	r1, [r3, #0]	@  soundA
	ldr	r2, [ip, #0]	@  chanACount
	ldr	r3, [r1, #4]	@  <variable>.length
	add	r2, r2, #1
	cmp	r2, r3
	str	r2, [ip, #0]	@  chanACount
	bge	.L335
.L330:
	ldr	r3, .L336+20
	ldrb	r2, [r3, #0]	@ zero_extendqisi2	@  playingB
	cmp	r2, #0
	ldr	r0, .L336+24
	beq	.L329
	ldr	r3, [r4, #0]	@  soundB
	ldr	r2, [r0, #0]	@  chanBCount
	ldr	r1, [r3, #4]	@  <variable>.length
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r0, #0]	@  chanBCount
	blt	.L329
	ldr	r3, .L336+28
	mov	lr, pc
	bx	r3
	ldr	r0, [r4, #0]	@  soundB
	bl	playLoop
	b	.L329
.L335:
	ldr	r3, .L336+32
	mov	lr, pc
	bx	r3
	b	.L330
.L337:
	.align	2
.L336:
	.word	vblankcount
	.word	playingA
	.word	soundB
	.word	chanACount
	.word	soundA
	.word	playingB
	.word	chanBCount
	.word	stopSound2
	.word	stopSound1
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	stopSound1
	.type	stopSound1, %function
stopSound1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #256
	mov	r1, #0
	add	r3, r3, #67108866
	strh	r1, [r3, #0]	@ movhi 
	mov	r2, #67108864
	ldr	r3, .L339
	add	r2, r2, #188
	str	r1, [r2, #8]	@  <variable>.cnt
	@ lr needed for prologue
	strb	r1, [r3, #0]	@  playingA
	bx	lr
.L340:
	.align	2
.L339:
	.word	playingA
	.size	stopSound1, .-stopSound1
	.align	2
	.global	stopSound2
	.type	stopSound2, %function
stopSound2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #260
	mov	r1, #0
	add	r3, r3, #67108866
	strh	r1, [r3, #0]	@ movhi 
	mov	r2, #67108864
	ldr	r3, .L342
	add	r2, r2, #200
	str	r1, [r2, #8]	@  <variable>.cnt
	@ lr needed for prologue
	strb	r1, [r3, #0]	@  playingB
	bx	lr
.L343:
	.align	2
.L342:
	.word	playingB
	.size	stopSound2, .-stopSound2
	.comm	lastButtons, 4, 32
	.comm	buttons, 4, 32
	.comm	soundA, 4, 32
	.comm	soundB, 4, 32
	.comm	bkrndHoff, 4, 32
	.comm	cloudsHoff, 4, 32
	.comm	obj1, 4, 32
	.comm	obj2, 4, 32
	.comm	canSpawnE1, 1, 8
	.comm	canSpawnE2, 1, 8
	.comm	activeProjs, 1, 8
	.comm	activeMissiles, 1, 8
	.comm	expls, 48, 32
	.comm	currentBkrnd, 1, 8
	.comm	shadowOAM, 1024, 32
	.comm	score, 4, 32
	.comm	gameState, 4, 32
	.ident	"GCC: (GNU) 3.3.2"
