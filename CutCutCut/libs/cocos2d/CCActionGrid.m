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
#import "CCDirector.h"

#pragma mark -
#pragma mark GridAction

@implementation CCGridAction

<<<<<<< HEAD
@synthesize gridSize = gridSize_;

+(id) actionWithSize:(ccGridSize)size duration:(ccTime)d
{
	return [[[self alloc] initWithSize:size duration:d ] autorelease];
}

-(id) initWithSize:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithDuration:d]) )
	{
		gridSize_ = gSize;
=======
@synthesize gridSize = _gridSize;

+(id) actionWithDuration:(ccTime)duration size:(CGSize)gridSize;
{
	return [[[self alloc] initWithDuration:duration size:gridSize] autorelease];
}

-(id) initWithDuration:(ccTime)duration size:(CGSize)gridSize;
{
	if ( (self = [super initWithDuration:duration]) )
	{
		_gridSize = gridSize;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void)startWithTarget:(id)target
{
	[super startWithTarget:target];

	CCGridBase *newgrid = [self grid];

	CCNode *t = (CCNode*) target;
	CCGridBase *targetGrid = [t grid];

	if ( targetGrid && targetGrid.reuseGrid > 0 )
	{
<<<<<<< HEAD
		if ( targetGrid.active && targetGrid.gridSize.x == gridSize_.x && targetGrid.gridSize.y == gridSize_.y && [targetGrid isKindOfClass:[newgrid class]] )
=======
		if ( targetGrid.active && targetGrid.gridSize.width == _gridSize.width && targetGrid.gridSize.height == _gridSize.height && [targetGrid isKindOfClass:[newgrid class]] )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			[targetGrid reuse];
		else
			[NSException raise:@"GridBase" format:@"Cannot reuse grid"];
	}
	else
	{
		if ( targetGrid && targetGrid.active )
			targetGrid.active = NO;

		[t setGrid: newgrid];
		t.grid.active = YES;
	}
}

-(CCGridBase *)grid
{
	[NSException raise:@"GridBase" format:@"Abstract class needs implementation"];
	return nil;
}

- (CCActionInterval*) reverse
{
	return [CCReverseTime actionWithAction:self];
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithSize:gridSize_ duration:duration_];
=======
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}
@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Grid3DAction

@implementation CCGrid3DAction

-(CCGridBase *)grid
{
<<<<<<< HEAD
	return [CCGrid3D gridWithSize:gridSize_];
}

-(ccVertex3F)vertex:(ccGridSize)pos
{
	CCGrid3D *g = (CCGrid3D *)[target_ grid];
	return [g vertex:pos];
}

-(ccVertex3F)originalVertex:(ccGridSize)pos
{
	CCGrid3D *g = (CCGrid3D *)[target_ grid];
	return [g originalVertex:pos];
}

-(void)setVertex:(ccGridSize)pos vertex:(ccVertex3F)vertex
{
	CCGrid3D *g = (CCGrid3D *)[target_ grid];
=======
	return [CCGrid3D gridWithSize:_gridSize];
}

-(ccVertex3F)vertex:(CGPoint)pos
{
	CCGrid3D *g = (CCGrid3D *)[_target grid];
	return [g vertex:pos];
}

-(ccVertex3F)originalVertex:(CGPoint)pos
{
	CCGrid3D *g = (CCGrid3D *)[_target grid];
	return [g originalVertex:pos];
}

-(void)setVertex:(CGPoint)pos vertex:(ccVertex3F)vertex
{
	CCGrid3D *g = (CCGrid3D *)[_target grid];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[g setVertex:pos vertex:vertex];
}
@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark TiledGrid3DAction

@implementation CCTiledGrid3DAction

-(CCGridBase *)grid
{
<<<<<<< HEAD
	return [CCTiledGrid3D gridWithSize:gridSize_];
}

-(ccQuad3)tile:(ccGridSize)pos
{
	CCTiledGrid3D *g = (CCTiledGrid3D *)[target_ grid];
	return [g tile:pos];
}

-(ccQuad3)originalTile:(ccGridSize)pos
{
	CCTiledGrid3D *g = (CCTiledGrid3D *)[target_ grid];
	return [g originalTile:pos];
}

-(void)setTile:(ccGridSize)pos coords:(ccQuad3)coords
{
	CCTiledGrid3D *g = (CCTiledGrid3D *)[target_ grid];
=======
	return [CCTiledGrid3D gridWithSize:_gridSize];
}

-(ccQuad3)tile:(CGPoint)pos
{
	CCTiledGrid3D *g = (CCTiledGrid3D *)[_target grid];
	return [g tile:pos];
}

-(ccQuad3)originalTile:(CGPoint)pos
{
	CCTiledGrid3D *g = (CCTiledGrid3D *)[_target grid];
	return [g originalTile:pos];
}

-(void)setTile:(CGPoint)pos coords:(ccQuad3)coords
{
	CCTiledGrid3D *g = (CCTiledGrid3D *)[_target grid];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[g setTile:pos coords:coords];
}

@end

////////////////////////////////////////////////////////////

@interface CCActionInterval (Amplitude)
-(void)setAmplitudeRate:(CGFloat)amp;
-(CGFloat)getAmplitudeRate;
@end

@implementation CCActionInterval (Amplitude)
-(void)setAmplitudeRate:(CGFloat)amp
{
	[NSException raise:@"IntervalAction (Amplitude)" format:@"Abstract class needs implementation"];
}

-(CGFloat)getAmplitudeRate
{
	[NSException raise:@"IntervalAction (Amplitude)" format:@"Abstract class needs implementation"];
	return 0;
}
@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark AccelDeccelAmplitude

@implementation CCAccelDeccelAmplitude

<<<<<<< HEAD
@synthesize rate=rate_;
=======
@synthesize rate=_rate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id)actionWithAction:(CCAction*)action duration:(ccTime)d
{
	return [[[self alloc] initWithAction:action duration:d ] autorelease];
}

