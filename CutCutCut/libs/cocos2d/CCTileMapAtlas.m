/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "ccConfig.h"
#import "CCTileMapAtlas.h"
#import "ccMacros.h"
#import "Support/CCFileUtils.h"
<<<<<<< HEAD
=======
#import "Support/CGPointExtension.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@interface CCTileMapAtlas (Private)
-(void) loadTGAfile:(NSString*)file;
-(void) calculateItemsToRender;
<<<<<<< HEAD
-(void) updateAtlasValueAt:(ccGridSize)pos withValue:(ccColor3B)value withIndex:(NSUInteger)idx;
=======
-(void) updateAtlasValueAt:(CGPoint)pos withValue:(ccColor3B)value withIndex:(NSUInteger)idx;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end


@implementation CCTileMapAtlas

<<<<<<< HEAD
@synthesize tgaInfo;
=======
@synthesize tgaInfo=_tgaInfo;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#pragma mark CCTileMapAtlas - Creation & Init
+(id) tileMapAtlasWithTileFile:(NSString*)tile mapFile:(NSString*)map tileWidth:(int)w tileHeight:(int)h
{
	return [[[self alloc] initWithTileFile:tile mapFile:map tileWidth:w tileHeight:h] autorelease];
}


-(id) initWithTileFile:(NSString*)tile mapFile:(NSString*)map tileWidth:(int)w tileHeight:(int)h
{
	[self loadTGAfile: map];
	[self calculateItemsToRender];

<<<<<<< HEAD
	if( (self=[super initWithTileFile:tile tileWidth:w tileHeight:h itemsToRender: itemsToRender]) ) {

		color_ = ccWHITE;

		posToAtlasIndex = [[NSMutableDictionary dictionaryWithCapacity:itemsToRender] retain];

		[self updateAtlasValues];

		[self setContentSize: CGSizeMake(tgaInfo->width*itemWidth_, tgaInfo->height*itemHeight_)];
=======
	if( (self=[super initWithTileFile:tile tileWidth:w tileHeight:h itemsToRender: _itemsToRender]) ) {

		_posToAtlasIndex = [[NSMutableDictionary dictionaryWithCapacity:_itemsToRender] retain];

		[self updateAtlasValues];

		[self setContentSize: CGSizeMake(_tgaInfo->width*_itemWidth, _tgaInfo->height*_itemHeight)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void) dealloc
{
<<<<<<< HEAD
	if( tgaInfo )
		tgaDestroy(tgaInfo);

	[posToAtlasIndex release];
=======
	if( _tgaInfo )
		tgaDestroy(_tgaInfo);

	[_posToAtlasIndex release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

-(void) releaseMap
{
<<<<<<< HEAD
	if( tgaInfo )
		tgaDestroy(tgaInfo);

	tgaInfo = nil;

	[posToAtlasIndex release];
	posToAtlasIndex = nil;
=======
	if( _tgaInfo )
		tgaDestroy(_tgaInfo);

	_tgaInfo = nil;

	[_posToAtlasIndex release];
	_posToAtlasIndex = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) calculateItemsToRender
{
<<<<<<< HEAD
	NSAssert( tgaInfo != nil, @"tgaInfo must be non-nil");

	itemsToRender = 0;
	for(int x = 0;x < tgaInfo->width; x++ ) {
		for(int y = 0; y < tgaInfo->height; y++ ) {
			ccColor3B *ptr = (ccColor3B*) tgaInfo->imageData;
			ccColor3B value = ptr[x + y * tgaInfo->width];
			if( value.r )
				itemsToRender++;
=======
	NSAssert( _tgaInfo != nil, @"tgaInfo must be non-nil");

	_itemsToRender = 0;
	for(int x = 0;x < _tgaInfo->width; x++ ) {
		for(int y = 0; y < _tgaInfo->height; y++ ) {
			ccColor3B *ptr = (ccColor3B*) _tgaInfo->imageData;
			ccColor3B value = ptr[x + y * _tgaInfo->width];
			if( value.r )
				_itemsToRender++;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

-(void) loadTGAfile:(NSString*)file
{
	NSAssert( file != nil, @"file must be non-nil");

<<<<<<< HEAD
	NSString *path = [CCFileUtils fullPathFromRelativePath:file ];
=======
	NSString *path = [[CCFileUtils sharedFileUtils] fullPathForFilename:file ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

//	//Find the path of the file
//	NSBundle *mainBndl = [CCDirector sharedDirector].loadingBundle;
//	NSString *resourcePath = [mainBndl resourcePath];
//	NSString * path = [resourcePath stringByAppendingPathComponent:file];

<<<<<<< HEAD
	tgaInfo = tgaLoad( [path UTF8String] );
#if 1
	if( tgaInfo->status != TGA_OK )
=======
	_tgaInfo = tgaLoad( [path UTF8String] );
#if 1
	if( _tgaInfo->status != TGA_OK )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[NSException raise:@"TileMapAtlasLoadTGA" format:@"TileMapAtas cannot load TGA file"];

#endif
}

#pragma mark CCTileMapAtlas - Atlas generation / updates

<<<<<<< HEAD
-(void) setTile:(ccColor3B) tile at:(ccGridSize) pos
{
	NSAssert( tgaInfo != nil, @"tgaInfo must not be nil");
	NSAssert( posToAtlasIndex != nil, @"posToAtlasIndex must not be nil");
	NSAssert( pos.x < tgaInfo->width, @"Invalid position.x");
	NSAssert( pos.y < tgaInfo->height, @"Invalid position.x");
	NSAssert( tile.r != 0, @"R component must be non 0");

	ccColor3B *ptr = (ccColor3B*) tgaInfo->imageData;
	ccColor3B value = ptr[pos.x + pos.y * tgaInfo->width];
	if( value.r == 0 )
		CCLOG(@"cocos2d: Value.r must be non 0.");
	else {
		ptr[pos.x + pos.y * tgaInfo->width] = tile;

		// XXX: this method consumes a lot of memory
		// XXX: a tree of something like that shall be impolemented
		NSNumber *num = [posToAtlasIndex objectForKey: [NSString stringWithFormat:@"%d,%d", pos.x, pos.y]];
=======
-(void) setTile:(ccColor3B) tile at:(CGPoint) pos
{
	NSAssert( _tgaInfo != nil, @"_tgaInfo must not be nil");
	NSAssert( _posToAtlasIndex != nil, @"_posToAtlasIndex must not be nil");
	NSAssert( pos.x < _tgaInfo->width, @"Invalid position.x");
	NSAssert( pos.y < _tgaInfo->height, @"Invalid position.x");
	NSAssert( tile.r != 0, @"R component must be non 0");

	ccColor3B *ptr = (ccColor3B*) _tgaInfo->imageData;
	ccColor3B value = ptr[(NSUInteger)(pos.x + pos.y * _tgaInfo->width)];
	if( value.r == 0 )
		CCLOG(@"cocos2d: Value.r must be non 0.");
	else {
		ptr[(NSUInteger)(pos.x + pos.y * _tgaInfo->width)] = tile;

		// XXX: this method consumes a lot of memory
		// XXX: a tree of something like that shall be impolemented
		NSNumber *num = [_posToAtlasIndex objectForKey: [NSString stringWithFormat:@"%ld,%ld", (long)pos.x, (long)pos.y]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self updateAtlasValueAt:pos withValue:tile withIndex: [num integerValue]];
	}
}

<<<<<<< HEAD
-(ccColor3B) tileAt:(ccGridSize) pos
{
	NSAssert( tgaInfo != nil, @"tgaInfo must not be nil");
	NSAssert( pos.x < tgaInfo->width, @"Invalid position.x");
	NSAssert( pos.y < tgaInfo->height, @"Invalid position.y");

	ccColor3B *ptr = (ccColor3B*) tgaInfo->imageData;
	ccColor3B value = ptr[pos.x + pos.y * tgaInfo->width];
=======
-(ccColor3B) tileAt:(CGPoint) pos
{
	NSAssert( _tgaInfo != nil, @"_tgaInfo must not be nil");
	NSAssert( pos.x < _tgaInfo->width, @"Invalid position.x");
	NSAssert( pos.y < _tgaInfo->height, @"Invalid position.y");

	ccColor3B *ptr = (ccColor3B*) _tgaInfo->imageData;
	ccColor3B value = ptr[(NSUInteger)(pos.x + pos.y * _tgaInfo->width)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return value;
}

<<<<<<< HEAD
-(void) updateAtlasValueAt:(ccGridSize)pos withValue:(ccColor3B)value withIndex:(NSUInteger)idx
=======
-(void) updateAtlasValueAt:(CGPoint)pos withValue:(ccColor3B)value withIndex:(NSUInteger)idx
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	ccV3F_C4B_T2F_Quad quad;

	NSInteger x = pos.x;
	NSInteger y = pos.y;
<<<<<<< HEAD
	float row = (value.r % itemsPerRow_);
	float col = (value.r / itemsPerRow_);

	float textureWide = [[textureAtlas_ texture] pixelsWide];
	float textureHigh = [[textureAtlas_ texture] pixelsHigh];

	float itemWidthInPixels = itemWidth_ * CC_CONTENT_SCALE_FACTOR();
    float itemHeightInPixels = itemHeight_ * CC_CONTENT_SCALE_FACTOR();
=======
	float row = (value.r % _itemsPerRow);
	float col = (value.r / _itemsPerRow);

	float textureWide = [[_textureAtlas texture] pixelsWide];
	float textureHigh = [[_textureAtlas texture] pixelsHigh];

	float itemWidthInPixels = _itemWidth * CC_CONTENT_SCALE_FACTOR();
    float itemHeightInPixels = _itemHeight * CC_CONTENT_SCALE_FACTOR();
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


#if CC_FIX_ARTIFACTS_BY_STRECHING_TEXEL
	float left		= (2*row*itemWidthInPixels+1)/(2*textureWide);
	float right		= left+(itemWidthInPixels*2-2)/(2*textureWide);
	float top		= (2*col*itemHeightInPixels+1)/(2*textureHigh);
	float bottom	= top+(itemHeightInPixels*2-2)/(2*textureHigh);
#else
	float left		= (row*itemWidthInPixels)/textureWide;
	float right		= left+itemWidthInPixels/textureWide;
	float top		= (col*itemHeightInPixels)/textureHigh;
	float bottom	= top+itemHeightInPixels/textureHigh;
#endif


	quad.tl.texCoords.u = left;
	quad.tl.texCoords.v = top;
	quad.tr.texCoords.u = right;
	quad.tr.texCoords.v = top;
	quad.bl.texCoords.u = left;
	quad.bl.texCoords.v = bottom;
	quad.br.texCoords.u = right;
	quad.br.texCoords.v = bottom;

<<<<<<< HEAD
	quad.bl.vertices.x = (int) (x * itemWidth_);
	quad.bl.vertices.y = (int) (y * itemHeight_);
	quad.bl.vertices.z = 0.0f;
	quad.br.vertices.x = (int)(x * itemWidth_ + itemWidth_);
	quad.br.vertices.y = (int)(y * itemHeight_);
	quad.br.vertices.z = 0.0f;
	quad.tl.vertices.x = (int)(x * itemWidth_);
	quad.tl.vertices.y = (int)(y * itemHeight_ + itemHeight_);
	quad.tl.vertices.z = 0.0f;
	quad.tr.vertices.x = (int)(x * itemWidth_ + itemWidth_);
	quad.tr.vertices.y = (int)(y * itemHeight_ + itemHeight_);
	quad.tr.vertices.z = 0.0f;

	ccColor4B color = { color_.r, color_.g, color_.b, opacity_ };
=======
	quad.bl.vertices.x = (int) (x * _itemWidth);
	quad.bl.vertices.y = (int) (y * _itemHeight);
	quad.bl.vertices.z = 0.0f;
	quad.br.vertices.x = (int)(x * _itemWidth + _itemWidth);
	quad.br.vertices.y = (int)(y * _itemHeight);
	quad.br.vertices.z = 0.0f;
	quad.tl.vertices.x = (int)(x * _itemWidth);
	quad.tl.vertices.y = (int)(y * _itemHeight + _itemHeight);
	quad.tl.vertices.z = 0.0f;
	quad.tr.vertices.x = (int)(x * _itemWidth + _itemWidth);
	quad.tr.vertices.y = (int)(y * _itemHeight + _itemHeight);
	quad.tr.vertices.z = 0.0f;

	ccColor4B color = { _displayedColor.r, _displayedColor.g, _displayedColor.b, _displayedOpacity };
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	quad.tr.colors = color;
	quad.tl.colors = color;
	quad.br.colors = color;
	quad.bl.colors = color;
<<<<<<< HEAD
	[textureAtlas_ updateQuad:&quad atIndex:idx];
=======
	[_textureAtlas updateQuad:&quad atIndex:idx];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) updateAtlasValues
{
<<<<<<< HEAD
	NSAssert( tgaInfo != nil, @"tgaInfo must be non-nil");
=======
	NSAssert( _tgaInfo != nil, @"_tgaInfo must be non-nil");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


	int total = 0;

<<<<<<< HEAD
	for(int x = 0;x < tgaInfo->width; x++ ) {
		for(int y = 0; y < tgaInfo->height; y++ ) {
			if( total < itemsToRender ) {
				ccColor3B *ptr = (ccColor3B*) tgaInfo->imageData;
				ccColor3B value = ptr[x + y * tgaInfo->width];

				if( value.r != 0 ) {
					[self updateAtlasValueAt:ccg(x,y) withValue:value withIndex:total];

					NSString *key = [NSString stringWithFormat:@"%d,%d", x,y];
					NSNumber *num = [NSNumber numberWithInt:total];
					[posToAtlasIndex setObject:num forKey:key];
=======
	for(int x = 0;x < _tgaInfo->width; x++ ) {
		for(int y = 0; y < _tgaInfo->height; y++ ) {
			if( total < _itemsToRender ) {
				ccColor3B *ptr = (ccColor3B*) _tgaInfo->imageData;
				ccColor3B value = ptr[x + y * _tgaInfo->width];

				if( value.r != 0 ) {
					[self updateAtlasValueAt:ccp(x,y) withValue:value withIndex:total];

					NSString *key = [NSString stringWithFormat:@"%d,%d", x,y];
					NSNumber *num = [NSNumber numberWithInt:total];
					[_posToAtlasIndex setObject:num forKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

					total++;
				}
			}
		}
	}
}
@end
