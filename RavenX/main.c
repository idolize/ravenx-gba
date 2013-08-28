// Written by Robert David Idol with only provided materials

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "myLib.h"
#include "text.h"
#include "img_spritesheet.h"
#include "img_splash.h"
#include "background1.h"
#include "background2.h"
#include "bgClouds.h"
#include "s_background.h"
#include "s_longexpl.h"
#include "s_ravenx.h"
#include "s_explosion.h"
#include "s_synth.h"

#define SPRITEOFFSET16(r,c) (r)*32+(c)
#define SPRITEOFFSET256(r,c) (r)*16+(c)

#define MASKCOL (0x1FF)
#define MASKROW (0xFF)

// sound / interrupts
typedef struct {
	const u8 *soundData;
	int length; // length in vblanks: (VBLANKFREQ*SOUND_LEN/SOUND_FREQ)
	int freq;
	int timerInterval; // freq: (-((1<<24)/SOUND_FREQ)
} Sound;

Sound bkrndSnd = {s_background, VBLANKFREQ*S_BACKGROUNDLEN/S_BACKGROUNDFREQ, S_BACKGROUNDFREQ, -((1<<24)/S_BACKGROUNDFREQ)};
Sound explSnd = {s_explosion, VBLANKFREQ*S_EXPLOSIONLEN/S_EXPLOSIONFREQ, S_EXPLOSIONFREQ, -((1<<24)/S_EXPLOSIONFREQ)};
Sound longExplSnd = {s_longexpl, VBLANKFREQ*S_LONGEXPLLEN/S_LONGEXPLFREQ, S_LONGEXPLFREQ, -((1<<24)/S_LONGEXPLFREQ)};
Sound synthSnd = {s_synth, VBLANKFREQ*S_SYNTHLEN/S_SYNTHFREQ, S_SYNTHFREQ, -((1<<24)/S_SYNTHFREQ)};
Sound introSnd = {s_ravenx, VBLANKFREQ*S_RAVENXLEN/S_RAVENXFREQ, S_RAVENXFREQ, -((1<<24)/S_RAVENXFREQ)};

int vblankcount = 0;
int chanACount = 0;
bool playingA = FALSE;
int chanBCount = 0;
bool playingB = FALSE;
Sound* soundA;
Sound* soundB;

// background
typedef struct {
	const u16 *tileData;
	const u16 *mapData;
	const u16 *palData;
	int tileLen;
	int mapLen;
	int palLen;
} Background;

Background bg1 = {background1Tiles, background1Map, background1Pal, background1TilesLen, background1MapLen, background1PalLen};
Background bg2 = {background2Tiles, background2Map, background2Pal, background2TilesLen, background2MapLen, background2PalLen};
Background bgClouds = {bgCloudsTiles, bgCloudsMap, bgCloudsPal, bgCloudsTilesLen, bgCloudsMapLen, bgCloudsPalLen};

int bkrndHoff;
int cloudsHoff;

// object variables
typedef struct {
	int row;
	int col;
	u8 height;
	u8 width;
} BaseObj;

BaseObj* obj1;
BaseObj* obj2;

// ship
typedef struct {
	int row;
	int col;
	u8 height;
	u8 width;
	short currentFrame; // used for animation
	bool active;
} Ship;

const u8 shipPal = 5;
const u16 shipFrame1 = SPRITEOFFSET16(0,0); // top left spot in the sprite sheet of first frame
const u16 shipFrame2 = SPRITEOFFSET16(4,0); // top left spot in the sprite sheet of second frame
const u16 shipShape = ATTR0_SQUARE; // MUST COME FROM GBA SPECS
const u16 shipSize = ATTR1_SIZE32; // MUST COME FROM GBA SPECS
const u8 shipSpeed = 2; // constant (no accel) speed of ship

// enemy
typedef struct {
	int row;
	int col;
	u8 height;
	u8 width;
	short rdel; // vertical speed
	short cdel; // horizontal speed
	short vdist; // distance moved
	short health;
	short flashTimer; // used for the "flash" effect
	u8 enemyType;
	bool active;
} Enemy;

