/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright 2009 lhunath (Maarten Billemont)
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

#import "CCActionTween.h"


@implementation CCActionTween

+ (id)actionWithDuration:(ccTime)aDuration key:(NSString *)aKey from:(float)aFrom to:(float)aTo {

	return [[[[self class] alloc] initWithDuration:aDuration key:aKey from:aFrom to:aTo] autorelease];
}

- (id)initWithDuration:(ccTime)aDuration key:(NSString *)key from:(float)from to:(float)to {

	if ((self = [super initWithDuration:aDuration])) {

<<<<<<< HEAD
		key_	= [key copy];
		to_		= to;
		from_	= from;
=======
		_key	= [key copy];
		_to		= to;
		_from	= from;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	}

	return self;
}

- (void) dealloc
{
<<<<<<< HEAD
	[key_ release];
=======
	[_key release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

- (void)startWithTarget:aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	delta_ = to_ - from_;
=======
	_delta = _to - _from;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) update:(ccTime) dt
{
<<<<<<< HEAD
	[target_ setValue:[NSNumber numberWithFloat:to_  - delta_ * (1 - dt)] forKey:key_];
=======
	[_target setValue:[NSNumber numberWithFloat:_to  - _delta * (1 - dt)] forKey:_key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_ key:key_ from:to_ to:from_];
=======
	return [[self class] actionWithDuration:_duration key:_key from:_to to:_from];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


@end
