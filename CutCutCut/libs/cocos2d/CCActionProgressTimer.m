/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (C) 2010 Lam Pham
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


#import "CCActionProgressTimer.h"

#define kProgressTimerCast CCProgressTimer*

@implementation CCProgressTo
+(id) actionWithDuration: (ccTime) t percent: (float) v
{
	return [[[ self alloc] initWithDuration: t percent: v] autorelease];
}

-(id) initWithDuration: (ccTime) t percent: (float) v
{
	if( (self=[super initWithDuration: t] ) )
<<<<<<< HEAD
		to_ = v;
=======
		_to = v;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:duration_ percent:to_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:_duration percent:_to];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(id) aTarget;
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	from_ = [(kProgressTimerCast)target_ percentage];

	// XXX: Is this correct ?
	// Adding it to support CCRepeat
	if( from_ == 100)
		from_ = 0;
=======
	_from = [(kProgressTimerCast)_target percentage];

	// XXX: Is this correct ?
	// Adding it to support CCRepeat
	if( _from == 100)
		_from = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[(kProgressTimerCast)target_ setPercentage: from_ + ( to_ - from_ ) * t];
=======
	[(kProgressTimerCast)_target setPercentage: _from + ( _to - _from ) * t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

@implementation CCProgressFromTo
+(id) actionWithDuration: (ccTime) t from:(float)fromPercentage to:(float) toPercentage
{
	return [[[self alloc] initWithDuration: t from: fromPercentage to: toPercentage] autorelease];
}

-(id) initWithDuration: (ccTime) t from:(float)fromPercentage to:(float) toPercentage
{
	if( (self=[super initWithDuration: t] ) ){
<<<<<<< HEAD
		to_ = toPercentage;
		from_ = fromPercentage;
=======
		_to = toPercentage;
		_from = fromPercentage;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:duration_ from:from_ to:to_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:_duration from:_from to:_to];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_ from:to_ to:from_];
=======
	return [[self class] actionWithDuration:_duration from:_to to:_from];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) startWithTarget:(id) aTarget;
{
	[super startWithTarget:aTarget];
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[(kProgressTimerCast)target_ setPercentage: from_ + ( to_ - from_ ) * t];
=======
	[(kProgressTimerCast)_target setPercentage: _from + ( _to - _from ) * t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end