const u8 enemy1Pal = 6;
const u8 enemy2Pal = 8;
const u8 enemyHitPal = 0;
const u16 enemy1Image = SPRITEOFFSET16(8,0); // top left spot in the sprite sheet
const u16 enemy2Image = SPRITEOFFSET16(12,0); // top left spot in the sprite sheet
const u16 enemy1Shape = ATTR0_SQUARE; // MUST COME FROM GBA SPECS
const u16 enemy2Shape = ATTR0_SQUARE; // MUST COME FROM GBA SPECS
const u16 enemy1Size = ATTR1_SIZE32; // MUST COME FROM GBA SPECS
const u16 enemy2Size =  ATTR1_SIZE32; // MUST COME FROM GBA SPECS
const u8 enemy1Health = 160;
const u8 enemy2Health = 60;
const u8 enemy1Pts = 10;
const u8 enemy2Pts = 5;
const u32 enemy1Spawn = 305;
const u32 enemy2Spawn = 110;
const u8 flashAmt = 5;
const u8 maxVDist = 50;
bool canSpawnE1, canSpawnE2;

// proj
typedef struct {
	int row;
	int col;
	u8 height;
	u8 width;
	short rdel;
	short cdel;
	bool isMissile;
	bool active; // used for object pool
} Proj;

const u8 projPal = 7;
const u16 projImage = SPRITEOFFSET16(0,5); // top left spot in the sprite sheet
const u16 projShape = ATTR0_SQUARE; // MUST COME FROM GBA SPECS
const u16 projSize = ATTR1_SIZE8; // MUST COME FROM GBA SPECS
const u8 maxProjs = 4;
const u8 projDelay = 8; // delay in frames between shots
const u8 projDamage = 30;
u8 activeProjs;

const u8 missilePal = 7;
const u16 missileImage = SPRITEOFFSET16(0,6); // top left spot in the sprite sheet
const u16 missileShape = ATTR0_SQUARE; // MUST COME FROM GBA SPECS
const u16 missileSize = ATTR1_SIZE8; // MUST COME FROM GBA SPECS
const u8 maxMissiles = 2;
const u8 missDelay = 60;
const u8 missDamage = 50;
u8 activeMissiles;
const u8 homingLvl = 2;
const u8 explDelay = 3;

// explosion
typedef struct {
	int row;
	int col;
	u8 height;
	u8 width;
	u16 shape; // MUST COME FROM GBA SPECS
	u16 size; // MUST COME FROM GBA SPECS
	short currentFrame; // used for animation
	short nextFrame;
	short timer;
	bool active;
} Explosion;

Explosion expls[2];
u8 currentExpl = 0;
const u8 explPal = 7;
const u16 explFrame1 = SPRITEOFFSET16(0,4); // top left spot in the sprite sheet of first frame
const u16 explFrame2 = SPRITEOFFSET16(1,4);
const u16 explFrame3 = SPRITEOFFSET16(3,4);
const u16 explFrame4 = SPRITEOFFSET16(7,4);
const u16 explFrame5 = SPRITEOFFSET16(11,4);
const u16 explFrame6 = SPRITEOFFSET16(18,4);

// other globals
u8 currentBkrnd;
const u8 maxW = 239;
const u8 maxH = 159;
ObjAttr shadowOAM[128]; // OAM shadow to be copied into actual OAM during VBlank
u32 score;
const u8 oamStart = 5;
void (*gameState)(); // function pointer to current game state

// prototypes
void splashScreen();
void startGame();
void setupInterrupts();
void enableVBlankInterrupt();
void interruptHandler();
void setBackground(Background *bg, int sbbNum, int cbbNum, bool usePal);
void resetEnemy(Enemy *enemy);
void createExpl(int row, int col, bool useBigSnd);
bool areColliding(void *objPtr1, void *objPtr2);
void resetProj(Proj *proj);
void projHitEnemy(Proj *proj, Enemy *enemy);
void switchBackground();
void playLoop(Sound *sound);
void playSound(Sound *sound);
void stopSound1();
void stopSound2();

/**
 *  Main Function  *****
 */
int main()
{
	// Enable sound (Master control)
    REG_SOUNDCNT_X = SND_ENABLED;

    // enable and reset Direct Sound channel A, at full volume,
    // using Timer 0 to determine frequency
	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | // Output sound ratio for chan.1-4
                     DSA_OUTPUT_RATIO_100 | // Direct sound A output ratio
					 DSB_OUTPUT_RATIO_100 | // Direct sound B output ratio
                     DSA_OUTPUT_TO_BOTH | // Direct sound A left/right output
                     DSA_TIMER0 | // Direct sound A Sampling rate timer
                     DSA_FIFO_RESET | // Direct sound A FIFO reset
                     DSB_OUTPUT_TO_BOTH | // Direct sound B left/right output
                     DSB_TIMER1 | // Direct sound B Sampling rate timer
                     DSB_FIFO_RESET; // Direct sound B FIFO reset

	// don’t mess with sound channels 1-4
    REG_SOUNDCNT_L = 0;

	// set up interrupts for sound
	setupInterrupts();

	gameState = splashScreen;

	while (TRUE) {
		gameState();
	}

	return 0; // end point: should never reach here
}

