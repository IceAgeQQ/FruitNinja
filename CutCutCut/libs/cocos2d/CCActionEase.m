/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2009 Jason Booth
<<<<<<< HEAD
=======
 * Copyright (c) 2013 Nader Eloshaiker
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
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


/*
 * Elastic, Back and Bounce actions based on code from:
 * http://github.com/NikhilK/silverlightfx/
 *
 * by http://github.com/NikhilK
 */

#import "CCActionEase.h"

#ifndef M_PI_X_2
#define M_PI_X_2 (float)M_PI * 2.0f
#endif

#pragma mark EaseAction

//
// EaseAction
//
@implementation CCActionEase

<<<<<<< HEAD
=======
@synthesize inner=_inner;

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) actionWithAction: (CCActionInterval*) action
{
	return [[[self alloc] initWithAction: action] autorelease ];
}

-(id) initWithAction: (CCActionInterval*) action
{
	NSAssert( action!=nil, @"Ease: arguments must be non-nil");

	if( (self=[super initWithDuration: action.duration]) )
<<<<<<< HEAD
		other = [action retain];
=======
		_inner = [action retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[other copy] autorelease]];
=======
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[_inner copy] autorelease]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) dealloc
{
<<<<<<< HEAD
	[other release];
=======
	[_inner release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[other startWithTarget:target_];
=======
	[_inner startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
	[other stop];
=======
	[_inner stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super stop];
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update: t];
=======
	[_inner update: t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithAction: [other reverse]];
=======
	return [[self class] actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


#pragma mark -
#pragma mark EaseRate

//
// EaseRateAction
//
@implementation CCEaseRateAction
<<<<<<< HEAD
@synthesize rate;
+(id) actionWithAction: (CCActionInterval*) action rate:(float)aRate
{
	return [[[self alloc] initWithAction: action rate:aRate] autorelease ];
}

-(id) initWithAction: (CCActionInterval*) action rate:(float)aRate
{
	if( (self=[super initWithAction:action ]) )
		self.rate = aRate;
=======
@synthesize rate=_rate;
+(id) actionWithAction: (CCActionInterval*) action rate:(float)rate
{
	return [[[self alloc] initWithAction: action rate:rate] autorelease ];
}

-(id) initWithAction: (CCActionInterval*) action rate:(float)rate
{
	if( (self=[super initWithAction:action ]) )
		self.rate = rate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[other copy] autorelease] rate:rate];
=======
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[_inner copy] autorelease] rate:_rate];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) dealloc
{
	[super dealloc];
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithAction: [other reverse] rate:1/rate];
=======
	return [[self class] actionWithAction: [_inner reverse] rate:1/_rate];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EeseIn
//
@implementation CCEaseIn
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update: powf(t,rate)];
=======
	[_inner update: powf(t,_rate)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseOut
//
@implementation CCEaseOut
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update: powf(t,1/rate)];
=======
	[_inner update: powf(t,1/_rate)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseInOut
//
@implementation CCEaseInOut
-(void) update: (ccTime) t
{
	t *= 2;
	if (t < 1) {
<<<<<<< HEAD
		[other update: 0.5f * powf (t, rate)];
    }
	else {
		[other update: 1.0f - 0.5f * powf(2-t, rate)];
=======
		[_inner update: 0.5f * powf (t, _rate)];
    }
	else {
		[_inner update: 1.0f - 0.5f * powf(2-t, _rate)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    }
}

// InOut and OutIn are symmetrical
-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithAction: [other reverse] rate:rate];
=======
	return [[self class] actionWithAction: [_inner reverse] rate:_rate];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

#pragma mark -
#pragma mark EaseExponential

//
// EaseExponentialIn
//
@implementation CCEaseExponentialIn
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update: (t==0) ? 0 : powf(2, 10 * (t/1 - 1)) - 1 * 0.001f];
=======
	[_inner update: (t==0) ? 0 : powf(2, 10 * (t/1 - 1)) /* - 1 * 0.001f */];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseExponentialOut actionWithAction: [other reverse]];
