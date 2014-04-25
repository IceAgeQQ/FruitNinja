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

/** CCWaves3D action */
@interface CCWaves3D : CCGrid3DAction
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

/** amplitude of the wave */
@property (nonatomic,readwrite) float amplitude;
/** amplitude rate of the wave */
@property (nonatomic,readwrite) float amplitudeRate;

<<<<<<< HEAD
+(id)actionWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
-(id)initWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
/** creates an action with duration, grid size, waves and amplitud */
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp;
/** initializeds an action with duration, grid size, waves and amplitud */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCFlipX3D action */
@interface CCFlipX3D : CCGrid3DAction
{
}

/** creates the action with duration */
+(id) actionWithDuration:(ccTime)d;
<<<<<<< HEAD
/** initizlies the action with duration */
=======
/** initializes the action with duration */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id) initWithDuration:(ccTime)d;

@end

////////////////////////////////////////////////////////////

/** CCFlipY3D action */
@interface CCFlipY3D : CCFlipX3D
{
}
<<<<<<< HEAD

=======
// Needed for bridge support
-(void)update:(ccTime)time;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

////////////////////////////////////////////////////////////

/** CCLens3D action */
@interface CCLens3D : CCGrid3DAction
{
<<<<<<< HEAD
	CGPoint	position_;
	float	radius_;
	float	lensEffect_;
	BOOL	dirty_;
=======
	CGPoint	_position;
	float	_radius;
	float	_lensEffect;
	BOOL	_dirty;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** lens effect. Defaults to 0.7 - 0 means no effect, 1 is very strong effect */
@property (nonatomic,readwrite) float lensEffect;
/** lens center position in Points */
@property (nonatomic,readwrite) CGPoint position;

/** creates the action with center position in Points, radius, a grid size and duration */
<<<<<<< HEAD
+(id)actionWithPosition:(CGPoint)pos radius:(float)r grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with center position in Points, radius, a grid size and duration */
-(id)initWithPosition:(CGPoint)pos radius:(float)r grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos radius:(float)radius;
/** initializes the action with center position in Points, radius, a grid size and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos radius:(float)radius;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCRipple3D action */
@interface CCRipple3D : CCGrid3DAction
{
<<<<<<< HEAD
	CGPoint	position_;
	float	radius_;
	int		waves_;
	float	amplitude_;
	float	amplitudeRate_;
=======
	CGPoint	_position;
	float	_radius;
	NSUInteger		_waves;
	float	_amplitude;
	float	_amplitudeRate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** center position in Points */
@property (nonatomic,readwrite) CGPoint position;
/** amplitude */
@property (nonatomic,readwrite) float amplitude;
/** amplitude rate */
@property (nonatomic,readwrite) float amplitudeRate;

/** creates the action with a position in points, radius, number of waves, amplitude, a grid size and duration */
<<<<<<< HEAD
+(id)actionWithPosition:(CGPoint)pos radius:(float)r waves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a position in points, radius, number of waves, amplitude, a grid size and duration */
-(id)initWithPosition:(CGPoint)pos radius:(float)r waves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)d size:(CGSize)gridSize position:(CGPoint)pos radius:(float)r waves:(NSInteger)wav amplitude:(float)amp;
/** initializes the action with a position in points, radius, number of waves, amplitude, a grid size and duration */
-(id)initWithDuration:(ccTime)d size:(CGSize)gridSize position:(CGPoint)pos radius:(float)r waves:(NSInteger)wav amplitude:(float)amp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCShaky3D action */
@interface CCShaky3D : CCGrid3DAction
{
<<<<<<< HEAD
	int		randrange;
	BOOL	shakeZ;
}

/** creates the action with a range, shake Z vertices, a grid and duration */
+(id)actionWithRange:(int)range shakeZ:(BOOL)shakeZ grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a range, shake Z vertices, a grid and duration */
-(id)initWithRange:(int)range shakeZ:(BOOL)shakeZ grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
	int		_randrange;
	BOOL	_shakeZ;
}

/** creates the action with a range, shake Z vertices, a grid and duration */
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shakeZ:(BOOL)shakeZ;
/** initializes the action with a range, shake Z vertices, a grid and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize range:(int)range shakeZ:(BOOL)shakeZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCLiquid action */
@interface CCLiquid : CCGrid3DAction
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

/** amplitude */
@property (nonatomic,readwrite) float amplitude;
/** amplitude rate */
@property (nonatomic,readwrite) float amplitudeRate;

/** creates the action with amplitude, a grid and duration */
<<<<<<< HEAD
+(id)actionWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with amplitude, a grid and duration */
-(id)initWithWaves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp;
/** initializes the action with amplitude, a grid and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCWaves action */
@interface CCWaves : CCGrid3DAction
{
<<<<<<< HEAD
	int		waves;
	float	amplitude;
	float	amplitudeRate;
	BOOL	vertical;
	BOOL	horizontal;
=======
	NSUInteger	_waves;
	float	_amplitude;
	float	_amplitudeRate;
	BOOL	_vertical;
	BOOL	_horizontal;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** amplitude */
@property (nonatomic,readwrite) float amplitude;
/** amplitude rate */
@property (nonatomic,readwrite) float amplitudeRate;

/** initializes the action with amplitude, horizontal sin, vertical sin, a grid and duration */
<<<<<<< HEAD
+(id)actionWithWaves:(int)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v grid:(ccGridSize)gridSize duration:(ccTime)d;
/** creates the action with amplitude, horizontal sin, vertical sin, a grid and duration */
-(id)initWithWaves:(int)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v;
/** creates the action with amplitude, horizontal sin, vertical sin, a grid and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/** CCTwirl action */
@interface CCTwirl : CCGrid3DAction
{
<<<<<<< HEAD
	CGPoint	position_;
	int		twirls_;
	float	amplitude_;
	float	amplitudeRate_;
=======
	CGPoint	_position;
	NSUInteger	_twirls;
	float	_amplitude;
	float	_amplitudeRate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** twirl center */
@property (nonatomic,readwrite) CGPoint position;
/** amplitude */
@property (nonatomic,readwrite) float amplitude;
/** amplitude rate */
@property (nonatomic,readwrite) float amplitudeRate;

/** creates the action with center position, number of twirls, amplitude, a grid size and duration */
<<<<<<< HEAD
+(id)actionWithPosition:(CGPoint)pos twirls:(int)t amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with center position, number of twirls, amplitude, a grid size and duration */
-(id)initWithPosition:(CGPoint)pos twirls:(int)t amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d;
=======
+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos twirls:(NSUInteger)t amplitude:(float)amp;
/** initializes the action with center position, number of twirls, amplitude, a grid size and duration */
-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos twirls:(NSUInteger)t amplitude:(float)amp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end