/**
 *  Splash Screen  *****
 */
void splashScreen()
{
	// switch to mode 3
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// stop playing all sounds
	stopSound1();
	stopSound2();

	playSound(&introSnd);
	fillPicture3(img_splashBitmap);
	delay(360000); // let the intro sound play before you can start

	int rannum = 0; // random seed

	while(!KEY_DOWN_NOW(BUTTON_START)) {
		rannum++;
	}
	srand(rannum); // seed rand

	fillScreen3(BLACK);

	gameState = startGame;
}

/**
 *  Start Game  *****
 */
void startGame()
{
	int i; // counter
	score = 0;
	char scoreStr[6];
	bool paused = FALSE;

	// stop playing all sounds
	stopSound1();
	stopSound2();

	// set the video mode to mode 0
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG3_ENABLE | OBJ_ENABLE;
	// background 0 control register: user screen block 28 for the tile map and char block 0 for the tile images, in 256 color mode
	REG_BG0CNT = BG_SIZE0 | SBB(28) | CBB(0) | COLOR256 | 3;
	REG_BG0HOFS = 0;
	// background 1 for clouds
	REG_BG1CNT = BG_SIZE0 | SBB(30) | CBB(1) | 2;
	REG_BG1HOFS = 0;
	// background 3 used for the text
	REG_BG3CNT = BG_SIZE0 | SBB(31) | CBB(2) | 0;

	// copy the font into memory
	int imgptr = 0;
	int dataptr = 0;
	int r;
	for(i=0; i<256; i++) {
		for(r=0; r<8; r++) {
			CHARBLOCKBASE[2].tileimg[imgptr++] = 
					fontdata_6x8[dataptr] |
					(fontdata_6x8[dataptr+1]<<4) |
					(fontdata_6x8[dataptr+2]<<8) |
					(fontdata_6x8[dataptr+3]<<12);
					dataptr += 4;
			CHARBLOCKBASE[2].tileimg[imgptr++] = 
					fontdata_6x8[dataptr] |
					(fontdata_6x8[dataptr+1]<<4);
					dataptr += 2;
		}
	}

	// copy the sprites into memory
	DMA[3].src = img_spritesheetTiles;
	DMA[3].dst = &CHARBLOCKBASE[4];
	DMA[3].cnt = img_spritesheetTilesLen >> 1 | DMA_ON;

	// copy the sprite pallete into memory
	DMA[3].src = img_spritesheetPal;
	DMA[3].dst = SPRITEPAL;
	DMA[3].cnt = 256 | DMA_ON;

	// create the ship
	Ship ship = {0, 0, 27, 30, shipFrame1, TRUE};

	// create the enemy
	Enemy enemy = {maxVDist+rand()%(105-27-maxVDist), maxW, 27, 27, 1, -1, 0, enemy1Health, 0, 1, FALSE};
	short enemy1Timer = enemy1Spawn; //wait to spawn

	// create the other enemy type
	Enemy enemy2 = {rand()%(maxH-26), maxW, 26, 32, 0, -3, 0, enemy2Health, 0, 2, TRUE};
	short enemy2Timer = enemy2Spawn;
	
	// create the explosions
	for (i=0; i<2; i++) {
		expls[i].row = 0;
		expls[i].col = 0;
		expls[i].height = 0;
		expls[i].width = 0;
		expls[i].shape = 0;
		expls[i].size = 0;
		expls[i].currentFrame = explFrame1;
		expls[i].nextFrame = explFrame2;
		expls[i].timer = explDelay;
		expls[i].active = FALSE;
	}

	// create the projs
	Proj projs[maxProjs];
	activeProjs = 0;
	int projTimer = projDelay;
	bool canFireProj = TRUE;
	for (i=0; i<maxProjs; i++) {
		projs[i].row = 0;
		projs[i].col = 0;
		projs[i].height = 3;
		projs[i].width = 7;
		projs[i].rdel = 0;
		projs[i].cdel = 0;
		projs[i].isMissile = FALSE;
		projs[i].active = FALSE;
	}

	// create the missiles
	Proj missiles[maxMissiles];
	activeMissiles = 0;
	int missileTimer = missDelay;
	bool canFireMiss = TRUE;
	int cDist, cDist1, cDist2, rDist;
	float length, scale;
	Enemy *nearestE;
	for (i=0; i<maxMissiles; i++) {
		missiles[i].row = 0;
		missiles[i].col = 0;
		missiles[i].height = 4;
		missiles[i].width = 7;
		missiles[i].rdel = 0;
		missiles[i].cdel = 0;
		missiles[i].isMissile = TRUE;
		missiles[i].active = FALSE;
	}

	// hide all the sprites in memory by default
	for (i=0; i<128; i++) {
       shadowOAM[i].attr0 = ATTR0_HIDE;
	}

	// initialize ship
	shadowOAM[0].attr0 = ship.row | shipShape | ATTR0_REG | ATTR0_4BPP;
	shadowOAM[0].attr1 = ship.col | shipSize | ATTR1_NOFLIP;
	shadowOAM[0].attr2 = ship.currentFrame | ATTR2_PRI1 | ATTR2_PALETTE_BANK(shipPal);

	// initialize enemy 1
	//shadowOAM[1].attr0 = enemy.row | enemy1Shape | ATTR0_REG | ATTR0_4BPP;
	shadowOAM[1].attr1 = enemy.col | enemy1Size | ATTR1_NOFLIP;
	shadowOAM[1].attr2 = enemy1Image | ATTR2_PRI1 | ATTR2_PALETTE_BANK(enemy1Pal);

	// initialize enemy 2
	shadowOAM[2].attr0 = enemy2.row | enemy2Shape | ATTR0_REG | ATTR0_4BPP;
	shadowOAM[2].attr1 = enemy2.col | enemy2Size | ATTR1_NOFLIP;
	shadowOAM[2].attr2 = enemy2Image | ATTR2_PRI1 | ATTR2_PALETTE_BANK(enemy2Pal);

	// initialize projs
	for (i=0; i<maxProjs; i++) {
		shadowOAM[i+oamStart].attr2 = projImage | ATTR2_PRI1 | ATTR2_PALETTE_BANK(projPal);
	}

	// initialize missiles
	for (i=0; i<maxMissiles; i++) {
		shadowOAM[i+oamStart+maxProjs].attr2 = missileImage | ATTR2_PRI1 | ATTR2_PALETTE_BANK(missilePal);
	}

	// initialize explosions
	shadowOAM[3].attr2 = expls[0].currentFrame | ATTR2_PRI1 | ATTR2_PALETTE_BANK(explPal);
	shadowOAM[4].attr2 = expls[1].currentFrame | ATTR2_PRI1 | ATTR2_PALETTE_BANK(explPal);

	// initialize backgrounds
	currentBkrnd = rand()%2;
	switchBackground();
	setBackground(&bgClouds, 30, 1, FALSE);

	// play music
	playLoop(&bkrndSnd);

	// score label
	drawString0(0, 55, "S:", 255);

	/**
	 *  Main Game Loop  *****
	 */
	while (TRUE) {
		// check buttons
		lastButtons = buttons;
		buttons = ~(BUTTONS);

		// check if the game should be paused
		if (KEY_PRESSED(BUTTON_SELECT) && ship.active) {
			if (paused) {
				// wait a tiny bit to avoid pausing again by accident
				delay(70000);
				eraseString0(9, 12, 6);
				paused = FALSE;
				// resume sounds
				REG_TM0CNT = TIMER_ON;
				playingA = TRUE;
				REG_TM1CNT = TIMER_ON;
				playingB = TRUE;
			}
			else {
				paused = TRUE;
				drawString0(9, 12, "PAUSED", 255);
				// pause sounds
				REG_TM0CNT = 0;
				playingA = FALSE;
				REG_TM1CNT = 0;
				playingB = FALSE;
			}
		}

		if (!paused) {

		// move the ship
		if (KEY_DOWN_NOW(BUTTON_LEFT)) {
			ship.col -= shipSpeed;
			if (ship.col < 0) ship.col = 0;
		}
		if (KEY_DOWN_NOW(BUTTON_RIGHT)) {
			ship.col += shipSpeed;
			if (ship.col > 240 - ship.width) ship.col = 240 - ship.width;
		}
		if (KEY_DOWN_NOW(BUTTON_UP)) {
			ship.row -= shipSpeed;
			if (ship.row < 0) ship.row = 0;
		}
		if (KEY_DOWN_NOW(BUTTON_DOWN)) {
			ship.row += shipSpeed;
			if (ship.row > 160 - ship.height) ship.row = 160 - ship.height;
		}

		if (projTimer > 0) projTimer--;
		else canFireProj = TRUE;

		if (missileTimer > 0) missileTimer--;
		else canFireMiss = TRUE;

		if (KEY_DOWN_NOW(BUTTON_A) && ship.active) {
			// fire guns
			if (canFireProj && (activeProjs < maxProjs)) {
				// find first inactive proj and use it
				for (i = 0; i < maxProjs; i++) {
					if (!projs[i].active) {
						projs[i].active = TRUE;
						activeProjs++;
						projs[i].row = ship.row + rand()%(ship.height-projs[i].height);
						projs[i].col = ship.col + ship.width;
						projs[i].cdel = 4;
						// reset the timer
						projTimer = projDelay;
						canFireProj = FALSE;
						break;
					}
				}
			}
			if (canFireMiss && (activeMissiles < maxMissiles)) {
				// find first inactive missile and use it
				for (i = 0; i < maxMissiles; i++) {
					if (!missiles[i].active) {
						missiles[i].active = TRUE;
						activeMissiles++;
						missiles[i].row = ship.row + (ship.height >> 1) - (missiles[i].height >> 1);
						missiles[i].col = ship.col + ship.width;
						missiles[i].cdel = 2;
						missiles[i].rdel = 0;
						// reset the timer
						missileTimer = missDelay;
						canFireMiss = FALSE;
						break;
					}
				}
			}
			// play shooting sound
			if (!playingA) playSound(&synthSnd);
		}

		// switch the background
		if (KEY_PRESSED(BUTTON_L)) switchBackground();

		// animate the ship
		if (ship.currentFrame == shipFrame1) ship.currentFrame = shipFrame2;
		else ship.currentFrame = shipFrame1;

		// move the enemy
		if (enemy1Timer > 0) enemy1Timer--;
		else canSpawnE1 = TRUE;

		if (enemy.active) {
			enemy.col += enemy.cdel;
			enemy.row += enemy.rdel;
			enemy.vdist += enemy.rdel;
			if (enemy.vdist < -maxVDist || enemy.vdist > maxVDist) {
				enemy.rdel = ~enemy.rdel;
				enemy.vdist = 0;
			}
			if (enemy.col+enemy.width < 0) {
				enemy.active = FALSE;
			}
		}
		else if (canSpawnE1) {
			resetEnemy(&enemy);
			// reset the timer
			enemy1Timer = enemy1Spawn;
			canSpawnE1 = FALSE;
		}

		// move the enemy2
		if (enemy2Timer > 0) enemy2Timer--;
		else canSpawnE2 = TRUE;

		if (enemy2.active) {
			enemy2.col += enemy2.cdel;
			if (enemy2.col+enemy2.width < 0) {
				enemy2.active = FALSE;
			}
		}
		else if (canSpawnE2) {
			resetEnemy(&enemy2);
			// reset the timer
			enemy2Timer = enemy2Spawn;
			canSpawnE2 = FALSE;
		}

		// move the projs
		for (i=0; i<maxProjs; i++) {
			if (projs[i].active) {
				projs[i].col += projs[i].cdel;

				// check to see if the proj is off-screen
				if (projs[i].col + projs[i].cdel > maxW) {
					resetProj(&projs[i]);
				}
			}
		}

		// move the missiles
		for (i=0; i<maxMissiles; i++) {
			if (missiles[i].active) {
				cDist = 0;

				if (enemy.active) cDist1 = enemy.col+(enemy.width>>1) - missiles[i].col;
				else cDist1 = 9000;

				if (enemy2.active) cDist2 = enemy2.col+(enemy2.width>>1) - missiles[i].col;
				else cDist2 = 9000;

				if (cDist1 < cDist2) {
					nearestE = &enemy; //enemy1 closer
					cDist = cDist1;
				}
				else if (cDist1 > cDist2) {
					nearestE = &enemy2; //enemy2 closer
					cDist = cDist2;
				}
				else nearestE = NULL; // both enemies are not active

				if (nearestE != NULL) {
					rDist = nearestE->row+(nearestE->height>>1) - missiles[i].row;
					length = sqrt((cDist*cDist) + (rDist*rDist));
					scale = homingLvl/length;
					missiles[i].rdel = rDist * scale;
				}
				else missiles[i].rdel = 0;

				missiles[i].col += missiles[i].cdel;
				missiles[i].row += missiles[i].rdel;

				// check to see if the missile is off-screen
				if (missiles[i].col + missiles[i].cdel > maxW) {
					resetProj(&missiles[i]);
				}
			}
		}

		// check collisions
		for (i = 0; i<maxProjs; i++) {
			if (projs[i].active) {
				if (enemy.active && areColliding(&projs[i], &enemy)) {
					//proj hit enemy
					projHitEnemy(&projs[i], &enemy);
				}
				if (enemy2.active && areColliding(&projs[i], &enemy2)) {
					//proj hit enemy2
					projHitEnemy(&projs[i], &enemy2);
				}
			}
		}
		for (i = 0; i<maxMissiles; i++) {
			if (missiles[i].active) {
				if (enemy.active && areColliding(&missiles[i], &enemy)) {
					//missile hit enemy
					projHitEnemy(&missiles[i], &enemy);
				}
				if (enemy2.active && areColliding(&missiles[i], &enemy2)) {
					//missile hit enemy2
					projHitEnemy(&missiles[i], &enemy2);
				}
			}
		}
		if (ship.active && ((enemy.active && areColliding(&ship, &enemy)) || (enemy2.active && areColliding(&ship, &enemy2)))) {
			// game lost
			drawString0(8, 10, "GAME OVER", 255);
			eraseString0(0, 51, 10); // erase score in top-right
			sprintf(scoreStr, "%d", score);
			u8 offset = (strlen(scoreStr)+13)>>1; // calculate center no matter how many digits in score
			drawString0(10, 15-offset, "Final Score:", 255);
			drawString0(10, 15-offset+13, scoreStr, 255);
			// stop looping sound
			stopSound2();
			// create an explosion with a big sound
			createExpl((ship.row+(ship.height>>1)), (ship.col+(ship.width>>1)), TRUE);
			// remove the ship
			ship.active = FALSE;
		}

		if (!ship.active && KEY_DOWN_NOW(BUTTON_START)) {
			gameState = splashScreen;
			break;
		}

		// update score
		if (ship.active) {
			eraseString0(0, 57, 4);
			sprintf(scoreStr, "%d", score);
			drawString0(0, 57, scoreStr, 255);
		}

		// animate the backgrounds
		bkrndHoff++;
		cloudsHoff+=2;

		// render the ship with final data
		if (ship.active) {
			shadowOAM[0].attr0 = ship.row | shipShape | ATTR0_REG | ATTR0_4BPP;
			shadowOAM[0].attr1 = ship.col | shipSize | ATTR1_NOFLIP;
			shadowOAM[0].attr2 = ship.currentFrame | ATTR2_PRI1 | ATTR2_PALETTE_BANK(shipPal);
		}
		else shadowOAM[0].attr0 = ATTR0_HIDE;

		// render enemy with final data
		if (enemy.active) {
			shadowOAM[1].attr0 = (enemy.row & MASKROW) | enemy1Shape | ATTR0_REG | ATTR0_4BPP;
			shadowOAM[1].attr1 = (enemy.col & MASKCOL) | enemy1Size | ATTR1_NOFLIP;
			if (enemy.flashTimer > 0) enemy.flashTimer--;
			else shadowOAM[1].attr2 = enemy1Image | ATTR2_PRI1 | ATTR2_PALETTE_BANK(enemy1Pal);
		}
		else shadowOAM[1].attr0 = ATTR0_HIDE;

		// render enemy2 with final data
		if (enemy2.active) {
			shadowOAM[2].attr0 = (enemy2.row & MASKROW) | enemy2Shape | ATTR0_REG | ATTR0_4BPP;
			shadowOAM[2].attr1 = (enemy2.col & MASKCOL) | enemy2Size | ATTR1_NOFLIP;
			if (enemy2.flashTimer > 0) enemy2.flashTimer--;
			else shadowOAM[2].attr2 = enemy2Image | ATTR2_PRI1 | ATTR2_PALETTE_BANK(enemy2Pal);
		}
		else shadowOAM[2].attr0 = ATTR0_HIDE;

		// render projs with final data
		for (i=0; i<maxProjs; i++) {
			if (projs[i].active) {
				shadowOAM[i+oamStart].attr0 = (projs[i].row & MASKROW) | projShape | ATTR0_REG | ATTR0_4BPP;
				shadowOAM[i+oamStart].attr1 = (projs[i].col & MASKCOL) | projSize | ATTR1_NOFLIP;
			}
			else shadowOAM[i+oamStart].attr0 = ATTR0_HIDE;
		}

		// render missiles with final data
		for (i=0; i<maxMissiles; i++) {
			if (missiles[i].active) {
				shadowOAM[i+oamStart+maxProjs].attr0 = (missiles[i].row & MASKROW) | missileShape | ATTR0_REG | ATTR0_4BPP;
				shadowOAM[i+oamStart+maxProjs].attr1 = (missiles[i].col & MASKCOL) | missileSize | ATTR1_NOFLIP;
			}
			else shadowOAM[i+oamStart+maxProjs].attr0 = ATTR0_HIDE;
		}

		// update explosions
		for (i=0; i<2; i++) {
			if (expls[i].active) {
				if (expls[i].currentFrame == -1) {
					// animation is done -- remove
					expls[i].active = FALSE;
					shadowOAM[3+i].attr0 = ATTR0_HIDE;
				}
				else {
					if (expls[i].currentFrame == explFrame1) {
						expls[i].size = ATTR1_SIZE8;
						expls[i].width = expls[i].height = 7;
						expls[i].nextFrame = explFrame2;
					}
					else if (expls[i].currentFrame == explFrame2) {
						expls[i].size = ATTR1_SIZE16;
						expls[i].width = expls[i].height = 15;
						expls[i].nextFrame = explFrame3;
					}
					else if (expls[i].currentFrame == explFrame3) {
						expls[i].size = ATTR1_SIZE32;
						expls[i].width = expls[i].height = 21;
						expls[i].nextFrame = explFrame4;
					}
					else if (expls[i].currentFrame == explFrame4) {
						expls[i].size = ATTR1_SIZE32;
						expls[i].width = expls[i].height = 32;
						expls[i].nextFrame = explFrame5;
					}
					else if (expls[i].currentFrame == explFrame5) {
						expls[i].size = ATTR1_SIZE64;
						expls[i].width = expls[i].height = 40;
						expls[i].nextFrame = explFrame6;
					}
					else if (expls[i].currentFrame == explFrame6) {
						expls[i].size = ATTR1_SIZE64;
						expls[i].width = expls[i].height = 48;
						expls[i].nextFrame = -1;
					}

					// render explosion (3 or 4)
					shadowOAM[3+i].attr0 = ((expls[i].row+(24-(expls[i].height>>1))) & MASKROW) | expls[i].shape | ATTR0_REG | ATTR0_4BPP;
					shadowOAM[3+i].attr1 = ((expls[i].col+(24-(expls[i].width>>1))) & MASKCOL) | expls[i].size | ATTR1_NOFLIP;
					shadowOAM[3+i].attr2 = expls[i].currentFrame | ATTR2_PRI1 | ATTR2_PALETTE_BANK(explPal);

					// decrement timer
					if (expls[i].timer > 0) expls[i].timer--;
					else {
						// reset timer and move to next frame
						expls[i].timer = explDelay;
						expls[i].currentFrame = expls[i].nextFrame;
					}
				}
			}
		}

		// at VBlank:
		waitForVblank();
		REG_BG0HOFS = bkrndHoff;			// background
		REG_BG1HOFS = cloudsHoff;			// background
		for (i=0; i<128; i++) {				// sprites
			SPRITEMEM[i] = shadowOAM[i];	// copy shadowOAM into actual OAM
        }
	}
	}
}