-(id)initWithAction:(CCAction *)action duration:(ccTime)d
{
	if ( (self = [super initWithDuration:d]) )
	{
<<<<<<< HEAD
		rate_ = 1.0f;
		other_ = (CCActionInterval*)[action retain];
=======
		_rate = 1.0f;
		_other = (CCActionInterval*)[action retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void)dealloc
{
<<<<<<< HEAD
	[other_ release];
=======
	[_other release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[other_ startWithTarget:target_];
=======
	[_other startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) time
{
	float f = time*2;

	if (f > 1)
	{
		f -= 1;
		f = 1 - f;
	}

<<<<<<< HEAD
	[other_ setAmplitudeRate:powf(f, rate_)];
	[other_ update:time];
=======
	[_other setAmplitudeRate:powf(f, _rate)];
	[_other update:time];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCAccelDeccelAmplitude actionWithAction:[other_ reverse] duration:duration_];
=======
	return [CCAccelDeccelAmplitude actionWithAction:[_other reverse] duration:_duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark AccelAmplitude

@implementation CCAccelAmplitude

<<<<<<< HEAD
@synthesize rate=rate_;
=======
@synthesize rate=_rate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id)actionWithAction:(CCAction*)action duration:(ccTime)d
{
	return [[[self alloc] initWithAction:action duration:d ] autorelease];
}

-(id)initWithAction:(CCAction *)action duration:(ccTime)d
{
	if ( (self = [super initWithDuration:d]) )
	{
<<<<<<< HEAD
		rate_ = 1.0f;
		other_ = (CCActionInterval*)[action retain];
=======
		_rate = 1.0f;
		_other = (CCActionInterval*)[action retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void)dealloc
{
<<<<<<< HEAD
	[other_ release];
=======
	[_other release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[other_ startWithTarget:target_];
=======
	[_other startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) time
{
<<<<<<< HEAD
	[other_ setAmplitudeRate:powf(time, rate_)];
	[other_ update:time];
=======
	[_other setAmplitudeRate:powf(time, _rate)];
	[_other update:time];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCAccelAmplitude actionWithAction:[other_ reverse] duration:self.duration];
=======
	return [CCAccelAmplitude actionWithAction:[_other reverse] duration:self.duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark DeccelAmplitude

@implementation CCDeccelAmplitude

<<<<<<< HEAD
@synthesize rate=rate_;
=======
@synthesize rate=_rate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id)actionWithAction:(CCAction*)action duration:(ccTime)d
{
	return [[[self alloc] initWithAction:action duration:d ] autorelease];
}

-(id)initWithAction:(CCAction *)action duration:(ccTime)d
{
	if ( (self = [super initWithDuration:d]) )
	{
<<<<<<< HEAD
		rate_ = 1.0f;
		other_ = (CCActionInterval*)[action retain];
=======
		_rate = 1.0f;
		_other = (CCActionInterval*)[action retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void)dealloc
{
<<<<<<< HEAD
	[other_ release];
=======
	[_other release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[other_ startWithTarget:target_];
=======
	[_other startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) time
{
<<<<<<< HEAD
	[other_ setAmplitudeRate:powf((1-time), rate_)];
	[other_ update:time];
=======
	[_other setAmplitudeRate:powf((1-time), _rate)];
	[_other update:time];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCDeccelAmplitude actionWithAction:[other_ reverse] duration:self.duration];
=======
	return [CCDeccelAmplitude actionWithAction:[_other reverse] duration:self.duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark StopGrid

@implementation CCStopGrid

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];

	if ( [[self target] grid] && [[[self target] grid] active] ) {
		[[[self target] grid] setActive: NO];

//		[[self target] setGrid: nil];
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark ReuseGrid

@implementation CCReuseGrid

+(id)actionWithTimes:(int)times
{
	return [[[self alloc] initWithTimes:times ] autorelease];
}

-(id)initWithTimes:(int)times
{
	if ( (self = [super init]) )
<<<<<<< HEAD
		t_ = times;
=======
		_times = times;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];

	CCNode *myTarget = (CCNode*) [self target];
	if ( myTarget.grid && myTarget.grid.active )
<<<<<<< HEAD
		myTarget.grid.reuseGrid += t_;
=======
		myTarget.grid.reuseGrid += _times;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end
