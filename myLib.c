/*-------------------------------------------------------------------
 *
 * Library for general GBA programming
 *
 *-----------------------------------------------------------------*/
#include "myLib.h"

#define USE_DMA

unsigned short *videoBuffer = VIDBUFADR;

void setPixel3(int row, int col, u16 color)
{
	videoBuffer[OFFSET(row,col,240)]  = color;
}

void drawRect3(int row, int col, int height, int width, volatile u16 color)
{
	int r;
	for(r=0; r<height; r++)
	{
		DMA[3].src = &color;
		DMA[3].dst = videoBuffer + OFFSET(r+row, col, 240);
		DMA[3].cnt = width | DMA_SOURCE_FIXED | DMA_ON;
	}
}

void setPixel4(int row, int col, u8 index)
{
	int whichPixel = OFFSET(row,col,240);
	int whichShort = whichPixel/2;
	if(col & 1) // Is it odd?
	{
		videoBuffer[whichShort] = (videoBuffer[whichShort] & 0x00FF) | (index << 8);
	}
	else
	{
		// even column
		videoBuffer[whichShort] = (videoBuffer[whichShort] & 0xFF00) | (index);
	}
}

void drawRect4OLD(int row, int col, int height, int width, volatile u8 index)
{
	int r, c;
	for(r=0; r<height; r++)
	{
		for(c=0; c<width; c++)
		{
			setPixel4(row+r, col+c, index);
		}
	}
}

// Draw Rectangle using DMA
// This version always rectangles that start on even columns and are an even number 
// of pixels wide
void drawRect4(int row, int col, int height, int width, volatile u8 index)
{
	volatile u16 indexindex = (index << 8) | index;
	int r;
	col = col/2*2;
	for(r=0; r<height; r++)
	{
		DMA[3].src = &indexindex;
		DMA[3].dst = videoBuffer + (OFFSET(r+row, col, 240)>>1);
		DMA[3].cnt = (width/2) | DMA_SOURCE_FIXED | DMA_ON;
		
	}
}

void waitForVblank()
{
	while(SCANLINECOUNTER > 159);
	while(SCANLINECOUNTER < 160);
}

void delay(u32 clicks)
{
	u32 i;
	for(i=0; i<clicks; i++);
}

void fillScreen3(volatile u16 color)
{
	volatile unsigned int colorcolor = color<<16 | color;
	DMA[3].src = &colorcolor;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = 19200 | DMA_SOURCE_FIXED | DMA_32 | DMA_ON;
	
}

void fillPicture3(const u16 *picture)
{
	DMA[3].src = picture;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = (240*160) | DMA_ON;
}

void drawBitmap3(int row, int col, int width, int height, const u16* bitmap)
{
	int r;
    for (r = 0; r < height; r++) {
        DMA[3].src = &bitmap[(r*width)];
        DMA[3].dst = &videoBuffer[OFFSET(row+r, col, 240)];
        DMA[3].cnt = width | DMA_ON;
    }
}

void copyPicture4(const u16 *buffer)
{
	
	DMA[3].src = buffer;
	DMA[3].dst = videoBuffer;
	DMA[3].cnt = 19200 | DMA_16 | DMA_ON;
	
}

void drawString0(int row, int col, char string[], u8 palIndex)
{
	int i;
	for (i=0; i<strlen(string); i++) {
		SCREENBLOCKBASE[31].tilemap[OFFSET(row, col+i, 256>>3)] = string[i]+(palIndex<<12);
	}
}

void eraseString0(int row, int col, int len)
{
	int i;
	for (i=0; i<len; i++) {
		SCREENBLOCKBASE[31].tilemap[OFFSET(row, col+i, 256>>3)] = 0;
	}
}

void clearStrings0()
{
	DMA[3].src = 0;
    DMA[3].dst = (u16*)ScreenBaseBlock(31);
    DMA[3].cnt = (1056>>1) | DMA_SOURCE_FIXED | DMA_ON;
}

void flipPage()
{
	if(REG_DISPCTL & BUFFER1FLAG) // Is it BUFFER1
	{
		// YES
		REG_DISPCTL = REG_DISPCTL & ~BUFFER1FLAG;
		videoBuffer = BUFFER1;
	}
	else
	{
		// NO
		REG_DISPCTL = REG_DISPCTL | BUFFER1FLAG;
		videoBuffer = BUFFER0;
	}
}