bool areColliding(void *objPtr1, void *objPtr2) {  
	// cast the objects to BaseObjs
	obj1 = (BaseObj*)objPtr1;
	obj2 = (BaseObj*)objPtr2;

    if (obj1->row + obj1->height < obj2->row) return FALSE;
    if (obj1->row > obj2->row + obj2->height) return FALSE;

    if (obj1->col + obj1->width < obj2->col) return FALSE;
    if (obj1->col > obj2->col + obj2->width) return FALSE;

    return TRUE;
}

void resetEnemy(Enemy *enemy) {
	enemy->active = TRUE;
	if (enemy->enemyType == 1) {
		enemy->rdel = ~(enemy->rdel);
		enemy->vdist = 0;
		enemy->health = enemy1Health;
		enemy->row = maxVDist+rand()%(105-(enemy->height)-maxVDist);
	}
	else {
		enemy->health = enemy2Health;
		enemy->row = rand()%(maxH-(enemy->height));
	}
	enemy->col = maxW;
	enemy->flashTimer = 0;
}

void resetProj(Proj *proj) {
	proj->active = FALSE;
	if (proj->isMissile) { //missile
		activeMissiles--;
	}
	else { //proj
		activeProjs--;
	}
}

void projHitEnemy(Proj *proj, Enemy *enemy) {
	resetProj(proj);
	if (proj->isMissile) { //missile 
		enemy->health -= missDamage;
	}
	else { //proj
		enemy->health -= projDamage;
	}
	//make the enemy flash white
	enemy->flashTimer = flashAmt;
	if (enemy->enemyType == 1) shadowOAM[1].attr2 = enemy1Image | ATTR2_PRI1 | ATTR2_PALETTE_BANK(enemyHitPal);
	else shadowOAM[2].attr2 = enemy2Image | ATTR2_PRI1 | ATTR2_PALETTE_BANK(enemyHitPal);

	if (enemy->health <= 0) {
		if (enemy->enemyType == 1 && score+enemy1Pts <= 9999) score += enemy1Pts;
		else if (enemy->enemyType == 2 && score+enemy2Pts <= 9999) score += enemy2Pts;
		createExpl((enemy->row+(enemy->height>>1)), (enemy->col+(enemy->width>>1)), FALSE);
		enemy->active = FALSE;
	}
}

