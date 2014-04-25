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

#import "CCActionGrid.h"

/** CCShakyTiles3D action */
@interface CCShakyTiles3D : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int		randrange;
	BOOL	shakeZ;
}

/** creates the action with a range, whether or not to shake Z vertices, a grid size, and duration */
+(id)actionWithRange:(int)range shakeZ:(BOOL)shakeZ grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a range, whether or not to shake Z vertices, a grid size, and duration */
-(id)initWithRange:(int)range shakeZ:(BOOL)shakeZ grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
	int		_randrange;
	BOOL	_shakeZ;
}

/** creates the action with a range, whether or not to shake Z vertices, a grid size, and duration */
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shakeZ:(BOOL)shakeZ;
/** initializes the action with a range, whether or not to shake Z vertices, a grid size, and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shakeZ:(BOOL)shakeZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCShatteredTiles3D action */
@interface CCShatteredTiles3D : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int		randrange;
	BOOL	once;
	BOOL	shatterZ;
}

/** creates the action with a range, whether of not to shatter Z vertices, a grid size and duration */
+(id)actionWithRange:(int)range shatterZ:(BOOL)shatterZ grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a range, whether or not to shatter Z vertices, a grid size and duration */
-(id)initWithRange:(int)range shatterZ:(BOOL)shatterZ grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
	int		_randrange;
	BOOL	_once;
	BOOL	_shatterZ;
}

/** creates the action with a range, whether of not to shatter Z vertices, a grid size and duration */
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shatterZ:(BOOL)shatterZ;
/** initializes the action with a range, whether or not to shatter Z vertices, a grid size and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shatterZ:(BOOL)shatterZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCShuffleTiles action
 Shuffle the tiles in random order
 */
@interface CCShuffleTiles : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int	seed;
	NSUInteger tilesCount;
	int *tilesOrder;
	void *tiles;
}

/** creates the action with a random seed, the grid size and the duration */
+(id)actionWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a random seed, the grid size and the duration */
-(id)initWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
	unsigned	_seed;
	NSUInteger _tilesCount;
	NSUInteger *_tilesOrder;
	void *_tiles;
}

/** creates the action with a random seed, the grid size and the duration */
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed;
/** initializes the action with a random seed, the grid size and the duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCFadeOutTRTiles action
 Fades out the tiles in a Top-Right direction
 */
@interface CCFadeOutTRTiles : CCTiledGrid3DAction
{
}
<<<<<<< HEAD
=======
// XXX: private, but added to make BridgeSupport happy
-(float)testFunc:(CGSize)pos time:(ccTime)time;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

////////////////////////////////////////////////////////////

/** CCFadeOutBLTiles action.
 Fades out the tiles in a Bottom-Left direction
 */
@interface CCFadeOutBLTiles : CCFadeOutTRTiles
{
}
<<<<<<< HEAD
=======
// XXX: private, but added to make BridgeSupport happy
-(float)testFunc:(CGSize)pos time:(ccTime)time;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

////////////////////////////////////////////////////////////

/** CCFadeOutUpTiles action.
 Fades out the tiles in upwards direction
 */
@interface CCFadeOutUpTiles : CCFadeOutTRTiles
{
}
<<<<<<< HEAD
=======
// XXX: private, but added to make BridgeSupport happy
-(float)testFunc:(CGSize)pos time:(ccTime)time;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

////////////////////////////////////////////////////////////

/** CCFadeOutDownTiles action.
 Fades out the tiles in downwards direction
 */
@interface CCFadeOutDownTiles : CCFadeOutUpTiles
{
}
<<<<<<< HEAD
=======
// XXX: private, but added to make BridgeSupport happy
-(float)testFunc:(CGSize)pos time:(ccTime)time;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

////////////////////////////////////////////////////////////

/** CCTurnOffTiles action.
 Turn off the files in random order
 */
@interface CCTurnOffTiles : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int	seed;
	NSUInteger tilesCount;
	int *tilesOrder;
}

/** creates the action with a random seed, the grid size and the duration */
+(id)actionWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a random seed, the grid size and the duration */
-(id)initWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
	unsigned	_seed;
	NSUInteger _tilesCount;
	NSUInteger *_tilesOrder;
}

/** creates the action with a random seed, the grid size and the duration */
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed;
/** initializes the action with a random seed, the grid size and the duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize seed:(unsigned)seed;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

////////////////////////////////////////////////////////////

/** CCWavesTiles3D action. */
@interface CCWavesTiles3D : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int waves;
	float amplitude;
	float amplitudeRate;
=======
	NSUInteger _waves;
	float _amplitude;
	float _amplitudeRate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** waves amplitude */
@property (nonatomic,readwrite) float amplitude;
/** waves amplitude rate */
@property (nonatomic,readwrite) float amplitudeRate;

/** creates the action with a number of waves, the waves amplitude, the grid size and the duration */
<<<<<<< HEAD
+(id)actionWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a number of waves, the waves amplitude, the grid size and the duration */
-(id)initWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp;
/** initializes the action with a number of waves, the waves amplitude, the grid size and the duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCJumpTiles3D action.
 A sin function is executed to move the tiles across the Z axis
 */
@interface CCJumpTiles3D : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int jumps;
	float amplitude;
	float amplitudeRate;
=======
	NSUInteger _jumps;
	float _amplitude;
	float _amplitudeRate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** amplitude of the sin*/
@property (nonatomic,readwrite) float amplitude;
/** amplitude rate */
@property (nonatomic,readwrite) float amplitudeRate;

/** creates the action with the number of jumps, the sin amplitude, the grid size and the duration */
<<<<<<< HEAD
+(id)actionWithJumps:(int)j amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with the number of jumps, the sin amplitude, the grid size and the duration */
-(id)initWithJumps:(int)j amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize jumps:(NSUInteger)numberOfJumps amplitude:(float)amplitude;
/** initializes the action with the number of jumps, the sin amplitude, the grid size and the duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize jumps:(NSUInteger)numberOfJumps amplitude:(float)amplitude;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCSplitRows action */
@interface CCSplitRows : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int		rows;
	CGSize	winSize;
}
/** creates the action with the number of rows to split and the duration */
+(id)actionWithRows:(int)rows duration:(ccTime)duration;
/** initializes the action with the number of rows to split and the duration */
-(id)initWithRows:(int)rows duration:(ccTime)duration;
=======
	NSUInteger	_rows;
	CGSize	_winSize;
}
/** creates the action with the number of rows to split and the duration */
+(id)actionWithDuration:(ccTime)duration rows:(NSUInteger)rows;
/** initializes the action with the number of rows to split and the duration */
-(id)initWithDuration:(ccTime)duration rows:(NSUInteger)rows;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCSplitCols action */
@interface CCSplitCols : CCTiledGrid3DAction
{
<<<<<<< HEAD
	int		cols;
	CGSize	winSize;
}
/** creates the action with the number of columns to split and the duration */
+(id)actionWithCols:(int)cols duration:(ccTime)duration;
/** initializes the action with the number of columns to split and the duration */
-(id)initWithCols:(int)cols duration:(ccTime)duration;
=======
	NSUInteger	_cols;
	CGSize	_winSize;
}
/** creates the action with the number of columns to split and the duration */
+(id)actionWithDuration:(ccTime)duration cols:(NSUInteger)cols;
/** initializes the action with the number of columns to split and the duration */
-(id)initWithDuration:(ccTime)duration cols:(NSUInteger)cols;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end