=======
	return [CCEaseExponentialOut actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseExponentialOut
//
@implementation CCEaseExponentialOut
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update: (t==1) ? 1 : (-powf(2, -10 * t/1) + 1)];
=======
	[_inner update: (t==1) ? 1 : (-powf(2, -10 * t/1) + 1)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseExponentialIn actionWithAction: [other reverse]];
=======
	return [CCEaseExponentialIn actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseExponentialInOut
//
@implementation CCEaseExponentialInOut
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	t /= 0.5f;
	if (t < 1)
		t = 0.5f * powf(2, 10 * (t - 1));
	else
		t = 0.5f * (-powf(2, -10 * (t -1) ) + 2);

	[other update:t];
=======
	// prevents rouding errors
	if( t != 1 && t != 0 ) {
		t *= 2;
		if (t < 1)
			t = 0.5f * powf(2, 10 * (t - 1));
		else
			t = 0.5f * (-powf(2, -10 * (t -1) ) + 2);
	}

	[_inner update:t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


#pragma mark -
<<<<<<< HEAD
=======
#pragma mark EasePolynomial

//
// EasePolynomial
//
#define kDefaultPolynomial 6
@implementation CCEasePolynomial

@dynamic polynomialOrder;

+(id) actionWithAction: (CCActionInterval*) action
{
    return [[[self alloc] initWithAction: action] autorelease];
}

-(id) initWithAction: (CCActionInterval*) action
{
    NSAssert( action!=nil, @"Ease: arguments must be non-nil");
    
    if (self = [super initWithAction: action]) {
		_polynomialOrder = kDefaultPolynomial;
        _hasInflection = FALSE;
        _intersetValue = 1.78179743628068f;
    }
    
    return self;
}

-(void)setPolynomialOrder:(NSUInteger)val {
    NSAssert(val>1, @"Polynomial order must be greater than 1");
    _polynomialOrder = val;
    _hasInflection = (val % 2 > 0);
    _intersetValue = powf(0.5f, 1.0f / val) / 0.5f;
}

-(NSUInteger)polynomialOrder {
    return _polynomialOrder;
}
@end

//
// EasePolynomialIn
//
@implementation CCEasePolynomialIn
-(void) update: (ccTime) t
{
    [_inner update: powf(t, _polynomialOrder)];
}

- (CCActionInterval*) reverse
{
    CCEasePolynomialOut *action = [CCEasePolynomialOut actionWithAction: [_inner reverse]];
    if (_polynomialOrder != kDefaultPolynomial) {
        action.polynomialOrder = _polynomialOrder;
    }
    
    return action;
}
@end

//
// EasePolynomialOut
//
@implementation CCEasePolynomialOut
-(void) update: (ccTime) t
{
    if (_hasInflection) {
        t = powf(t-1.0f, _polynomialOrder) + 1.0f;
    } else {
        t = -powf(t-1.0f, _polynomialOrder) + 1.0f;
    }
    
    [_inner update:t];
}

- (CCActionInterval*) reverse
{
    CCEasePolynomialIn *action = [CCEasePolynomialIn actionWithAction: [_inner reverse]];
    if (_polynomialOrder != kDefaultPolynomial) {
        action.polynomialOrder = _polynomialOrder;
    }
    
    return action;
}
@end

//
// EasePolynomialInOut
//
@implementation CCEasePolynomialInOut
-(void) update: (ccTime) t
{
    if (t < 0.5f) {
        t = powf(t*_intersetValue, _polynomialOrder);
    } else {
        if (_hasInflection) {
            t = powf((t - 1.0f)*_intersetValue, _polynomialOrder) + 1.0f;
        } else {
            t = -powf((t - 1.0f)*_intersetValue, _polynomialOrder) + 1.0f;
        }
    }
    
    [_inner update:t];
}
@end

#pragma mark -
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#pragma mark EaseSin actions

//
// EaseSineIn
//
@implementation CCEaseSineIn
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update:-1*cosf(t * (float)M_PI_2) +1];
=======
	[_inner update:-1*cosf(t * (float)M_PI_2) +1];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseSineOut actionWithAction: [other reverse]];
