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


#import "CCActionGrid3D.h"
#import "ccMacros.h"
#import "Support/CGPointExtension.h"

#pragma mark -
#pragma mark Waves3D

@implementation CCWaves3D

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
@synthesize amplitude=_amplitude;
@synthesize amplitudeRate=_amplitudeRate;

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
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize waves:_waves amplitude:_amplitude];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 0; i < (gridSize_.x+1); i++ )
	{
		for( j = 0; j < (gridSize_.y+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccg(i,j)];
			v.z += (sinf((CGFloat)M_PI*time*waves*2 + (v.y+v.x) * .01f) * amplitude * amplitudeRate);
			[self setVertex:ccg(i,j) vertex:v];
=======
	for( i = 0; i < (_gridSize.width+1); i++ )
	{
		for( j = 0; j < (_gridSize.height+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccp(i,j)];
			v.z += (sinf((CGFloat)M_PI*time*_waves*2 + (v.y+v.x) * .01f) * _amplitude * _amplitudeRate);
			[self setVertex:ccp(i,j) vertex:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}
@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark FlipX3D

@implementation CCFlipX3D

+(id) actionWithDuration:(ccTime)d
{
<<<<<<< HEAD
	return [[[self alloc] initWithSize:ccg(1,1) duration:d] autorelease];
=======
	return [[[self alloc] initWithDuration:d size:CGSizeMake(1,1)] autorelease];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) initWithDuration:(ccTime)d
{
<<<<<<< HEAD
	return [super initWithSize:ccg(1,1) duration:d];
}

-(id)initWithSize:(ccGridSize)gSize duration:(ccTime)d
{
	if ( gSize.x != 1 || gSize.y != 1 )
=======
	return [super initWithDuration:d size:CGSizeMake(1,1)];
}

-(id)initWithSize:(CGSize)gSize duration:(ccTime)d
{
	if ( gSize.width != 1 || gSize.height != 1 )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	{
		[NSException raise:@"FlipX3D" format:@"Grid size must be (1,1)"];
	}

<<<<<<< HEAD
	return [super initWithSize:gSize duration:d];
=======
	return [super initWithDuration:d size:gSize];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithSize:gridSize_ duration:duration_];
=======
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithSize:_gridSize duration:_duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}


-(void)update:(ccTime)time
{
	CGFloat angle = (CGFloat)M_PI * time; // 180 degrees
	CGFloat mz = sinf( angle );
	angle = angle / 2.0f;     // x calculates degrees from 0 to 90
	CGFloat mx = cosf( angle );

	ccVertex3F	v0, v1, v, diff;

<<<<<<< HEAD
	v0 = [self originalVertex:ccg(1,1)];
	v1 = [self originalVertex:ccg(0,0)];
=======
	v0 = [self originalVertex:ccp(1,1)];
	v1 = [self originalVertex:ccp(0,0)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CGFloat	x0 = v0.x;
	CGFloat	x1 = v1.x;
	CGFloat x;
<<<<<<< HEAD
	ccGridSize	a, b, c, d;
=======
	CGPoint	a, b, c, d;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if ( x0 > x1 )
	{
		// Normal Grid
<<<<<<< HEAD
		a = ccg(0,0);
		b = ccg(0,1);
		c = ccg(1,0);
		d = ccg(1,1);
=======
		a = ccp(0,0);
		b = ccp(0,1);
		c = ccp(1,0);
		d = ccp(1,1);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		x = x0;
	}
	else
	{
		// Reversed Grid
<<<<<<< HEAD
		c = ccg(0,0);
		d = ccg(0,1);
		a = ccg(1,0);
		b = ccg(1,1);
=======
		c = ccp(0,0);
		d = ccp(0,1);
		a = ccp(1,0);
		b = ccp(1,1);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		x = x1;
	}

	diff.x = ( x - x * mx );
	diff.z = fabsf( floorf( (x * mz) / 4.0f ) );

// bottom-left
	v = [self originalVertex:a];
	v.x = diff.x;
	v.z += diff.z;
	[self setVertex:a vertex:v];

// upper-left
	v = [self originalVertex:b];
	v.x = diff.x;
	v.z += diff.z;
	[self setVertex:b vertex:v];

// bottom-right
	v = [self originalVertex:c];
	v.x -= diff.x;
	v.z -= diff.z;
	[self setVertex:c vertex:v];

// upper-right
	v = [self originalVertex:d];
	v.x -= diff.x;
	v.z -= diff.z;
	[self setVertex:d vertex:v];
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark FlipY3D

@implementation CCFlipY3D

-(void)update:(ccTime)time
{
	CGFloat angle = (CGFloat)M_PI * time; // 180 degrees
	CGFloat mz = sinf( angle );
	angle = angle / 2.0f;     // x calculates degrees from 0 to 90
	CGFloat my = cosf( angle );

	ccVertex3F	v0, v1, v, diff;

<<<<<<< HEAD
	v0 = [self originalVertex:ccg(1,1)];
	v1 = [self originalVertex:ccg(0,0)];
=======
	v0 = [self originalVertex:ccp(1,1)];
	v1 = [self originalVertex:ccp(0,0)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CGFloat	y0 = v0.y;
	CGFloat	y1 = v1.y;
	CGFloat y;
<<<<<<< HEAD
	ccGridSize	a, b, c, d;
=======
	CGPoint	a, b, c, d;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if ( y0 > y1 )
	{
		// Normal Grid
<<<<<<< HEAD
		a = ccg(0,0);
		b = ccg(0,1);
		c = ccg(1,0);
		d = ccg(1,1);
=======
		a = ccp(0,0);
		b = ccp(0,1);
		c = ccp(1,0);
		d = ccp(1,1);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		y = y0;
	}
	else
	{
		// Reversed Grid
<<<<<<< HEAD
		b = ccg(0,0);
		a = ccg(0,1);
		d = ccg(1,0);
		c = ccg(1,1);
=======
		b = ccp(0,0);
		a = ccp(0,1);
		d = ccp(1,0);
		c = ccp(1,1);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		y = y1;
	}

	diff.y = y - y * my;
	diff.z = fabsf( floorf( (y * mz) / 4.0f ) );

	// bottom-left
	v = [self originalVertex:a];
	v.y = diff.y;
	v.z += diff.z;
	[self setVertex:a vertex:v];

	// upper-left
	v = [self originalVertex:b];
	v.y -= diff.y;
	v.z -= diff.z;
	[self setVertex:b vertex:v];

	// bottom-right
	v = [self originalVertex:c];
	v.y = diff.y;
	v.z += diff.z;
	[self setVertex:c vertex:v];

	// upper-right
	v = [self originalVertex:d];
	v.y -= diff.y;
	v.z -= diff.z;
	[self setVertex:d vertex:v];
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Lens3D

@implementation CCLens3D

<<<<<<< HEAD
@synthesize lensEffect=lensEffect_;

+(id)actionWithPosition:(CGPoint)pos radius:(float)r grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithPosition:pos radius:r grid:gridSize duration:d] autorelease];
}

-(id)initWithPosition:(CGPoint)pos radius:(float)r grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		position_ = ccp(-1,-1);
		self.position = pos;
		radius_ = r;
		lensEffect_ = 0.7f;
		dirty_ = YES;
=======
@synthesize lensEffect=_lensEffect;

+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos radius:(float)radius
{
	return [[[self alloc] initWithDuration:duration size:gridSize position:pos radius:radius] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos radius:(float)radius
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_position = ccp(-1,-1);
		self.position = pos;
		_radius = radius;
		_lensEffect = 0.7f;
		_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithPosition:position_ radius:radius_ grid:gridSize_ duration:duration_];
=======
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize position:_position radius:_radius];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) setPosition:(CGPoint)pos
{
<<<<<<< HEAD
	if( ! CGPointEqualToPoint(pos, position_) ) {
		position_ = pos;
		dirty_ = YES;
=======
	if( ! CGPointEqualToPoint(pos, _position) ) {
		_position = pos;
		_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(CGPoint) position
{
<<<<<<< HEAD
	return position_;
=======
	return _position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)update:(ccTime)time
{
<<<<<<< HEAD
	if ( dirty_ )
	{
		int i, j;

		for( i = 0; i < gridSize_.x+1; i++ )
		{
			for( j = 0; j < gridSize_.y+1; j++ )
			{
				ccVertex3F	v = [self originalVertex:ccg(i,j)];
				CGPoint vect = ccpSub(position_, ccp(v.x,v.y));
				CGFloat r = ccpLength(vect);

				if ( r < radius_ )
				{
					r = radius_ - r;
					CGFloat pre_log = r / radius_;
					if ( pre_log == 0 ) pre_log = 0.001f;
					float l = logf(pre_log) * lensEffect_;
					float new_r = expf( l ) * radius_;
=======
	if ( _dirty )
	{
		int i, j;

		for( i = 0; i < _gridSize.width+1; i++ )
		{
			for( j = 0; j < _gridSize.height+1; j++ )
			{
				ccVertex3F	v = [self originalVertex:ccp(i,j)];
				CGPoint vect = ccpSub(_position, ccp(v.x,v.y));
				CGFloat r = ccpLength(vect);

				if ( r < _radius )
				{
					r = _radius - r;
					CGFloat pre_log = r / _radius;
					if ( pre_log == 0 ) pre_log = 0.001f;
					float l = logf(pre_log) * _lensEffect;
					float new_r = expf( l ) * _radius;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

					if ( ccpLength(vect) > 0 )
					{
						vect = ccpNormalize(vect);
						CGPoint new_vect = ccpMult(vect, new_r);
<<<<<<< HEAD
						v.z += ccpLength(new_vect) * lensEffect_;
					}
				}

				[self setVertex:ccg(i,j) vertex:v];
			}
		}

		dirty_ = NO;
=======
						v.z += ccpLength(new_vect) * _lensEffect;
					}
				}

				[self setVertex:ccp(i,j) vertex:v];
			}
		}

		_dirty = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Ripple3D

@implementation CCRipple3D

<<<<<<< HEAD
@synthesize amplitude = amplitude_;
@synthesize amplitudeRate = amplitudeRate_;

+(id)actionWithPosition:(CGPoint)pos radius:(float)r waves:(int)wav amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithPosition:pos radius:r waves:wav amplitude:amp grid:gridSize duration:d] autorelease];
}

-(id)initWithPosition:(CGPoint)pos radius:(float)r waves:(int)wav amplitude:(float)amp grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		self.position = pos;
		radius_ = r;
		waves_ = wav;
		amplitude_ = amp;
		amplitudeRate_ = 1.0f;
=======
@synthesize amplitude = _amplitude;
@synthesize amplitudeRate = _amplitudeRate;


+(id)actionWithDuration:(ccTime)d size:(CGSize)gridSize position:(CGPoint)pos radius:(float)r waves:(NSInteger)wav amplitude:(float)amp
{
	return [[[self alloc] initWithDuration:d size:gridSize position:pos radius:r waves:wav amplitude:amp] autorelease];
}

-(id)initWithDuration:(ccTime)d size:(CGSize)gridSize position:(CGPoint)pos radius:(float)r waves:(NSInteger)wav amplitude:(float)amp
{
	if ( (self = [super initWithDuration:d size:gridSize]) )
	{
		self.position = pos;
		_radius = r;
		_waves = wav;
		_amplitude = amp;
		_amplitudeRate = 1.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(CGPoint) position
{
<<<<<<< HEAD
	return position_;
=======
	return _position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setPosition:(CGPoint)pos
{
<<<<<<< HEAD
	position_ = pos;
=======
	_position = pos;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithPosition:position_ radius:radius_ waves:waves_ amplitude:amplitude_ grid:gridSize_ duration:duration_];
	return copy;
}


=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize position:_position radius:_radius waves:_waves amplitude:_amplitude];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 0; i < (gridSize_.x+1); i++ )
	{
		for( j = 0; j < (gridSize_.y+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccg(i,j)];
			CGPoint vect = ccpSub(position_, ccp(v.x,v.y));
			CGFloat r = ccpLength(vect);

			if ( r < radius_ )
			{
				r = radius_ - r;
				CGFloat rate = powf( r / radius_, 2);
				v.z += (sinf( time*(CGFloat)M_PI*waves_*2 + r * 0.1f) * amplitude_ * amplitudeRate_ * rate );
			}

			[self setVertex:ccg(i,j) vertex:v];
=======
	for( i = 0; i < (_gridSize.width+1); i++ )
	{
		for( j = 0; j < (_gridSize.height+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccp(i,j)];
			CGPoint vect = ccpSub(_position, ccp(v.x,v.y));
			CGFloat r = ccpLength(vect);

			if ( r < _radius )
			{
				r = _radius - r;
				CGFloat rate = powf( r / _radius, 2);
				v.z += (sinf( time*(CGFloat)M_PI*_waves*2 + r * 0.1f) * _amplitude * _amplitudeRate * rate );
			}

			[self setVertex:ccp(i,j) vertex:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Shaky3D

@implementation CCShaky3D

<<<<<<< HEAD
+(id)actionWithRange:(int)range shakeZ:(BOOL)sz grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithRange:range shakeZ:sz grid:gridSize duration:d] autorelease];
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
	for( i = 0; i < (gridSize_.x+1); i++ )
	{
		for( j = 0; j < (gridSize_.y+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccg(i,j)];
			v.x += ( rand() % (randrange*2) ) - randrange;
			v.y += ( rand() % (randrange*2) ) - randrange;
			if( shakeZ )
				v.z += ( rand() % (randrange*2) ) - randrange;

			[self setVertex:ccg(i,j) vertex:v];
=======
	for( i = 0; i < (_gridSize.width+1); i++ )
	{
		for( j = 0; j < (_gridSize.height+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccp(i,j)];
			v.x += ( rand() % (_randrange*2) ) - _randrange;
			v.y += ( rand() % (_randrange*2) ) - _randrange;
			if( _shakeZ )
				v.z += ( rand() % (_randrange*2) ) - _randrange;

			[self setVertex:ccp(i,j) vertex:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Liquid

@implementation CCLiquid

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
@synthesize amplitude=_amplitude;
@synthesize amplitudeRate=_amplitudeRate;

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

-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 1; i < gridSize_.x; i++ )
	{
		for( j = 1; j < gridSize_.y; j++ )
		{
			ccVertex3F	v = [self originalVertex:ccg(i,j)];
			v.x = (v.x + (sinf(time*(CGFloat)M_PI*waves*2 + v.x * .01f) * amplitude * amplitudeRate));
			v.y = (v.y + (sinf(time*(CGFloat)M_PI*waves*2 + v.y * .01f) * amplitude * amplitudeRate));
			[self setVertex:ccg(i,j) vertex:v];
=======
	for( i = 1; i < _gridSize.width; i++ )
	{
		for( j = 1; j < _gridSize.height; j++ )
		{
			ccVertex3F	v = [self originalVertex:ccp(i,j)];
			v.x = (v.x + (sinf(time*(CGFloat)M_PI*_waves*2 + v.x * .01f) * _amplitude * _amplitudeRate));
			v.y = (v.y + (sinf(time*(CGFloat)M_PI*_waves*2 + v.y * .01f) * _amplitude * _amplitudeRate));
			[self setVertex:ccp(i,j) vertex:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithWaves:waves amplitude:amplitude grid:gridSize_ duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize waves:_waves amplitude:_amplitude];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Waves

@implementation CCWaves

<<<<<<< HEAD
@synthesize amplitude;
@synthesize amplitudeRate;

+(id)actionWithWaves:(int)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithWaves:wav amplitude:amp horizontal:h vertical:v grid:gridSize duration:d] autorelease];
}

-(id)initWithWaves:(int)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		waves = wav;
		amplitude = amp;
		amplitudeRate = 1.0f;
		horizontal = h;
		vertical = v;
=======
@synthesize amplitude=_amplitude;
@synthesize amplitudeRate=_amplitudeRate;

+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v
{
	return [[[self alloc] initWithDuration:duration size:gridSize waves:wav amplitude:amp horizontal:h vertical:v] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize waves:(NSUInteger)wav amplitude:(float)amp horizontal:(BOOL)h vertical:(BOOL)v
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		_waves = wav;
		_amplitude = amp;
		_amplitudeRate = 1.0f;
		_horizontal = h;
		_vertical = v;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void)update:(ccTime)time
{
	int i, j;

<<<<<<< HEAD
	for( i = 0; i < (gridSize_.x+1); i++ )
	{
		for( j = 0; j < (gridSize_.y+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccg(i,j)];

			if ( vertical )
				v.x = (v.x + (sinf(time*(CGFloat)M_PI*waves*2 + v.y * .01f) * amplitude * amplitudeRate));

			if ( horizontal )
				v.y = (v.y + (sinf(time*(CGFloat)M_PI*waves*2 + v.x * .01f) * amplitude * amplitudeRate));

			[self setVertex:ccg(i,j) vertex:v];
=======
	for( i = 0; i < (_gridSize.width+1); i++ )
	{
		for( j = 0; j < (_gridSize.height+1); j++ )
		{
			ccVertex3F	v = [self originalVertex:ccp(i,j)];

			if ( _vertical )
				v.x = (v.x + (sinf(time*(CGFloat)M_PI*_waves*2 + v.y * .01f) * _amplitude * _amplitudeRate));

			if ( _horizontal )
				v.y = (v.y + (sinf(time*(CGFloat)M_PI*_waves*2 + v.x * .01f) * _amplitude * _amplitudeRate));

			[self setVertex:ccp(i,j) vertex:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithWaves:waves amplitude:amplitude horizontal:horizontal vertical:vertical grid:gridSize_ duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize waves:_waves amplitude:_amplitude horizontal:_horizontal vertical:_vertical];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Twirl

@implementation CCTwirl

<<<<<<< HEAD
@synthesize amplitude = amplitude_;
@synthesize amplitudeRate = amplitudeRate_;

+(id)actionWithPosition:(CGPoint)pos twirls:(int)t amplitude:(float)amp grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithPosition:pos twirls:t amplitude:amp grid:gridSize duration:d] autorelease];
}

-(id)initWithPosition:(CGPoint)pos twirls:(int)t amplitude:(float)amp grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		self.position = pos;
		twirls_ = t;
		amplitude_ = amp;
		amplitudeRate_ = 1.0f;
=======
@synthesize amplitude = _amplitude;
@synthesize amplitudeRate = _amplitudeRate;

+(id)actionWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos twirls:(NSUInteger)t amplitude:(float)amp
{
	return [[[self alloc] initWithDuration:duration size:gridSize position:pos twirls:t amplitude:amp] autorelease];
}

-(id)initWithDuration:(ccTime)duration size:(CGSize)gridSize position:(CGPoint)pos twirls:(NSUInteger)t amplitude:(float)amp
{
	if ( (self = [super initWithDuration:duration size:gridSize]) )
	{
		self.position = pos;
		_twirls = t;
		_amplitude = amp;
		_amplitudeRate = 1.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void) setPosition:(CGPoint)pos
{
<<<<<<< HEAD
	position_ = pos;
=======
	_position = pos;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CGPoint) position
{
<<<<<<< HEAD
	return position_;
=======
	return _position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)update:(ccTime)time
{
	int i, j;
<<<<<<< HEAD
	CGPoint	c = position_;

	for( i = 0; i < (gridSize_.x+1); i++ )
	{
		for( j = 0; j < (gridSize_.y+1); j++ )
		{
			ccVertex3F v = [self originalVertex:ccg(i,j)];

			CGPoint	avg = ccp(i-(gridSize_.x/2.0f), j-(gridSize_.y/2.0f));
			CGFloat r = ccpLength( avg );

			CGFloat amp = 0.1f * amplitude_ * amplitudeRate_;
			CGFloat a = r * cosf( (CGFloat)M_PI/2.0f + time * (CGFloat)M_PI * twirls_ * 2 ) * amp;
=======
	CGPoint	c = _position;

	for( i = 0; i < (_gridSize.width+1); i++ )
	{
		for( j = 0; j < (_gridSize.height+1); j++ )
		{
			ccVertex3F v = [self originalVertex:ccp(i,j)];

			CGPoint	avg = ccp(i-(_gridSize.width/2.0f), j-(_gridSize.height/2.0f));
			CGFloat r = ccpLength( avg );

			CGFloat amp = 0.1f * _amplitude * _amplitudeRate;
			CGFloat a = r * cosf( (CGFloat)M_PI/2.0f + time * (CGFloat)M_PI * _twirls * 2 ) * amp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

			float cosA = cosf(a);
			float sinA = sinf(a);

			CGPoint	d = {
				sinA * (v.y-c.y) + cosA * (v.x-c.x),
				cosA * (v.y-c.y) - sinA * (v.x-c.x)
			};

			v.x = c.x + d.x;
			v.y = c.y + d.y;

<<<<<<< HEAD
			[self setVertex:ccg(i,j) vertex:v];
=======
			[self setVertex:ccp(i,j) vertex:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithPosition:position_
																	  twirls:twirls_
																   amplitude:amplitude_
																		grid:gridSize_
																	duration:duration_];
	return copy;
=======
	return [[[self class] allocWithZone:zone] initWithDuration:_duration size:_gridSize position:_position twirls:_twirls amplitude:_amplitude];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


@end