void createExpl(int row, int col, bool useBigSnd) {
	if (useBigSnd) playSound(&longExplSnd);
	else playSound(&explSnd);

	if (currentExpl == 0) currentExpl = 1;
	else currentExpl = 0;

	expls[currentExpl].active = TRUE;
	expls[currentExpl].row = row-24;
	expls[currentExpl].col = col-24;
	expls[currentExpl].currentFrame = explFrame1;
	expls[currentExpl].size = ATTR1_SIZE8;
}

void switchBackground() {
	if (currentBkrnd == 0) {
		setBackground(&bg2, 28, 0, TRUE);
		currentBkrnd = 1;
	}
	else {
		setBackground(&bg1, 28, 0, TRUE);
		currentBkrnd = 0;
	}
}

void playLoop(Sound *sound) {
	// make sure sound is stopped
	REG_TM1CNT = 0;
	DMA[2].cnt = 0;

	// set golbal ref to current sound
	soundB = sound;

	// play sound
	REG_TM1D   = sound->timerInterval;       
	REG_TM1CNT = TIMER_ON;

	DMA[2].src = sound->soundData;
	DMA[2].dst = REG_FIFO_B; // use FIFO B
	DMA[2].cnt = DMA_ON | START_ON_FIFO_EMPTY |
				 DMA_32 | DMA_REPEAT |
				 DMA_DESTINATION_FIXED;

	playingB = TRUE;
	chanBCount = 0;
}

