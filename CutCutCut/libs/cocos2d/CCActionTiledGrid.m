/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009 On-Core
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


#import "CCActionTiledGrid.h"
#import "CCDirector.h"
#import "ccMacros.h"
#import "Support/CGPointExtension.h"

typedef struct
{
	CGPoint	position;
	CGPoint	startPosition;
<<<<<<< HEAD
	ccGridSize	delta;
=======
	CGSize	delta;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
} Tile;

#pragma mark -
#pragma mark ShakyTiles3D

@implementation CCShakyTiles3D

<<<<<<< HEAD
+(id)actionWithRange:(int)range shakeZ:(BOOL)shakeZ grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithRange:range shakeZ:shakeZ grid:gridSize duration:d] autorelease];
}

-(id)initWithRange:(int)range shakeZ:(BOOL)sz grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		randrange = range;
		shakeZ = sz;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shakeZ:(BOOL)shakeZ
{
	return [[[self alloc] initWithDuration:duration size:gridSize range:range shakeZ:shakeZ] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shakeZ:(BOOL)shakeZ
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_randrange = range;
		_shakeZ = shakeZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithRange:randrange shakeZ:shakeZ grid:gridSize_ duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize range:_randrange shakeZ:_shakeZ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			ccQuad3 coords = [self originalTile:ccg(i,j)];

			// X
			coords.bl.x += ( rand() % (randrange*2) ) - randrange;
			coords.br.x += ( rand() % (randrange*2) ) - randrange;
			coords.tl.x += ( rand() % (randrange*2) ) - randrange;
			coords.tr.x += ( rand() % (randrange*2) ) - randrange;

			// Y
			coords.bl.y += ( rand() % (randrange*2) ) - randrange;
			coords.br.y += ( rand() % (randrange*2) ) - randrange;
			coords.tl.y += ( rand() % (randrange*2) ) - randrange;
			coords.tr.y += ( rand() % (randrange*2) ) - randrange;

			if( shakeZ ) {
				coords.bl.z += ( rand() % (randrange*2) ) - randrange;
				coords.br.z += ( rand() % (randrange*2) ) - randrange;
				coords.tl.z += ( rand() % (randrange*2) ) - randrange;
				coords.tr.z += ( rand() % (randrange*2) ) - randrange;
			}

			[self setTile:ccg(i,j) coords:coords];
=======
	for( i = 0; i < _gridSize.width; i++ )
	{
		for( j = 0; j < _gridSize.height; j++ )
		{
			ccQuad3 coords = [self originalTile:ccp(i,j)];

			// X
			coords.bl.x += ( rand() % (_randrange*2) ) - _randrange;
			coords.br.x += ( rand() % (_randrange*2) ) - _randrange;
			coords.tl.x += ( rand() % (_randrange*2) ) - _randrange;
			coords.tr.x += ( rand() % (_randrange*2) ) - _randrange;

			// Y
			coords.bl.y += ( rand() % (_randrange*2) ) - _randrange;
			coords.br.y += ( rand() % (_randrange*2) ) - _randrange;
			coords.tl.y += ( rand() % (_randrange*2) ) - _randrange;
			coords.tr.y += ( rand() % (_randrange*2) ) - _randrange;

			if( _shakeZ ) {
				coords.bl.z += ( rand() % (_randrange*2) ) - _randrange;
				coords.br.z += ( rand() % (_randrange*2) ) - _randrange;
				coords.tl.z += ( rand() % (_randrange*2) ) - _randrange;
				coords.tr.z += ( rand() % (_randrange*2) ) - _randrange;
			}

			[self setTile:ccp(i,j) coords:coords];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCShatteredTiles3D

@implementation CCShatteredTiles3D

<<<<<<< HEAD
+(id)actionWithRange:(int)range shatterZ:(BOOL)sz grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithRange:range shatterZ:sz grid:gridSize duration:d] autorelease];
}

-(id)initWithRange:(int)range shatterZ:(BOOL)sz grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		once = NO;
		randrange = range;
		shatterZ = sz;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shatterZ:(BOOL)shatterZ
{
	return [[[self alloc] initWithDuration:duration size:gridSize range:range shatterZ:shatterZ] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shatterZ:(BOOL)shatterZ

{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_once = NO;
		_randrange = range;
		_shatterZ = shatterZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithRange:randrange shatterZ:shatterZ grid:gridSize_ duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize range:_randrange shatterZ:_shatterZ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	if ( once == NO )
	{
		for( i = 0; i < gridSize_.x; i++ )
		{
			for( j = 0; j < gridSize_.y; j++ )
			{
				ccQuad3 coords = [self originalTile:ccg(i,j)];

				// X
				coords.bl.x += ( rand() % (randrange*2) ) - randrange;
				coords.br.x += ( rand() % (randrange*2) ) - randrange;
				coords.tl.x += ( rand() % (randrange*2) ) - randrange;
				coords.tr.x += ( rand() % (randrange*2) ) - randrange;

				// Y
				coords.bl.y += ( rand() % (randrange*2) ) - randrange;
				coords.br.y += ( rand() % (randrange*2) ) - randrange;
				coords.tl.y += ( rand() % (randrange*2) ) - randrange;
				coords.tr.y += ( rand() % (randrange*2) ) - randrange;

				if( shatterZ ) {
					coords.bl.z += ( rand() % (randrange*2) ) - randrange;
					coords.br.z += ( rand() % (randrange*2) ) - randrange;
					coords.tl.z += ( rand() % (randrange*2) ) - randrange;
					coords.tr.z += ( rand() % (randrange*2) ) - randrange;
				}

				[self setTile:ccg(i,j) coords:coords];
			}
		}

		once = YES;
=======
	if ( _once == NO )
	{
		for( i = 0; i < _gridSize.width; i++ )
		{
			for( j = 0; j < _gridSize.height; j++ )
			{
				ccQuad3 coords = [self originalTile:ccp(i,j)];

				// X
				coords.bl.x += ( rand() % (_randrange*2) ) - _randrange;
				coords.br.x += ( rand() % (_randrange*2) ) - _randrange;
				coords.tl.x += ( rand() % (_randrange*2) ) - _randrange;
				coords.tr.x += ( rand() % (_randrange*2) ) - _randrange;

				// Y
				coords.bl.y += ( rand() % (_randrange*2) ) - _randrange;
				coords.br.y += ( rand() % (_randrange*2) ) - _randrange;
				coords.tl.y += ( rand() % (_randrange*2) ) - _randrange;
				coords.tr.y += ( rand() % (_randrange*2) ) - _randrange;

				if( _shatterZ ) {
					coords.bl.z += ( rand() % (_randrange*2) ) - _randrange;
					coords.br.z += ( rand() % (_randrange*2) ) - _randrange;
					coords.tl.z += ( rand() % (_randrange*2) ) - _randrange;
					coords.tr.z += ( rand() % (_randrange*2) ) - _randrange;
				}

				[self setTile:ccp(i,j) coords:coords];
			}
		}

		_once = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCShuffleTiles

@implementation CCShuffleTiles

<<<<<<< HEAD
+(id)actionWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithSeed:s grid:gridSize duration:d] autorelease];
}

-(id)initWithSeed:(int)s grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		seed = s;
		tilesOrder = nil;
		tiles = nil;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed
{
	return [[[self alloc] initWithDuration:duration size:gridSize seed:seed] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_seed = seed;
		_tilesOrder = nil;
		_tiles = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithSeed:seed grid:gridSize_ duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize seed:_seed];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


-(void)dealloc
{
<<<<<<< HEAD
	if ( tilesOrder ) free(tilesOrder);
	if ( tiles ) free(tiles);
	[super dealloc];
}

-(void)shuffle:(int*)array count:(NSUInteger)len
=======
	if(_tilesOrder)
		free(_tilesOrder);
	if(_tiles)
		free(_tiles);
	[super dealloc];
}

-(void)shuffle:(NSUInteger*)array count:(NSUInteger)len
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	NSInteger i;
	for( i = len - 1; i >= 0; i-- )
	{
		NSInteger j = rand() % (i+1);
<<<<<<< HEAD
		int v = array[i];
=======
		NSUInteger v = array[i];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		array[i] = array[j];
		array[j] = v;
	}
}

<<<<<<< HEAD
-(ccGridSize)getDelta:(ccGridSize)pos
{
	CGPoint	pos2;

	NSInteger idx = pos.x * gridSize_.y + pos.y;

	pos2.x = tilesOrder[idx] / (int)gridSize_.y;
	pos2.y = tilesOrder[idx] % (int)gridSize_.y;

	return ccg(pos2.x - pos.x, pos2.y - pos.y);
}

-(void)placeTile:(ccGridSize)pos tile:(Tile)t
{
	ccQuad3	coords = [self originalTile:pos];

	CGPoint step = [[target_ grid] step];
=======
-(CGSize)getDelta:(CGSize)pos
{
	CGPoint	pos2;

	NSUInteger idx = pos.width * _gridSize.height + pos.height;

	pos2.x = _tilesOrder[idx] / (NSUInteger)_gridSize.height;
	pos2.y = _tilesOrder[idx] % (NSUInteger)_gridSize.height;

	return CGSizeMake(pos2.x - pos.width, pos2.y - pos.height);
}

-(void)placeTile:(CGPoint)pos tile:(Tile)t
{
	ccQuad3	coords = [self originalTile:pos];

	CGPoint step = [[_target grid] step];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	coords.bl.x += (int)(t.position.x * step.x);
	coords.bl.y += (int)(t.position.y * step.y);

	coords.br.x += (int)(t.position.x * step.x);
	coords.br.y += (int)(t.position.y * step.y);

	coords.tl.x += (int)(t.position.x * step.x);
	coords.tl.y += (int)(t.position.y * step.y);

	coords.tr.x += (int)(t.position.x * step.x);
	coords.tr.y += (int)(t.position.y * step.y);

	[self setTile:pos coords:coords];
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];

<<<<<<< HEAD
	if ( seed != -1 )
		srand(seed);

	tilesCount = gridSize_.x * gridSize_.y;
	tilesOrder = (int*)malloc(tilesCount*sizeof(int));
	int i, j;

	for( i = 0; i < tilesCount; i++ )
		tilesOrder[i] = i;

	[self shuffle:tilesOrder count:tilesCount];

	tiles = malloc(tilesCount*sizeof(Tile));
	Tile *tileArray = (Tile*)tiles;

	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			tileArray->position = ccp(i,j);
			tileArray->startPosition = ccp(i,j);
			tileArray->delta = [self getDelta:ccg(i,j)];
=======
	if ( _seed != -1 )
		srand(_seed);

	_tilesCount = _gridSize.width * _gridSize.height;
	_tilesOrder = (NSUInteger*)malloc(_tilesCount*sizeof(NSUInteger));
	int i, j;

	for( i = 0; i < _tilesCount; i++ )
		_tilesOrder[i] = i;

	[self shuffle:_tilesOrder count:_tilesCount];

	_tiles = malloc(_tilesCount*sizeof(Tile));
	Tile *tileArray = (Tile*)_tiles;

	for( i = 0; i < _gridSize.width; i++ )
	{
		for( j = 0; j < _gridSize.height; j++ )
		{
			tileArray->position = ccp(i,j);
			tileArray->startPosition = ccp(i,j);
			tileArray->delta = [self getDelta:CGSizeMake(i,j)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			tileArray++;
		}
	}
}

-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	Tile *tileArray = (Tile*)tiles;

	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			tileArray->position = ccpMult( ccp(tileArray->delta.x, tileArray->delta.y), time);
			[self placeTile:ccg(i,j) tile:*tileArray];
=======
	Tile *tileArray = (Tile*)_tiles;

	for( i = 0; i < _gridSize.width; i++ )
	{
		for( j = 0; j < _gridSize.height; j++ )
		{
			tileArray->position = ccpMult( ccp(tileArray->delta.width, tileArray->delta.height), time);
			[self placeTile:ccp(i,j) tile:*tileArray];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			tileArray++;
		}
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCFadeOutTRTiles

@implementation CCFadeOutTRTiles

<<<<<<< HEAD
-(float)testFunc:(ccGridSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult( ccp(gridSize_.x,gridSize_.y), time);
	if ( (n.x+n.y) == 0.0f )
		return 1.0f;

	return powf( (pos.x+pos.y) / (n.x+n.y), 6 );
}

-(void)turnOnTile:(ccGridSize)pos
=======
-(float)testFunc:(CGSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult( ccp(_gridSize.width,_gridSize.height), time);
	if ( (n.x+n.y) == 0.0f )
		return 1.0f;

	return powf( (pos.width+pos.height) / (n.x+n.y), 6 );
}

-(void)turnOnTile:(CGPoint)pos
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	[self setTile:pos coords:[self originalTile:pos]];
}

<<<<<<< HEAD
-(void)turnOffTile:(ccGridSize)pos
=======
-(void)turnOffTile:(CGPoint)pos
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	ccQuad3	coords;
	bzero(&coords, sizeof(ccQuad3));
	[self setTile:pos coords:coords];
}

<<<<<<< HEAD
-(void)transformTile:(ccGridSize)pos distance:(float)distance
{
	ccQuad3	coords = [self originalTile:pos];
	CGPoint	step = [[target_ grid] step];
=======
-(void)transformTile:(CGPoint)pos distance:(float)distance
{
	ccQuad3	coords = [self originalTile:pos];
	CGPoint	step = [[_target grid] step];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	coords.bl.x += (step.x / 2) * (1.0f - distance);
	coords.bl.y += (step.y / 2) * (1.0f - distance);

	coords.br.x -= (step.x / 2) * (1.0f - distance);
	coords.br.y += (step.y / 2) * (1.0f - distance);

	coords.tl.x += (step.x / 2) * (1.0f - distance);
	coords.tl.y -= (step.y / 2) * (1.0f - distance);

	coords.tr.x -= (step.x / 2) * (1.0f - distance);
	coords.tr.y -= (step.y / 2) * (1.0f - distance);

	[self setTile:pos coords:coords];
}

-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			float distance = [self testFunc:ccg(i,j) time:time];
			if ( distance == 0 )
				[self turnOffTile:ccg(i,j)];
			else if ( distance < 1 )
				[self transformTile:ccg(i,j) distance:distance];
			else
				[self turnOnTile:ccg(i,j)];
=======
	for( i = 0; i < _gridSize.width; i++ )
	{
		for( j = 0; j < _gridSize.height; j++ )
		{
			float distance = [self testFunc:CGSizeMake(i,j) time:time];
			if ( distance == 0 )
				[self turnOffTile:ccp(i,j)];
			else if ( distance < 1 )
				[self transformTile:ccp(i,j) distance:distance];
			else
				[self turnOnTile:ccp(i,j)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCFadeOutBLTiles

@implementation CCFadeOutBLTiles

<<<<<<< HEAD
-(float)testFunc:(ccGridSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult(ccp(gridSize_.x, gridSize_.y), (1.0f-time));
	if ( (pos.x+pos.y) == 0 )
		return 1.0f;

	return powf( (n.x+n.y) / (pos.x+pos.y), 6 );
=======
-(float)testFunc:(CGSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult(ccp(_gridSize.width, _gridSize.height), (1.0f-time));
	if ( (pos.width+pos.height) == 0 )
		return 1.0f;

	return powf( (n.x+n.y) / (pos.width+pos.height), 6 );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCFadeOutUpTiles

@implementation CCFadeOutUpTiles

<<<<<<< HEAD
-(float)testFunc:(ccGridSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult(ccp(gridSize_.x, gridSize_.y), time);
	if ( n.y == 0 )
		return 1.0f;

	return powf( pos.y / n.y, 6 );
}

-(void)transformTile:(ccGridSize)pos distance:(float)distance
{
	ccQuad3	coords = [self originalTile:pos];
	CGPoint step = [[target_ grid] step];
=======
-(float)testFunc:(CGSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult(ccp(_gridSize.width, _gridSize.height), time);
	if ( n.y == 0 )
		return 1.0f;

	return powf( pos.height / n.y, 6 );
}

-(void)transformTile:(CGPoint)pos distance:(float)distance
{
	ccQuad3	coords = [self originalTile:pos];
	CGPoint step = [[_target grid] step];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	coords.bl.y += (step.y / 2) * (1.0f - distance);
	coords.br.y += (step.y / 2) * (1.0f - distance);
	coords.tl.y -= (step.y / 2) * (1.0f - distance);
	coords.tr.y -= (step.y / 2) * (1.0f - distance);

	[self setTile:pos coords:coords];
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCFadeOutDownTiles

@implementation CCFadeOutDownTiles

<<<<<<< HEAD
-(float)testFunc:(ccGridSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult(ccp(gridSize_.x,gridSize_.y), (1.0f - time));
	if ( pos.y == 0 )
		return 1.0f;

	return powf( n.y / pos.y, 6 );
=======
-(float)testFunc:(CGSize)pos time:(ccTime)time
{
	CGPoint	n = ccpMult(ccp(_gridSize.width,_gridSize.height), (1.0f - time));
	if ( pos.height == 0 )
		return 1.0f;

	return powf( n.y / pos.height, 6 );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark TurnOffTiles

@implementation CCTurnOffTiles

<<<<<<< HEAD
+(id)actionWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithSeed:s grid:gridSize duration:d] autorelease];
}

-(id)initWithSeed:(int)s grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		seed = s;
		tilesOrder = nil;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed
{
	return [[[self alloc] initWithDuration:duration size:gridSize seed:seed] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_seed = seed;
		_tilesOrder = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithSeed:seed grid:gridSize_ duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize seed:_seed];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)dealloc
{
<<<<<<< HEAD
	if ( tilesOrder ) free(tilesOrder);
	[super dealloc];
}

-(void)shuffle:(int*)array count:(NSUInteger)len
=======
	if(_tilesOrder)
		free(_tilesOrder);
	[super dealloc];
}

-(void)shuffle:(NSUInteger*)array count:(NSUInteger)len
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	NSInteger i;
	for( i = len - 1; i >= 0; i-- )
	{
<<<<<<< HEAD
		NSInteger j = rand() % (i+1);
		int v = array[i];
=======
		NSUInteger j = rand() % (i+1);
		NSUInteger v = array[i];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		array[i] = array[j];
		array[j] = v;
	}
}

<<<<<<< HEAD
-(void)turnOnTile:(ccGridSize)pos
=======
-(void)turnOnTile:(CGPoint)pos
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	[self setTile:pos coords:[self originalTile:pos]];
}

<<<<<<< HEAD
-(void)turnOffTile:(ccGridSize)pos
=======
-(void)turnOffTile:(CGPoint)pos
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	ccQuad3	coords;

	bzero(&coords, sizeof(ccQuad3));
	[self setTile:pos coords:coords];
}

-(void)startWithTarget:(id)aTarget
{
<<<<<<< HEAD
	int i;

	[super startWithTarget:aTarget];

	if ( seed != -1 )
		srand(seed);

	tilesCount = gridSize_.x * gridSize_.y;
	tilesOrder = (int*)malloc(tilesCount*sizeof(int));

	for( i = 0; i < tilesCount; i++ )
		tilesOrder[i] = i;

	[self shuffle:tilesOrder count:tilesCount];
=======
	NSUInteger i;

	[super startWithTarget:aTarget];

	if ( _seed != -1 )
		srand(_seed);

	_tilesCount = _gridSize.width * _gridSize.height;
	_tilesOrder = (NSUInteger*)malloc(_tilesCount*sizeof(NSUInteger));

	for( i = 0; i < _tilesCount; i++ )
		_tilesOrder[i] = i;

	[self shuffle:_tilesOrder count:_tilesCount];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)update:(ccTime)time
{
<<<<<<< HEAD
	int i, l, t;

	l = (int)(time * (float)tilesCount);

	for( i = 0; i < tilesCount; i++ )
	{
		t = tilesOrder[i];
		ccGridSize tilePos = ccg( t / gridSize_.y, t % gridSize_.y );
=======
	NSUInteger i, l, t;

	l = (NSUInteger)(time * (float)_tilesCount);

	for( i = 0; i < _tilesCount; i++ )
	{
		t = _tilesOrder[i];
		CGPoint tilePos = ccp( (NSUInteger)(t / _gridSize.height),
							  t % (NSUInteger)_gridSize.height );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		if ( i < l )
			[self turnOffTile:tilePos];
		else
			[self turnOnTile:tilePos];
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCWavesTiles3D

@implementation CCWavesTiles3D

<<<<<<< HEAD
@synthesize amplitude;
@synthesize amplitudeRate;

+(id)actionWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithWaves:wav amplitude:amp grid:gridSize duration:d] autorelease];
}

-(id)initWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		waves = wav;
		amplitude = amp;
		amplitudeRate = 1.0f;
=======
@synthesize amplitude = _amplitude;
@synthesize amplitudeRate = _amplitudeRate;

+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp
{
	return [[[self alloc] initWithDuration:duration size:gridSize waves:wav amplitude:amp] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_waves = wav;
		_amplitude = amp;
		_amplitudeRate = 1.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithWaves:waves amplitude:amplitude grid:gridSize_ duration:duration_];
=======
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize waves:_waves amplitude:_amplitude];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}


-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			ccQuad3 coords = [self originalTile:ccg(i,j)];

			coords.bl.z = (sinf(time*(CGFloat)M_PI*waves*2 + (coords.bl.y+coords.bl.x) * .01f) * amplitude * amplitudeRate );
=======
	for( i = 0; i < _gridSize.width; i++ )
	{
		for( j = 0; j < _gridSize.height; j++ )
		{
			ccQuad3 coords = [self originalTile:ccp(i,j)];

			coords.bl.z = (sinf(time*(CGFloat)M_PI*_waves*2 + (coords.bl.y+coords.bl.x) * .01f) * _amplitude * _amplitudeRate );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			coords.br.z	= coords.bl.z;
			coords.tl.z = coords.bl.z;
			coords.tr.z = coords.bl.z;

<<<<<<< HEAD
			[self setTile:ccg(i,j) coords:coords];
=======
			[self setTile:ccp(i,j) coords:coords];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}
@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCJumpTiles3D

@implementation CCJumpTiles3D

<<<<<<< HEAD
@synthesize amplitude;
@synthesize amplitudeRate;

+(id)actionWithJumps:(int)j amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithJumps:j amplitude:amp grid:gridSize duration:d] autorelease];
}

-(id)initWithJumps:(int)j amplitude:(float)amp grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		jumps = j;
		amplitude = amp;
		amplitudeRate = 1.0f;
=======
@synthesize amplitude = _amplitude;
@synthesize amplitudeRate = _amplitudeRate;

+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize jumps:(NSUInteger)numberOfJumps amplitude:(float)amplitude
{
	return [[[self alloc] initWithDuration:duration size:gridSize jumps:numberOfJumps amplitude:amplitude] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize jumps:(NSUInteger)numberOfJumps amplitude:(float)amplitude
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_jumps = numberOfJumps;
		_amplitude = amplitude;
		_amplitudeRate = 1.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithJumps:jumps amplitude:amplitude grid:gridSize_ duration:duration_];
=======
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize jumps:_jumps amplitude:_amplitude];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}


-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	float sinz =  (sinf((CGFloat)M_PI*time*jumps*2) * amplitude * amplitudeRate );
	float sinz2 = (sinf((CGFloat)M_PI*(time*jumps*2 + 1)) * amplitude * amplitudeRate );

	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			ccQuad3 coords = [self originalTile:ccg(i,j)];
=======
	float sinz =  (sinf((CGFloat)M_PI*time*_jumps*2) * _amplitude * _amplitudeRate );
	float sinz2 = (sinf((CGFloat)M_PI*(time*_jumps*2 + 1)) * _amplitude * _amplitudeRate );

	for( i = 0; i < _gridSize.width; i++ )
	{
		for( j = 0; j < _gridSize.height; j++ )
		{
			ccQuad3 coords = [self originalTile:ccp(i,j)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

			if ( ((i+j) % 2) == 0 )
			{
				coords.bl.z += sinz;
				coords.br.z += sinz;
				coords.tl.z += sinz;
				coords.tr.z += sinz;
			}
			else
			{
				coords.bl.z += sinz2;
				coords.br.z += sinz2;
				coords.tl.z += sinz2;
				coords.tr.z += sinz2;
			}

<<<<<<< HEAD
			[self setTile:ccg(i,j) coords:coords];
=======
			[self setTile:ccp(i,j) coords:coords];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}
@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark SplitRows

@implementation CCSplitRows

<<<<<<< HEAD
+(id)actionWithRows:(int)r duration:(ccTime)d
{
	return [[[self alloc] initWithRows:r duration:d] autorelease];
}

-(id)initWithRows:(int)r duration:(ccTime)d
{
	rows = r;
	return [super initWithSize:ccg(1,r) duration:d];
=======
+(id)actionWithDuration:(ccTime)duration rows:(NSUInteger)rows
{
	return [[[self alloc] initWithDuration:duration rows:rows] autorelease];
}

-(id)initWithDuration:(ccTime)duration rows:(NSUInteger)rows
{
	if( (self=[super initWithDuration:duration size:CGSizeMake(1,rows)]) )
		_rows = rows;
	
	return self;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithRows:rows duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration rows:_rows];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	winSize = [[CCDirector sharedDirector] winSizeInPixels];
=======
	_winSize = [[CCDirector sharedDirector] winSizeInPixels];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)update:(ccTime)time
{
<<<<<<< HEAD
	int j;

	for( j = 0; j < gridSize_.y; j++ )
	{
		ccQuad3 coords = [self originalTile:ccg(0,j)];
=======
	NSUInteger j;

	for( j = 0; j < _gridSize.height; j++ )
	{
		ccQuad3 coords = [self originalTile:ccp(0,j)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		float	direction = 1;

		if ( (j % 2 ) == 0 )
			direction = -1;

<<<<<<< HEAD
		coords.bl.x += direction * winSize.width * time;
		coords.br.x += direction * winSize.width * time;
		coords.tl.x += direction * winSize.width * time;
		coords.tr.x += direction * winSize.width * time;

		[self setTile:ccg(0,j) coords:coords];
=======
		coords.bl.x += direction * _winSize.width * time;
		coords.br.x += direction * _winSize.width * time;
		coords.tl.x += direction * _winSize.width * time;
		coords.tr.x += direction * _winSize.width * time;

		[self setTile:ccp(0,j) coords:coords];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark CCSplitCols

@implementation CCSplitCols

<<<<<<< HEAD
+(id)actionWithCols:(int)c duration:(ccTime)d
{
	return [[[self alloc] initWithCols:c duration:d] autorelease];
}

-(id)initWithCols:(int)c duration:(ccTime)d
{
	cols = c;
	return [super initWithSize:ccg(c,1) duration:d];
=======
+(id)actionWithDuration:(ccTime)duration cols:(NSUInteger)cols
{
	return [[[self alloc] initWithDuration:duration cols:cols] autorelease];
}

-(id)initWithDuration:(ccTime)duration cols:(NSUInteger)cols
{
	if( (self=[super initWithDuration:duration size:CGSizeMake(cols,1)]) )
		_cols = cols;
	return self;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithCols:cols duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration cols:_cols];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	winSize = [[CCDirector sharedDirector] winSizeInPixels];
=======
	_winSize = [[CCDirector sharedDirector] winSizeInPixels];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)update:(ccTime)time
{
<<<<<<< HEAD
	int i;

	for( i = 0; i < gridSize_.x; i++ )
	{
		ccQuad3 coords = [self originalTile:ccg(i,0)];
=======
	NSUInteger i;

	for( i = 0; i < _gridSize.width; i++ )
	{
		ccQuad3 coords = [self originalTile:ccp(i,0)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		float	direction = 1;

		if ( (i % 2 ) == 0 )
			direction = -1;

<<<<<<< HEAD
		coords.bl.y += direction * winSize.height * time;
		coords.br.y += direction * winSize.height * time;
		coords.tl.y += direction * winSize.height * time;
		coords.tr.y += direction * winSize.height * time;

		[self setTile:ccg(i,0) coords:coords];
=======
		coords.bl.y += direction * _winSize.height * time;
		coords.br.y += direction * _winSize.height * time;
		coords.tl.y += direction * _winSize.height * time;
		coords.tr.y += direction * _winSize.height * time;

		[self setTile:ccp(i,0) coords:coords];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

@end
