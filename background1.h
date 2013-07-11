
//{{BLOCK(background1)

//======================================================================
//
//	background1, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 10 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 640 + 4096 = 5248
//
//	Time-stamp: 2009-10-22, 20:04:55
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __BACKGROUND1__
#define __BACKGROUND1__

#define background1TilesLen 640
extern const unsigned short background1Tiles[320];

#define background1MapLen 4096
extern const unsigned short background1Map[2048];

#define background1PalLen 512
extern const unsigned short background1Pal[256];

#endif // __BACKGROUND1__

//}}BLOCK(background1)