void playSound(Sound *sound) {
	// make sure sound is stopped
	REG_TM0CNT = 0;
	DMA[1].cnt = 0;
	// clear any currently playing sound
	playingA = FALSE;
	chanACount = 0;

	// set golbal ref to current sound
	soundA = sound;

	// play sound
	REG_TM0D   = sound->timerInterval;       
	REG_TM0CNT = TIMER_ON;

	DMA[1].src = sound->soundData;
	DMA[1].dst = REG_FIFO_A; // use FIFO A
	DMA[1].cnt = DMA_ON | START_ON_FIFO_EMPTY |
				 DMA_32 | DMA_REPEAT |
				 DMA_DESTINATION_FIXED;

	playingA = TRUE;
	chanACount = 0;
}

void setBackground(Background *bg, int sbbNum, int cbbNum, bool usePal) {
    // Store Tile Images
    DMA[3].src = bg->tileData;
    DMA[3].dst = (u16*)CharBaseBlock(cbbNum);;
    DMA[3].cnt = bg->tileLen >> 1 | DMA_ON;

	// Store map
    DMA[3].src = bg->mapData;
    DMA[3].dst = (u16*)ScreenBaseBlock(sbbNum);
    DMA[3].cnt = bg->mapLen >> 1 | DMA_ON;
    
	if (usePal) {
		// Store palette
		DMA[3].src = bg->palData;
		DMA[3].dst = PALETTE;
		DMA[3].cnt = bg->palLen >> 1 | DMA_ON;
	}
}