=======
	return [CCEaseSineOut actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseSineOut
//
@implementation CCEaseSineOut
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update:sinf(t * (float)M_PI_2)];
=======
	[_inner update:sinf(t * (float)M_PI_2)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseSineIn actionWithAction: [other reverse]];
=======
	return [CCEaseSineIn actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseSineInOut
//
@implementation CCEaseSineInOut
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[other update:-0.5f*(cosf( (float)M_PI*t) - 1)];
=======
	[_inner update:-0.5f*(cosf( (float)M_PI*t) - 1)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

#pragma mark -
#pragma mark EaseElastic actions

//
// EaseElastic
//
@implementation CCEaseElastic

<<<<<<< HEAD
@synthesize period = period_;
=======
@synthesize period = _period;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithAction: (CCActionInterval*) action
{
	return [[[self alloc] initWithAction:action period:0.3f] autorelease];
}

+(id) actionWithAction: (CCActionInterval*) action period:(float)period
{
	return [[[self alloc] initWithAction:action period:period] autorelease];
}

-(id) initWithAction: (CCActionInterval*) action
{
	return [self initWithAction:action period:0.3f];
}

-(id) initWithAction: (CCActionInterval*) action period:(float)period
{
	if( (self=[super initWithAction:action]) )
<<<<<<< HEAD
		period_ = period;
=======
		_period = period;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[other copy] autorelease] period:period_];
=======
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[_inner copy] autorelease] period:_period];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(CCActionInterval*) reverse
{
	NSAssert(NO,@"Override me");
	return nil;
}

@end

//
// EaseElasticIn
//

@implementation CCEaseElasticIn
-(void) update: (ccTime) t
{
	ccTime newT = 0;
	if (t == 0 || t == 1)
		newT = t;

	else {
<<<<<<< HEAD
		float s = period_ / 4;
		t = t - 1;
		newT = -powf(2, 10 * t) * sinf( (t-s) *M_PI_X_2 / period_);
	}
	[other update:newT];
=======
		float s = _period / 4;
		t = t - 1;
		newT = -powf(2, 10 * t) * sinf( (t-s) *M_PI_X_2 / _period);
	}
	[_inner update:newT];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseElasticOut actionWithAction: [other reverse] period:period_];
=======
	return [CCEaseElasticOut actionWithAction: [_inner reverse] period:_period];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
// EaseElasticOut
//
@implementation CCEaseElasticOut

-(void) update: (ccTime) t
{
	ccTime newT = 0;
	if (t == 0 || t == 1) {
		newT = t;

	} else {
<<<<<<< HEAD
		float s = period_ / 4;
		newT = powf(2, -10 * t) * sinf( (t-s) *M_PI_X_2 / period_) + 1;
	}
	[other update:newT];
=======
		float s = _period / 4;
		newT = powf(2, -10 * t) * sinf( (t-s) *M_PI_X_2 / _period) + 1;
	}
	[_inner update:newT];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseElasticIn actionWithAction: [other reverse] period:period_];
=======
	return [CCEaseElasticIn actionWithAction: [_inner reverse] period:_period];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
// EaseElasticInOut
//
@implementation CCEaseElasticInOut
-(void) update: (ccTime) t
{
	ccTime newT = 0;

	if( t == 0 || t == 1 )
		newT = t;
	else {
		t = t * 2;
<<<<<<< HEAD
		if(! period_ )
			period_ = 0.3f * 1.5f;
		ccTime s = period_ / 4;

		t = t -1;
		if( t < 0 )
			newT = -0.5f * powf(2, 10 * t) * sinf((t - s) * M_PI_X_2 / period_);
		else
			newT = powf(2, -10 * t) * sinf((t - s) * M_PI_X_2 / period_) * 0.5f + 1;
	}
	[other update:newT];
=======
		if(! _period )
			_period = 0.3f * 1.5f;
		ccTime s = _period / 4;

		t = t -1;
		if( t < 0 )
			newT = -0.5f * powf(2, 10 * t) * sinf((t - s) * M_PI_X_2 / _period);
		else
			newT = powf(2, -10 * t) * sinf((t - s) * M_PI_X_2 / _period) * 0.5f + 1;
	}
	[_inner update:newT];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseElasticInOut actionWithAction: [other reverse] period:period_];
=======
	return [CCEaseElasticInOut actionWithAction: [_inner reverse] period:_period];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

#pragma mark -
#pragma mark EaseBounce actions

//
// EaseBounce
//
@implementation CCEaseBounce
-(ccTime) bounceTime:(ccTime) t
{
	if (t < 1 / 2.75) {
		return 7.5625f * t * t;
	}
	else if (t < 2 / 2.75) {
		t -= 1.5f / 2.75f;
		return 7.5625f * t * t + 0.75f;
	}
	else if (t < 2.5 / 2.75) {
		t -= 2.25f / 2.75f;
		return 7.5625f * t * t + 0.9375f;
	}

	t -= 2.625f / 2.75f;
	return 7.5625f * t * t + 0.984375f;
}
@end

//
// EaseBounceIn
//

@implementation CCEaseBounceIn

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	ccTime newT = 1 - [self bounceTime:1-t];
	[other update:newT];
=======
	ccTime newT = t;
	// prevents rounding errors
	if( t !=0 && t!=1)
		newT = 1 - [self bounceTime:1-t];

	[_inner update:newT];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseBounceOut actionWithAction: [other reverse]];
=======
	return [CCEaseBounceOut actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

@implementation CCEaseBounceOut

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	ccTime newT = [self bounceTime:t];
	[other update:newT];
=======
	ccTime newT = t;
	// prevents rounding errors
	if( t !=0 && t!=1)
		newT = [self bounceTime:t];

	[_inner update:newT];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseBounceIn actionWithAction: [other reverse]];
=======
	return [CCEaseBounceIn actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

@implementation CCEaseBounceInOut

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	ccTime newT = 0;
	if (t < 0.5) {
=======
	ccTime newT;
	// prevents possible rounding errors
	if( t ==0 || t==1)
		newT = t;
	else if (t < 0.5) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		t = t * 2;
		newT = (1 - [self bounceTime:1-t] ) * 0.5f;
	} else
		newT = [self bounceTime:t * 2 - 1] * 0.5f + 0.5f;

<<<<<<< HEAD
	[other update:newT];
=======
	[_inner update:newT];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

#pragma mark -
#pragma mark Ease Back actions

//
// EaseBackIn
//
@implementation CCEaseBackIn

-(void) update: (ccTime) t
{
	ccTime overshoot = 1.70158f;
<<<<<<< HEAD
	[other update: t * t * ((overshoot + 1) * t - overshoot)];
=======
	[_inner update: t * t * ((overshoot + 1) * t - overshoot)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseBackOut actionWithAction: [other reverse]];
=======
	return [CCEaseBackOut actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseBackOut
//
@implementation CCEaseBackOut
-(void) update: (ccTime) t
{
	ccTime overshoot = 1.70158f;

	t = t - 1;
<<<<<<< HEAD
	[other update: t * t * ((overshoot + 1) * t + overshoot) + 1];
=======
	[_inner update: t * t * ((overshoot + 1) * t + overshoot) + 1];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCEaseBackIn actionWithAction: [other reverse]];
=======
	return [CCEaseBackIn actionWithAction: [_inner reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// EaseBackInOut
//
@implementation CCEaseBackInOut

-(void) update: (ccTime) t
{
	ccTime overshoot = 1.70158f * 1.525f;

	t = t * 2;
	if (t < 1)
<<<<<<< HEAD
		[other update: (t * t * ((overshoot + 1) * t - overshoot)) / 2];
	else {
		t = t - 2;
		[other update: (t * t * ((overshoot + 1) * t + overshoot)) / 2 + 1];
=======
		[_inner update: (t * t * ((overshoot + 1) * t - overshoot)) / 2];
	else {
		t = t - 2;
		[_inner update: (t * t * ((overshoot + 1) * t + overshoot)) / 2 + 1];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}
@end