void setupInterrupts() {
  REG_IME = 0x0;							// disable interrupts
  REG_INTERRUPT = (u32)interruptHandler;	// set int handler
  enableVBlankInterrupt();					// Function to enable vb ints
  REG_IME = 0x1;							// Enable interrupts
}

void enableVBlankInterrupt() {
	REG_DISPSTAT |= INT_VBLANK_ENABLE;		// Make display generate vblank interrupts
											// This is the sender
	REG_IE        = REG_IE | INT_VB;		// Enable vblank interrupt detection
											// This is the receiver
}
 
void interruptHandler() {
	REG_IME = 0; //disable interrupts

	// Check which event happened, and do something if you care about it
	if (REG_IF == INT_VB) 
	{
		// a vblank happened, increment counter
		vblankcount++;

		// non-looping sound
		if (playingA){
			chanACount++;
			if (chanACount >= soundA->length)  
			{
				stopSound1();
			}
		}

		// looping sound
		if (playingB){
			chanBCount++;
			if (chanBCount >= soundB->length)
			{
				stopSound2();

				// play it again
				playLoop(soundB);
			}
			
		}
	}
	REG_IF = REG_IF; // Tell GBA that interrupt has been handled
	REG_IME = 1; // Re-enable interrupts
}

void stopSound1() {
	// stop the sound on DMA 1
	REG_TM0CNT = 0;
	DMA[1].cnt = 0;
	playingA = FALSE;
}

void stopSound2() {
	// stop the sound on DMA 2
	REG_TM1CNT = 0;
	DMA[2].cnt = 0;
	playingB = FALSE;
}
