/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2011 Ricardo Quesada
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



#import "CCActionInterval.h"
#import "CCActionInstant.h"
#import "CCSprite.h"
#import "CCSpriteFrame.h"
#import "CCAnimation.h"
#import "CCNode.h"
#import "Support/CGPointExtension.h"

//
// IntervalAction
//
#pragma mark - CCIntervalAction
@implementation CCActionInterval

<<<<<<< HEAD
@synthesize elapsed = elapsed_;
=======
@synthesize elapsed = _elapsed;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

-(id) init
{
	NSAssert(NO, @"IntervalActionInit: Init not supported. Use InitWithDuration");
	[self release];
	return nil;
}

+(id) actionWithDuration: (ccTime) d
{
	return [[[self alloc] initWithDuration:d ] autorelease];
}

-(id) initWithDuration: (ccTime) d
{
	if( (self=[super init]) ) {
<<<<<<< HEAD
		duration_ = d;
=======
		_duration = d;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		// prevent division by 0
		// This comparison could be in step:, but it might decrease the performance
		// by 3% in heavy based action games.
<<<<<<< HEAD
		if( duration_ == 0 )
			duration_ = FLT_EPSILON;
		elapsed_ = 0;
		firstTick_ = YES;
=======
		if( _duration == 0 )
			_duration = FLT_EPSILON;
		_elapsed = 0;
		_firstTick = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] ];
	return copy;
}

- (BOOL) isDone
{
<<<<<<< HEAD
	return (elapsed_ >= duration_);
=======
	return (_elapsed >= _duration);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) step: (ccTime) dt
{
<<<<<<< HEAD
	if( firstTick_ ) {
		firstTick_ = NO;
		elapsed_ = 0;
	} else
		elapsed_ += dt;


	[self update: MAX(0,					// needed for rewind. elapsed could be negative
					  MIN(1, elapsed_/
						  MAX(duration_,FLT_EPSILON)	// division by 0
=======
	if( _firstTick ) {
		_firstTick = NO;
		_elapsed = 0;
	} else
		_elapsed += dt;


	[self update: MAX(0,					// needed for rewind. elapsed could be negative
					  MIN(1, _elapsed/
						  MAX(_duration,FLT_EPSILON)	// division by 0
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
						  )
					  )
	 ];
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	elapsed_ = 0.0f;
	firstTick_ = YES;
=======
	_elapsed = 0.0f;
	_firstTick = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
	NSAssert(NO, @"CCIntervalAction: reverse not implemented.");
	return nil;
}
@end

//
// Sequence
//
#pragma mark - CCSequence
@implementation CCSequence
+(id) actions: (CCFiniteTimeAction*) action1, ...
{
<<<<<<< HEAD
	va_list params;
	va_start(params,action1);
	
=======
	va_list args;
	va_start(args, action1);

	id ret = [self actions:action1 vaList:args];

	va_end(args);

	return  ret;
}

+(id) actions: (CCFiniteTimeAction*) action1 vaList:(va_list)args
{
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	CCFiniteTimeAction *now;
	CCFiniteTimeAction *prev = action1;
	
	while( action1 ) {
<<<<<<< HEAD
		now = va_arg(params,CCFiniteTimeAction*);
=======
		now = va_arg(args,CCFiniteTimeAction*);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		if ( now )
			prev = [self actionOne: prev two: now];
		else
			break;
	}
<<<<<<< HEAD
	va_end(params);
	return prev;
}

+(id) actionsWithArray: (NSArray*) actions
=======

	return prev;
}


+(id) actionWithArray: (NSArray*) actions
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	CCFiniteTimeAction *prev = [actions objectAtIndex:0];
	
	for (NSUInteger i = 1; i < [actions count]; i++)
		prev = [self actionOne:prev two:[actions objectAtIndex:i]];
	
	return prev;
}

+(id) actionOne: (CCFiniteTimeAction*) one two: (CCFiniteTimeAction*) two
{
	return [[[self alloc] initOne:one two:two ] autorelease];
}

-(id) initOne: (CCFiniteTimeAction*) one two: (CCFiniteTimeAction*) two
{
	NSAssert( one!=nil && two!=nil, @"Sequence: arguments must be non-nil");
<<<<<<< HEAD
	NSAssert( one!=actions_[0] && one!=actions_[1], @"Sequence: re-init using the same parameters is not supported");
	NSAssert( two!=actions_[1] && two!=actions_[0], @"Sequence: re-init using the same parameters is not supported");
=======
	NSAssert( one!=_actions[0] && one!=_actions[1], @"Sequence: re-init using the same parameters is not supported");
	NSAssert( two!=_actions[1] && two!=_actions[0], @"Sequence: re-init using the same parameters is not supported");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	
	ccTime d = [one duration] + [two duration];
	
	if( (self=[super initWithDuration: d]) ) {
		
<<<<<<< HEAD
		// XXX: Supports re-init without leaking. Fails if one==one_ || two==two_
		[actions_[0] release];
		[actions_[1] release];
		
		actions_[0] = [one retain];
		actions_[1] = [two retain];
=======
		// XXX: Supports re-init without leaking. Fails if one==_one || two==_two
		[_actions[0] release];
		[_actions[1] release];
		
		_actions[0] = [one retain];
		_actions[1] = [two retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone:zone] initOne:[[actions_[0] copy] autorelease] two:[[actions_[1] copy] autorelease] ];
=======
	CCAction *copy = [[[self class] allocWithZone:zone] initOne:[[_actions[0] copy] autorelease] two:[[_actions[1] copy] autorelease] ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) dealloc
{
<<<<<<< HEAD
	[actions_[0] release];
	[actions_[1] release];
=======
	[_actions[0] release];
	[_actions[1] release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	split_ = [actions_[0] duration] / MAX(duration_, FLT_EPSILON);
	last_ = -1;
=======
	_split = [_actions[0] duration] / MAX(_duration, FLT_EPSILON);
	_last = -1;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
	// Issue #1305
<<<<<<< HEAD
	if( last_ != - 1)
		[actions_[last_] stop];
=======
	if( _last != - 1)
		[_actions[_last] stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super stop];
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	int found = 0;
	ccTime new_t = 0.0f;
	
	if( t < split_ ) {
		// action[0]
		found = 0;
		if( split_ != 0 )
			new_t = t / split_;
=======

	int found = 0;
	ccTime new_t = 0.0f;
	
	if( t < _split ) {
		// action[0]
		found = 0;
		if( _split != 0 )
			new_t = t / _split;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		else
			new_t = 1;

	} else {
		// action[1]
		found = 1;
<<<<<<< HEAD
		if ( split_ == 1 )
			new_t = 1;
		else
			new_t = (t-split_) / (1 - split_ );
=======
		if ( _split == 1 )
			new_t = 1;
		else
			new_t = (t-_split) / (1 - _split );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	
	if ( found==1 ) {
		
<<<<<<< HEAD
		if( last_ == -1 ) {
			// action[0] was skipped, execute it.
			[actions_[0] startWithTarget:target_];
			[actions_[0] update:1.0f];
			[actions_[0] stop];
		}
		else if( last_ == 0 )
		{
			// switching to action 1. stop action 0.
			[actions_[0] update: 1.0f];
			[actions_[0] stop];
		}
	}
	
	// New action. Start it.
	if( found != last_ )
		[actions_[found] startWithTarget:target_];
	
	[actions_[found] update: new_t];
	last_ = found;
=======
		if( _last == -1 ) {
			// action[0] was skipped, execute it.
			[_actions[0] startWithTarget:_target];
			[_actions[0] update:1.0f];
			[_actions[0] stop];
		}
		else if( _last == 0 )
		{
			// switching to action 1. stop action 0.
			[_actions[0] update: 1.0f];
			[_actions[0] stop];
		}
	}
	else if(found==0 && _last==1 )
	{
		// Reverse mode ?
		// XXX: Bug. this case doesn't contemplate when _last==-1, found=0 and in "reverse mode"
		// since it will require a hack to know if an action is on reverse mode or not.
		// "step" should be overriden, and the "reverseMode" value propagated to inner Sequences.
		[_actions[1] update:0];
		[_actions[1] stop];
	}
	
	// Last action found and it is done.
	if( found == _last && [_actions[found] isDone] ) {
		return;
	}

	// New action. Start it.
	if( found != _last )
		[_actions[found] startWithTarget:_target];
	
	[_actions[found] update: new_t];
	_last = found;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [[self class] actionOne: [actions_[1] reverse] two: [actions_[0] reverse ] ];
=======
	return [[self class] actionOne: [_actions[1] reverse] two: [_actions[0] reverse ] ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// Repeat
//
#pragma mark - CCRepeat
@implementation CCRepeat
<<<<<<< HEAD
@synthesize innerAction=innerAction_;
=======
@synthesize innerAction=_innerAction;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithAction:(CCFiniteTimeAction*)action times:(NSUInteger)times
{
	return [[[self alloc] initWithAction:action times:times] autorelease];
}

-(id) initWithAction:(CCFiniteTimeAction*)action times:(NSUInteger)times
{
	ccTime d = [action duration] * times;

	if( (self=[super initWithDuration: d ]) ) {
<<<<<<< HEAD
		times_ = times;
		self.innerAction = action;
		isActionInstant_ = ([action isKindOfClass:[CCActionInstant class]]) ? YES : NO;

		//a instant action needs to be executed one time less in the update method since it uses startWithTarget to execute the action
		if (isActionInstant_) times_ -=1;
		total_ = 0;
=======
		_times = times;
		self.innerAction = action;
		_isActionInstant = ([action isKindOfClass:[CCActionInstant class]]) ? YES : NO;

		//a instant action needs to be executed one time less in the update method since it uses startWithTarget to execute the action
		if (_isActionInstant) _times -=1;
		_total = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[innerAction_ copy] autorelease] times:times_];
=======
	CCAction *copy = [[[self class] allocWithZone:zone] initWithAction:[[_innerAction copy] autorelease] times:_times];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) dealloc
{
<<<<<<< HEAD
	[innerAction_ release];
=======
	[_innerAction release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) startWithTarget:(id)aTarget
{
<<<<<<< HEAD
	total_ = 0;
	nextDt_ = [innerAction_ duration]/duration_;
	[super startWithTarget:aTarget];
	[innerAction_ startWithTarget:aTarget];
=======
	_total = 0;
	_nextDt = [_innerAction duration]/_duration;
	[super startWithTarget:aTarget];
	[_innerAction startWithTarget:aTarget];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
    [innerAction_ stop];
=======
    [_innerAction stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super stop];
}


// issue #80. Instead of hooking step:, hook update: since it can be called by any
// container action like CCRepeat, CCSequence, CCEase, etc..
-(void) update:(ccTime) dt
{
<<<<<<< HEAD
	if (dt >= nextDt_)
	{
		while (dt > nextDt_ && total_ < times_)
		{

			[innerAction_ update:1.0f];
			total_++;

			[innerAction_ stop];
			[innerAction_ startWithTarget:target_];
			nextDt_ += [innerAction_ duration]/duration_;
		}
		
		// fix for issue #1288, incorrect end value of repeat
		if(dt >= 1.0f && total_ < times_) 
		{
			total_++;
		}
		
		// don't set a instantaction back or update it, it has no use because it has no duration
		if (!isActionInstant_)
		{
			if (total_ == times_)
			{
				[innerAction_ update:1];
				[innerAction_ stop];
=======
	if (dt >= _nextDt)
	{
		while (dt > _nextDt && _total < _times)
		{

			[_innerAction update:1.0f];
			_total++;

			[_innerAction stop];
			[_innerAction startWithTarget:_target];
			_nextDt += [_innerAction duration]/_duration;
		}
		
		// fix for issue #1288, incorrect end value of repeat
		if(dt >= 1.0f && _total < _times) 
		{
			_total++;
		}
		
		// don't set a instantaction back or update it, it has no use because it has no duration
		if (!_isActionInstant)
		{
			if (_total == _times)
			{
				[_innerAction update:1];
				[_innerAction stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			}
			else
			{
				// issue #390 prevent jerk, use right update
<<<<<<< HEAD
				[innerAction_ update:dt - (nextDt_ - innerAction_.duration/duration_)];
=======
				[_innerAction update:dt - (_nextDt - _innerAction.duration/_duration)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			}
		}
	}
	else
	{
<<<<<<< HEAD
		[innerAction_ update:fmodf(dt * times_,1.0f)];
=======
		[_innerAction update:fmodf(dt * _times,1.0f)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(BOOL) isDone
{
<<<<<<< HEAD
	return ( total_ == times_ );
=======
	return ( _total == _times );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithAction:[innerAction_ reverse] times:times_];
=======
	return [[self class] actionWithAction:[_innerAction reverse] times:_times];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// Spawn
//
#pragma mark - CCSpawn

@implementation CCSpawn
+(id) actions: (CCFiniteTimeAction*) action1, ...
{
<<<<<<< HEAD
	va_list params;
	va_start(params,action1);

	CCFiniteTimeAction *now;
	CCFiniteTimeAction *prev = action1;

	while( action1 ) {
		now = va_arg(params,CCFiniteTimeAction*);
=======
	va_list args;
	va_start(args, action1);

	id ret = [self actions:action1 vaList:args];

	va_end(args);
	return ret;
}

+(id) actions: (CCFiniteTimeAction*) action1 vaList:(va_list)args
{
	CCFiniteTimeAction *now;
	CCFiniteTimeAction *prev = action1;
	
	while( action1 ) {
		now = va_arg(args,CCFiniteTimeAction*);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		if ( now )
			prev = [self actionOne: prev two: now];
		else
			break;
	}
<<<<<<< HEAD
	va_end(params);
	return prev;
}

+(id) actionsWithArray: (NSArray*) actions
=======

	return prev;
}


+(id) actionWithArray: (NSArray*) actions
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	CCFiniteTimeAction *prev = [actions objectAtIndex:0];

	for (NSUInteger i = 1; i < [actions count]; i++)
		prev = [self actionOne:prev two:[actions objectAtIndex:i]];

	return prev;
}

+(id) actionOne: (CCFiniteTimeAction*) one two: (CCFiniteTimeAction*) two
{
	return [[[self alloc] initOne:one two:two ] autorelease];
}

-(id) initOne: (CCFiniteTimeAction*) one two: (CCFiniteTimeAction*) two
{
	NSAssert( one!=nil && two!=nil, @"Spawn: arguments must be non-nil");
<<<<<<< HEAD
	NSAssert( one!=one_ && one!=two_, @"Spawn: reinit using same parameters is not supported");
	NSAssert( two!=two_ && two!=one_, @"Spawn: reinit using same parameters is not supported");
=======
	NSAssert( one!=_one && one!=_two, @"Spawn: reinit using same parameters is not supported");
	NSAssert( two!=_two && two!=_one, @"Spawn: reinit using same parameters is not supported");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	ccTime d1 = [one duration];
	ccTime d2 = [two duration];

	if( (self=[super initWithDuration: MAX(d1,d2)] ) ) {

<<<<<<< HEAD
		// XXX: Supports re-init without leaking. Fails if one==one_ || two==two_
		[one_ release];
		[two_ release];

		one_ = one;
		two_ = two;

		if( d1 > d2 )
			two_ = [CCSequence actionOne:two two:[CCDelayTime actionWithDuration: (d1-d2)] ];
		else if( d1 < d2)
			one_ = [CCSequence actionOne:one two: [CCDelayTime actionWithDuration: (d2-d1)] ];

		[one_ retain];
		[two_ retain];
=======
		// XXX: Supports re-init without leaking. Fails if one==_one || two==_two
		[_one release];
		[_two release];

		_one = one;
		_two = two;

		if( d1 > d2 )
			_two = [CCSequence actionOne:two two:[CCDelayTime actionWithDuration: (d1-d2)] ];
		else if( d1 < d2)
			_one = [CCSequence actionOne:one two: [CCDelayTime actionWithDuration: (d2-d1)] ];

		[_one retain];
		[_two retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initOne: [[one_ copy] autorelease] two: [[two_ copy] autorelease] ];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initOne: [[_one copy] autorelease] two: [[_two copy] autorelease] ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) dealloc
{
<<<<<<< HEAD
	[one_ release];
	[two_ release];
=======
	[_one release];
	[_two release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[one_ startWithTarget:target_];
	[two_ startWithTarget:target_];
=======
	[_one startWithTarget:_target];
	[_two startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
	[one_ stop];
	[two_ stop];
=======
	[_one stop];
	[_two stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super stop];
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[one_ update:t];
	[two_ update:t];
=======
	[_one update:t];
	[_two update:t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [[self class] actionOne: [one_ reverse] two: [two_ reverse ] ];
=======
	return [[self class] actionOne: [_one reverse] two: [_two reverse ] ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// RotateTo
//
#pragma mark - CCRotateTo

@implementation CCRotateTo
+(id) actionWithDuration: (ccTime) t angle:(float) a
{
	return [[[self alloc] initWithDuration:t angle:a ] autorelease];
}

-(id) initWithDuration: (ccTime) t angle:(float) a
{
	if( (self=[super initWithDuration: t]) )
<<<<<<< HEAD
		dstAngle_ = a;

=======
		_dstAngleX = _dstAngleY = a;

	return self;
}

+(id) actionWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY
{
	return [[[self alloc] initWithDuration:t angleX:aX angleY:aY ] autorelease];
}

-(id) initWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY
{
	if( (self=[super initWithDuration: t]) ){
		_dstAngleX = aX;
    _dstAngleY = aY;
  }
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] angle:dstAngle_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] angleX:_dstAngleX angleY:_dstAngleY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];

<<<<<<< HEAD
	startAngle_ = [target_ rotation];
	if (startAngle_ > 0)
		startAngle_ = fmodf(startAngle_, 360.0f);
	else
		startAngle_ = fmodf(startAngle_, -360.0f);

	diffAngle_ =dstAngle_ - startAngle_;
	if (diffAngle_ > 180)
		diffAngle_ -= 360;
	if (diffAngle_ < -180)
		diffAngle_ += 360;
}
-(void) update: (ccTime) t
{
	[target_ setRotation: startAngle_ + diffAngle_ * t];
=======
  //Calculate X
	_startAngleX = [_target rotationX];
	if (_startAngleX > 0)
		_startAngleX = fmodf(_startAngleX, 360.0f);
	else
		_startAngleX = fmodf(_startAngleX, -360.0f);

	_diffAngleX = _dstAngleX - _startAngleX;
	if (_diffAngleX > 180)
		_diffAngleX -= 360;
	if (_diffAngleX < -180)
		_diffAngleX += 360;
  
	
  //Calculate Y: It's duplicated from calculating X since the rotation wrap should be the same
	_startAngleY = [_target rotationY];
	if (_startAngleY > 0)
		_startAngleY = fmodf(_startAngleY, 360.0f);
	else
		_startAngleY = fmodf(_startAngleY, -360.0f);
  
	_diffAngleY = _dstAngleY - _startAngleY;
	if (_diffAngleY > 180)
		_diffAngleY -= 360;
	if (_diffAngleY < -180)
		_diffAngleY += 360;
}
-(void) update: (ccTime) t
{
	[_target setRotationX: _startAngleX + _diffAngleX * t];
	[_target setRotationY: _startAngleY + _diffAngleY * t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


//
// RotateBy
//
<<<<<<< HEAD
#pragma mark - CCRotateBy
=======
#pragma mark - RotateBy
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@implementation CCRotateBy
+(id) actionWithDuration: (ccTime) t angle:(float) a
{
	return [[[self alloc] initWithDuration:t angle:a ] autorelease];
}

-(id) initWithDuration: (ccTime) t angle:(float) a
{
	if( (self=[super initWithDuration: t]) )
<<<<<<< HEAD
		angle_ = a;
=======
		_angleX = _angleY = a;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

<<<<<<< HEAD
-(id) copyWithZone: (NSZone*) zone
{
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] angle: angle_];
=======
+(id) actionWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY
{
	return [[[self alloc] initWithDuration:t angleX:aX angleY:aY ] autorelease];
}

-(id) initWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY
{
	if( (self=[super initWithDuration: t]) ){
		_angleX = aX;
    _angleY = aY;
  }
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] angleX: _angleX angleY:_angleY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	startAngle_ = [target_ rotation];
=======
	_startAngleX = [_target rotationX];
	_startAngleY = [_target rotationY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
	// XXX: shall I add % 360
<<<<<<< HEAD
	[target_ setRotation: (startAngle_ +angle_ * t )];
=======
	[_target setRotationX: (_startAngleX + _angleX * t )];
	[_target setRotationY: (_startAngleY + _angleY * t )];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_ angle:-angle_];
=======
	return [[self class] actionWithDuration:_duration angleX:-_angleX angleY:-_angleY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
<<<<<<< HEAD
// MoveTo
//
#pragma mark - CCMoveTo

@implementation CCMoveTo
=======
// MoveBy
//
#pragma mark - MoveBy

@implementation CCMoveBy
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) actionWithDuration: (ccTime) t position: (CGPoint) p
{
	return [[[self alloc] initWithDuration:t position:p ] autorelease];
}

-(id) initWithDuration: (ccTime) t position: (CGPoint) p
{
	if( (self=[super initWithDuration: t]) )
<<<<<<< HEAD
		endPosition_ = p;

=======
		_positionDelta = p;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] position: endPosition_];
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
	startPosition_ = [(CCNode*)target_ position];
	delta_ = ccpSub( endPosition_, startPosition_ );
=======
	return [[[self class] allocWithZone: zone] initWithDuration:[self duration] position:_positionDelta];
}

-(void) startWithTarget:(CCNode *)target
{
	[super startWithTarget:target];
	_previousPos = _startPos = [target position];
}

-(CCActionInterval*) reverse
{
	return [[self class] actionWithDuration:_duration position:ccp( -_positionDelta.x, -_positionDelta.y)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[target_ setPosition: ccp( (startPosition_.x + delta_.x * t ), (startPosition_.y + delta_.y * t ) )];
=======

	CCNode *node = (CCNode*)_target;

#if CC_ENABLE_STACKABLE_ACTIONS
	CGPoint currentPos = [node position];
	CGPoint diff = ccpSub(currentPos, _previousPos);
	_startPos = ccpAdd( _startPos, diff);
	CGPoint newPos =  ccpAdd( _startPos, ccpMult(_positionDelta, t) );
	[_target setPosition: newPos];
	_previousPos = newPos;
#else
	[node setPosition: ccpAdd( _startPos, ccpMult(_positionDelta, t))];
#endif // CC_ENABLE_STACKABLE_ACTIONS
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
<<<<<<< HEAD
// MoveBy
//
#pragma mark - CCMoveBy

@implementation CCMoveBy
=======
// MoveTo
//
#pragma mark -
#pragma mark MoveTo

@implementation CCMoveTo
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) actionWithDuration: (ccTime) t position: (CGPoint) p
{
	return [[[self alloc] initWithDuration:t position:p ] autorelease];
}

-(id) initWithDuration: (ccTime) t position: (CGPoint) p
{
<<<<<<< HEAD
	if( (self=[super initWithDuration: t]) )
		delta_ = p;
=======
	if( (self=[super initWithDuration: t]) ) {
		_endPosition = p;
    }
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] position: delta_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] position: _endPosition];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
<<<<<<< HEAD
	CGPoint dTmp = delta_;
	[super startWithTarget:aTarget];
	delta_ = dTmp;
}

-(CCActionInterval*) reverse
{
	return [[self class] actionWithDuration:duration_ position:ccp( -delta_.x, -delta_.y)];
}
@end


=======
	[super startWithTarget:aTarget];
	_positionDelta = ccpSub( _endPosition, [(CCNode*)_target position] );
}

@end

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
//
// SkewTo
//
#pragma mark - CCSkewTo

@implementation CCSkewTo
+(id) actionWithDuration:(ccTime)t skewX:(float)sx skewY:(float)sy
{
	return [[[self alloc] initWithDuration: t skewX:sx skewY:sy] autorelease];
}

-(id) initWithDuration:(ccTime)t skewX:(float)sx skewY:(float)sy
{
	if( (self=[super initWithDuration:t]) ) {
<<<<<<< HEAD
		endSkewX_ = sx;
		endSkewY_ = sy;
=======
		_endSkewX = sx;
		_endSkewY = sy;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] skewX:endSkewX_ skewY:endSkewY_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] skewX:_endSkewX skewY:_endSkewY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];

<<<<<<< HEAD
	startSkewX_ = [target_ skewX];

	if (startSkewX_ > 0)
		startSkewX_ = fmodf(startSkewX_, 180.0f);
	else
		startSkewX_ = fmodf(startSkewX_, -180.0f);

	deltaX_ = endSkewX_ - startSkewX_;

	if ( deltaX_ > 180 ) {
		deltaX_ -= 360;
	}
	if ( deltaX_ < -180 ) {
		deltaX_ += 360;
	}

	startSkewY_ = [target_ skewY];

	if (startSkewY_ > 0)
		startSkewY_ = fmodf(startSkewY_, 360.0f);
	else
		startSkewY_ = fmodf(startSkewY_, -360.0f);

	deltaY_ = endSkewY_ - startSkewY_;

	if ( deltaY_ > 180 ) {
		deltaY_ -= 360;
	}
	if ( deltaY_ < -180 ) {
		deltaY_ += 360;
=======
	_startSkewX = [_target skewX];

	if (_startSkewX > 0)
		_startSkewX = fmodf(_startSkewX, 180.0f);
	else
		_startSkewX = fmodf(_startSkewX, -180.0f);

	_deltaX = _endSkewX - _startSkewX;

	if ( _deltaX > 180 ) {
		_deltaX -= 360;
	}
	if ( _deltaX < -180 ) {
		_deltaX += 360;
	}

	_startSkewY = [_target skewY];

	if (_startSkewY > 0)
		_startSkewY = fmodf(_startSkewY, 360.0f);
	else
		_startSkewY = fmodf(_startSkewY, -360.0f);

	_deltaY = _endSkewY - _startSkewY;

	if ( _deltaY > 180 ) {
		_deltaY -= 360;
	}
	if ( _deltaY < -180 ) {
		_deltaY += 360;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[target_ setSkewX: (startSkewX_ + deltaX_ * t ) ];
	[target_ setSkewY: (startSkewY_ + deltaY_ * t ) ];
=======
	[_target setSkewX: (_startSkewX + _deltaX * t ) ];
	[_target setSkewY: (_startSkewY + _deltaY * t ) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
// CCSkewBy
//
#pragma mark - CCSkewBy

@implementation CCSkewBy

-(id) initWithDuration:(ccTime)t skewX:(float)deltaSkewX skewY:(float)deltaSkewY
{
	if( (self=[super initWithDuration:t skewX:deltaSkewX skewY:deltaSkewY]) ) {
<<<<<<< HEAD
		skewX_ = deltaSkewX;
		skewY_ = deltaSkewY;
=======
		_skewX = deltaSkewX;
		_skewY = deltaSkewY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	deltaX_ = skewX_;
	deltaY_ = skewY_;
	endSkewX_ = startSkewX_ + deltaX_;
	endSkewY_ = startSkewY_ + deltaY_;
=======
	_deltaX = _skewX;
	_deltaY = _skewY;
	_endSkewX = _startSkewX + _deltaX;
	_endSkewY = _startSkewY + _deltaY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_ skewX:-skewX_ skewY:-skewY_];
=======
	return [[self class] actionWithDuration:_duration skewX:-_skewX skewY:-_skewY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


//
// JumpBy
//
#pragma mark - CCJumpBy

@implementation CCJumpBy
+(id) actionWithDuration: (ccTime) t position: (CGPoint) pos height: (ccTime) h jumps:(NSUInteger)j
{
	return [[[self alloc] initWithDuration: t position: pos height: h jumps:j] autorelease];
}

-(id) initWithDuration: (ccTime) t position: (CGPoint) pos height: (ccTime) h jumps:(NSUInteger)j
{
	if( (self=[super initWithDuration:t]) ) {
<<<<<<< HEAD
		delta_ = pos;
		height_ = h;
		jumps_ = j;
=======
		_delta = pos;
		_height = h;
		_jumps = j;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] position:delta_ height:height_ jumps:jumps_];
	return copy;
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
	startPosition_ = [(CCNode*)target_ position];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] position:_delta height:_height jumps:_jumps];
	return copy;
}

-(void) startWithTarget:(id)target
{
	[super startWithTarget:target];
	_previousPos = _startPosition = [(CCNode*)_target position];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
	// Sin jump. Less realistic
<<<<<<< HEAD
//	ccTime y = height * fabsf( sinf(t * (CGFloat)M_PI * jumps ) );
//	y += delta.y * t;
//	ccTime x = delta.x * t;
//	[target setPosition: ccp( startPosition.x + x, startPosition.y + y )];

	// parabolic jump (since v0.8.2)
	ccTime frac = fmodf( t * jumps_, 1.0f );
	ccTime y = height_ * 4 * frac * (1 - frac);
	y += delta_.y * t;
	ccTime x = delta_.x * t;
	[target_ setPosition: ccp( startPosition_.x + x, startPosition_.y + y )];

=======
//	ccTime y = _height * fabsf( sinf(t * (CGFloat)M_PI * _jumps ) );
//	y += _delta.y * dt;
	
//	// parabolic jump (since v0.8.2)
	CGFloat frac = fmodf( t * _jumps, 1.0f );
	CGFloat y = _height * 4 * frac * (1 - frac);
	y += _delta.y * t;

	CGFloat x = _delta.x * t;
	
	CCNode *node = (CCNode*)_target;

#if CC_ENABLE_STACKABLE_ACTIONS
	CGPoint currentPos = [node position];
	
	CGPoint diff = ccpSub( currentPos, _previousPos );
	_startPosition = ccpAdd( diff, _startPosition);
	
	CGPoint newPos = ccpAdd( _startPosition, ccp(x,y));
	[node setPosition:newPos];
	
	_previousPos = newPos;
#else
	[node setPosition: ccpAdd( _startPosition, ccp(x,y))];
#endif // !CC_ENABLE_STACKABLE_ACTIONS
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_ position: ccp(-delta_.x,-delta_.y) height:height_ jumps:jumps_];
=======
	return [[self class] actionWithDuration:_duration position: ccp(-_delta.x,-_delta.y) height:_height jumps:_jumps];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// JumpTo
//
#pragma mark - CCJumpTo

@implementation CCJumpTo
-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	delta_ = ccp( delta_.x - startPosition_.x, delta_.y - startPosition_.y );
=======
	_delta = ccp( _delta.x - _startPosition.x, _delta.y - _startPosition.y );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


#pragma mark - CCBezierBy

// Bezier cubic formula:
//	((1 - t) + t)3 = 1
// Expands to…
//   (1 - t)3 + 3t(1-t)2 + 3t2(1 - t) + t3 = 1
<<<<<<< HEAD
static inline float bezierat( float a, float b, float c, float d, ccTime t )
=======
static inline CGFloat bezierat( float a, float b, float c, float d, ccTime t )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	return (powf(1-t,3) * a +
			3*t*(powf(1-t,2))*b +
			3*powf(t,2)*(1-t)*c +
			powf(t,3)*d );
}

//
// BezierBy
//
@implementation CCBezierBy
+(id) actionWithDuration: (ccTime) t bezier:(ccBezierConfig) c
{
	return [[[self alloc] initWithDuration:t bezier:c ] autorelease];
}

-(id) initWithDuration: (ccTime) t bezier:(ccBezierConfig) c
{
	if( (self=[super initWithDuration: t]) ) {
<<<<<<< HEAD
		config_ = c;
=======
		_config = c;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] bezier:config_];
    return copy;
=======
	return [[[self class] allocWithZone: zone] initWithDuration:[self duration] bezier:_config];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	startPosition_ = [(CCNode*)target_ position];
=======
	_previousPosition = _startPosition = [(CCNode*)_target position];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	float xa = 0;
	float xb = config_.controlPoint_1.x;
	float xc = config_.controlPoint_2.x;
	float xd = config_.endPosition.x;

	float ya = 0;
	float yb = config_.controlPoint_1.y;
	float yc = config_.controlPoint_2.y;
	float yd = config_.endPosition.y;

	float x = bezierat(xa, xb, xc, xd, t);
	float y = bezierat(ya, yb, yc, yd, t);
	[target_ setPosition:  ccpAdd( startPosition_, ccp(x,y))];
=======
	CGFloat xa = 0;
	CGFloat xb = _config.controlPoint_1.x;
	CGFloat xc = _config.controlPoint_2.x;
	CGFloat xd = _config.endPosition.x;

	CGFloat ya = 0;
	CGFloat yb = _config.controlPoint_1.y;
	CGFloat yc = _config.controlPoint_2.y;
	CGFloat yd = _config.endPosition.y;

	CGFloat x = bezierat(xa, xb, xc, xd, t);
	CGFloat y = bezierat(ya, yb, yc, yd, t);
	
	CCNode *node = (CCNode*)_target;

#if CC_ENABLE_STACKABLE_ACTIONS
	CGPoint currentPos = [node position];
	CGPoint diff = ccpSub(currentPos, _previousPosition);
	_startPosition = ccpAdd( _startPosition, diff);

	CGPoint newPos = ccpAdd( _startPosition, ccp(x,y));
	[node setPosition: newPos];
	
	_previousPosition = newPos;
#else
	[node setPosition: ccpAdd( _startPosition, ccp(x,y))];
#endif // !CC_ENABLE_STACKABLE_ACTIONS
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
	ccBezierConfig r;

<<<<<<< HEAD
	r.endPosition	 = ccpNeg(config_.endPosition);
	r.controlPoint_1 = ccpAdd(config_.controlPoint_2, ccpNeg(config_.endPosition));
	r.controlPoint_2 = ccpAdd(config_.controlPoint_1, ccpNeg(config_.endPosition));
=======
	r.endPosition	 = ccpNeg(_config.endPosition);
	r.controlPoint_1 = ccpAdd(_config.controlPoint_2, ccpNeg(_config.endPosition));
	r.controlPoint_2 = ccpAdd(_config.controlPoint_1, ccpNeg(_config.endPosition));
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CCBezierBy *action = [[self class] actionWithDuration:[self duration] bezier:r];
	return action;
}
@end

//
// BezierTo
//
#pragma mark - CCBezierTo
@implementation CCBezierTo
<<<<<<< HEAD
-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
	config_.controlPoint_1 = ccpSub(config_.controlPoint_1, startPosition_);
	config_.controlPoint_2 = ccpSub(config_.controlPoint_2, startPosition_);
	config_.endPosition = ccpSub(config_.endPosition, startPosition_);
}
=======
-(id) initWithDuration: (ccTime) t bezier:(ccBezierConfig) c
{
	if( (self=[super initWithDuration: t]) ) {
		_toConfig = c;
	}
	return self;
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
	_config.controlPoint_1 = ccpSub(_toConfig.controlPoint_1, _startPosition);
	_config.controlPoint_2 = ccpSub(_toConfig.controlPoint_2, _startPosition);
	_config.endPosition = ccpSub(_toConfig.endPosition, _startPosition);
}

-(id) copyWithZone: (NSZone*) zone
{
	return [[[self class] allocWithZone: zone] initWithDuration:[self duration] bezier:_toConfig];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end


//
// ScaleTo
//
#pragma mark - CCScaleTo
@implementation CCScaleTo
+(id) actionWithDuration: (ccTime) t scale:(float) s
{
	return [[[self alloc] initWithDuration: t scale:s] autorelease];
}

-(id) initWithDuration: (ccTime) t scale:(float) s
{
	if( (self=[super initWithDuration: t]) ) {
<<<<<<< HEAD
		endScaleX_ = s;
		endScaleY_ = s;
=======
		_endScaleX = s;
		_endScaleY = s;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

+(id) actionWithDuration: (ccTime) t scaleX:(float)sx scaleY:(float)sy
{
	return [[[self alloc] initWithDuration: t scaleX:sx scaleY:sy] autorelease];
}

-(id) initWithDuration: (ccTime) t scaleX:(float)sx scaleY:(float)sy
{
	if( (self=[super initWithDuration: t]) ) {
<<<<<<< HEAD
		endScaleX_ = sx;
		endScaleY_ = sy;
=======
		_endScaleX = sx;
		_endScaleY = sy;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] scaleX:endScaleX_ scaleY:endScaleY_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] scaleX:_endScaleX scaleY:_endScaleY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	startScaleX_ = [target_ scaleX];
	startScaleY_ = [target_ scaleY];
	deltaX_ = endScaleX_ - startScaleX_;
	deltaY_ = endScaleY_ - startScaleY_;
=======
	_startScaleX = [_target scaleX];
	_startScaleY = [_target scaleY];
	_deltaX = _endScaleX - _startScaleX;
	_deltaY = _endScaleY - _startScaleY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[target_ setScaleX: (startScaleX_ + deltaX_ * t ) ];
	[target_ setScaleY: (startScaleY_ + deltaY_ * t ) ];
=======
	[_target setScaleX: (_startScaleX + _deltaX * t ) ];
	[_target setScaleY: (_startScaleY + _deltaY * t ) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// ScaleBy
//
#pragma mark - CCScaleBy
@implementation CCScaleBy
-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	deltaX_ = startScaleX_ * endScaleX_ - startScaleX_;
	deltaY_ = startScaleY_ * endScaleY_ - startScaleY_;
=======
	_deltaX = _startScaleX * _endScaleX - _startScaleX;
	_deltaY = _startScaleY * _endScaleY - _startScaleY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_ scaleX:1/endScaleX_ scaleY:1/endScaleY_];
=======
	return [[self class] actionWithDuration:_duration scaleX:1/_endScaleX scaleY:1/_endScaleY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// Blink
//
#pragma mark - CCBlink
@implementation CCBlink
+(id) actionWithDuration: (ccTime) t blinks: (NSUInteger) b
{
	return [[[ self alloc] initWithDuration: t blinks: b] autorelease];
}

-(id) initWithDuration: (ccTime) t blinks: (NSUInteger) b
{
	if( (self=[super initWithDuration: t] ) )
<<<<<<< HEAD
		times_ = b;
=======
		_times = b;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] blinks: times_];
	return copy;
}

-(void) update: (ccTime) t
{
	if( ! [self isDone] ) {
		ccTime slice = 1.0f / times_;
		ccTime m = fmodf(t, slice);
		[target_ setVisible: (m > slice/2) ? YES : NO];
	}
}

-(CCActionInterval*) reverse
{
	// return 'self'
	return [[self class] actionWithDuration:duration_ blinks: times_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] blinks: _times];
	return copy;
}

-(void) startWithTarget:(id)target
{
	[super startWithTarget:target];
	_originalState = [target visible];
}

-(void) update: (ccTime) t
{
	if( ! [self isDone] ) {
		ccTime slice = 1.0f / _times;
		ccTime m = fmodf(t, slice);
		[_target setVisible: (m > slice/2) ? YES : NO];
	}
}

-(void) stop
{
	[_target setVisible:_originalState];
	[super stop];
}

-(CCActionInterval*) reverse
{
	// return 'self'
	return [[self class] actionWithDuration:_duration blinks: _times];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// FadeIn
//
#pragma mark - CCFadeIn
@implementation CCFadeIn
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[(id<CCRGBAProtocol>) target_ setOpacity: 255 *t];
=======
	[(id<CCRGBAProtocol>) _target setOpacity: 255 *t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCFadeOut actionWithDuration:duration_];
=======
	return [CCFadeOut actionWithDuration:_duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// FadeOut
//
#pragma mark - CCFadeOut
@implementation CCFadeOut
-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[(id<CCRGBAProtocol>) target_ setOpacity: 255 *(1-t)];
=======
	[(id<CCRGBAProtocol>) _target setOpacity: 255 *(1-t)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCFadeIn actionWithDuration:duration_];
=======
	return [CCFadeIn actionWithDuration:_duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// FadeTo
//
#pragma mark - CCFadeTo
@implementation CCFadeTo
+(id) actionWithDuration: (ccTime) t opacity: (GLubyte) o
{
	return [[[ self alloc] initWithDuration: t opacity: o] autorelease];
}

-(id) initWithDuration: (ccTime) t opacity: (GLubyte) o
{
	if( (self=[super initWithDuration: t] ) )
<<<<<<< HEAD
		toOpacity_ = o;
=======
		_toOpacity = o;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] opacity:toOpacity_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] opacity:_toOpacity];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(CCNode *)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	fromOpacity_ = [(id<CCRGBAProtocol>)target_ opacity];
=======
	_fromOpacity = [(id<CCRGBAProtocol>)_target opacity];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	[(id<CCRGBAProtocol>)target_ setOpacity:fromOpacity_ + ( toOpacity_ - fromOpacity_ ) * t];
=======
	[(id<CCRGBAProtocol>)_target setOpacity:_fromOpacity + ( _toOpacity - _fromOpacity ) * t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// TintTo
//
#pragma mark - CCTintTo
@implementation CCTintTo
+(id) actionWithDuration:(ccTime)t red:(GLubyte)r green:(GLubyte)g blue:(GLubyte)b
{
	return [[(CCTintTo*)[ self alloc] initWithDuration:t red:r green:g blue:b] autorelease];
}

-(id) initWithDuration: (ccTime) t red:(GLubyte)r green:(GLubyte)g blue:(GLubyte)b
{
	if( (self=[super initWithDuration:t] ) )
<<<<<<< HEAD
		to_ = ccc3(r,g,b);
=======
		_to = ccc3(r,g,b);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [(CCTintTo*)[[self class] allocWithZone: zone] initWithDuration:[self duration] red:to_.r green:to_.g blue:to_.b];
=======
	CCAction *copy = [(CCTintTo*)[[self class] allocWithZone: zone] initWithDuration:[self duration] red:_to.r green:_to.g blue:_to.b];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];

<<<<<<< HEAD
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) target_;
	from_ = [tn color];
=======
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) _target;
	_from = [tn color];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) target_;
	[tn setColor:ccc3(from_.r + (to_.r - from_.r) * t, from_.g + (to_.g - from_.g) * t, from_.b + (to_.b - from_.b) * t)];
=======
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) _target;
	[tn setColor:ccc3(_from.r + (_to.r - _from.r) * t, _from.g + (_to.g - _from.g) * t, _from.b + (_to.b - _from.b) * t)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// TintBy
//
#pragma mark - CCTintBy
@implementation CCTintBy
+(id) actionWithDuration:(ccTime)t red:(GLshort)r green:(GLshort)g blue:(GLshort)b
{
	return [[(CCTintBy*)[ self alloc] initWithDuration:t red:r green:g blue:b] autorelease];
}

-(id) initWithDuration:(ccTime)t red:(GLshort)r green:(GLshort)g blue:(GLshort)b
{
	if( (self=[super initWithDuration: t] ) ) {
<<<<<<< HEAD
		deltaR_ = r;
		deltaG_ = g;
		deltaB_ = b;
=======
		_deltaR = r;
		_deltaG = g;
		_deltaB = b;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	return[(CCTintBy*)[[self class] allocWithZone: zone] initWithDuration: [self duration] red:deltaR_ green:deltaG_ blue:deltaB_];
=======
	return[(CCTintBy*)[[self class] allocWithZone: zone] initWithDuration: [self duration] red:_deltaR green:_deltaG blue:_deltaB];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];

<<<<<<< HEAD
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) target_;
	ccColor3B color = [tn color];
	fromR_ = color.r;
	fromG_ = color.g;
	fromB_ = color.b;
=======
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) _target;
	ccColor3B color = [tn color];
	_fromR = color.r;
	_fromG = color.g;
	_fromB = color.b;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) update: (ccTime) t
{
<<<<<<< HEAD
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) target_;
	[tn setColor:ccc3( fromR_ + deltaR_ * t, fromG_ + deltaG_ * t, fromB_ + deltaB_ * t)];
=======
	id<CCRGBAProtocol> tn = (id<CCRGBAProtocol>) _target;
	[tn setColor:ccc3( _fromR + _deltaR * t, _fromG + _deltaG * t, _fromB + _deltaB * t)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [CCTintBy actionWithDuration:duration_ red:-deltaR_ green:-deltaG_ blue:-deltaB_];
=======
	return [CCTintBy actionWithDuration:_duration red:-_deltaR green:-_deltaG blue:-_deltaB];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// DelayTime
//
#pragma mark - CCDelayTime
@implementation CCDelayTime
-(void) update: (ccTime) t
{
	return;
}

-(id)reverse
{
<<<<<<< HEAD
	return [[self class] actionWithDuration:duration_];
=======
	return [[self class] actionWithDuration:_duration];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// ReverseTime
//
#pragma mark - CCReverseTime
@implementation CCReverseTime
+(id) actionWithAction: (CCFiniteTimeAction*) action
{
	// casting to prevent warnings
	CCReverseTime *a = [self alloc];
	return [[a initWithAction:action] autorelease];
}

-(id) initWithAction: (CCFiniteTimeAction*) action
{
	NSAssert(action != nil, @"CCReverseTime: action should not be nil");
<<<<<<< HEAD
	NSAssert(action != other_, @"CCReverseTime: re-init doesn't support using the same arguments");

	if( (self=[super initWithDuration: [action duration]]) ) {
		// Don't leak if action is reused
		[other_ release];
		other_ = [action retain];
=======
	NSAssert(action != _other, @"CCReverseTime: re-init doesn't support using the same arguments");

	if( (self=[super initWithDuration: [action duration]]) ) {
		// Don't leak if action is reused
		[_other release];
		_other = [action retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	return [[[self class] allocWithZone: zone] initWithAction:[[other_ copy] autorelease] ];
=======
	return [[[self class] allocWithZone: zone] initWithAction:[[_other copy] autorelease] ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
<<<<<<< HEAD
	[other_ release];
=======
	[_other release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[other_ startWithTarget:target_];
=======
	[_other startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
	[other_ stop];
=======
	[_other stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super stop];
}

-(void) update:(ccTime)t
{
<<<<<<< HEAD
	[other_ update:1-t];
=======
	[_other update:1-t];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) reverse
{
<<<<<<< HEAD
	return [[other_ copy] autorelease];
=======
	return [[_other copy] autorelease];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// Animate
//

#pragma mark - CCAnimate
@implementation CCAnimate

<<<<<<< HEAD
@synthesize animation = animation_;
=======
@synthesize animation = _animation;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithAnimation: (CCAnimation*)anim
{
	return [[[self alloc] initWithAnimation:anim] autorelease];
}

// delegate initializer
-(id) initWithAnimation:(CCAnimation*)anim
{
	NSAssert( anim!=nil, @"Animate: argument Animation must be non-nil");
	
	float singleDuration = anim.duration;

	if( (self=[super initWithDuration:singleDuration * anim.loops] ) ) {

<<<<<<< HEAD
		nextFrame_ = 0;
		self.animation = anim;
		origFrame_ = nil;
		executedLoops_ = 0;
		
		splitTimes_ = [[NSMutableArray alloc] initWithCapacity:anim.frames.count];
=======
		_nextFrame = 0;
		self.animation = anim;
		_origFrame = nil;
		_executedLoops = 0;
		
		_splitTimes = [[NSMutableArray alloc] initWithCapacity:anim.frames.count];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		
		float accumUnitsOfTime = 0;
		float newUnitOfTimeValue = singleDuration / anim.totalDelayUnits;
		
		for( CCAnimationFrame *frame in anim.frames ) {

			NSNumber *value = [NSNumber numberWithFloat: (accumUnitsOfTime * newUnitOfTimeValue) / singleDuration];
			accumUnitsOfTime += frame.delayUnits;

<<<<<<< HEAD
			[splitTimes_ addObject:value];
=======
			[_splitTimes addObject:value];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}		
	}
	return self;
}


-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	return [[[self class] allocWithZone: zone] initWithAnimation:[[animation_ copy]autorelease] ];
=======
	return [[[self class] allocWithZone: zone] initWithAnimation:[[_animation copy]autorelease] ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
<<<<<<< HEAD
	[splitTimes_ release];
	[animation_ release];
	[origFrame_ release];
=======
	[_splitTimes release];
	[_animation release];
	[_origFrame release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	CCSprite *sprite = target_;

	[origFrame_ release];

	if( animation_.restoreOriginalFrame )
		origFrame_ = [[sprite displayFrame] retain];
	
	nextFrame_ = 0;
	executedLoops_ = 0;
=======
	CCSprite *sprite = _target;

	[_origFrame release];

	if( _animation.restoreOriginalFrame )
		_origFrame = [[sprite displayFrame] retain];
	
	_nextFrame = 0;
	_executedLoops = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
	if( animation_.restoreOriginalFrame ) {
		CCSprite *sprite = target_;
		[sprite setDisplayFrame:origFrame_];
=======
	if( _animation.restoreOriginalFrame ) {
		CCSprite *sprite = _target;
		[sprite setDisplayFrame:_origFrame];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	[super stop];
}

-(void) update: (ccTime) t
{
	
	// if t==1, ignore. Animation should finish with t==1
	if( t < 1.0f ) {
<<<<<<< HEAD
		t *= animation_.loops;
		
		// new loop?  If so, reset frame counter
		NSUInteger loopNumber = (NSUInteger)t;
		if( loopNumber > executedLoops_ ) {
			nextFrame_ = 0;
			executedLoops_++;
=======
		t *= _animation.loops;
		
		// new loop?  If so, reset frame counter
		NSUInteger loopNumber = (NSUInteger)t;
		if( loopNumber > _executedLoops ) {
			_nextFrame = 0;
			_executedLoops++;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
		
		// new t for animations
		t = fmodf(t, 1.0f);
	}
	
<<<<<<< HEAD
	NSArray *frames = [animation_ frames];
	NSUInteger numberOfFrames = [frames count];
	CCSpriteFrame *frameToDisplay = nil;

	for( NSUInteger i=nextFrame_; i < numberOfFrames; i++ ) {
		NSNumber *splitTime = [splitTimes_ objectAtIndex:i];
=======
	NSArray *frames = [_animation frames];
	NSUInteger numberOfFrames = [frames count];
	CCSpriteFrame *frameToDisplay = nil;

	for( NSUInteger i=_nextFrame; i < numberOfFrames; i++ ) {
		NSNumber *splitTime = [_splitTimes objectAtIndex:i];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		if( [splitTime floatValue] <= t ) {
			CCAnimationFrame *frame = [frames objectAtIndex:i];
			frameToDisplay = [frame spriteFrame];
<<<<<<< HEAD
			[(CCSprite*)target_ setDisplayFrame: frameToDisplay];
			
			NSDictionary *dict = [frame userInfo];
			if( dict )
				[[NSNotificationCenter defaultCenter] postNotificationName:CCAnimationFrameDisplayedNotification object:target_ userInfo:dict];

			nextFrame_ = i+1;

			break;
		}
	}	
=======
			[(CCSprite*)_target setDisplayFrame: frameToDisplay];
			
			NSDictionary *dict = [frame userInfo];
			if( dict )
				[[NSNotificationCenter defaultCenter] postNotificationName:CCAnimationFrameDisplayedNotification object:_target userInfo:dict];

			_nextFrame = i+1;
		}
		// Issue 1438. Could be more than one frame per tick, due to low frame rate or frame delta < 1/FPS
		else
			break;
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	NSArray *oldArray = [animation_ frames];
=======
	NSArray *oldArray = [_animation frames];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:[oldArray count]];
    NSEnumerator *enumerator = [oldArray reverseObjectEnumerator];
    for (id element in enumerator)
        [newArray addObject:[[element copy] autorelease]];

<<<<<<< HEAD
	CCAnimation *newAnim = [CCAnimation animationWithAnimationFrames:newArray delayPerUnit:animation_.delayPerUnit loops:animation_.loops];
	newAnim.restoreOriginalFrame = animation_.restoreOriginalFrame;
=======
	CCAnimation *newAnim = [CCAnimation animationWithAnimationFrames:newArray delayPerUnit:_animation.delayPerUnit loops:_animation.loops];
	newAnim.restoreOriginalFrame = _animation.restoreOriginalFrame;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return [[self class] actionWithAnimation:newAnim];
}
@end


#pragma mark - CCTargetedAction

@implementation CCTargetedAction

<<<<<<< HEAD
@synthesize forcedTarget = forcedTarget_;
=======
@synthesize forcedTarget = _forcedTarget;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+ (id) actionWithTarget:(id) target action:(CCFiniteTimeAction*) action
{
	return [[ (CCTargetedAction*)[self alloc] initWithTarget:target action:action] autorelease];
}

- (id) initWithTarget:(id) targetIn action:(CCFiniteTimeAction*) actionIn
{
	if((self = [super initWithDuration:actionIn.duration]))
	{
<<<<<<< HEAD
		forcedTarget_ = [targetIn retain];
		action_ = [actionIn retain];
=======
		_forcedTarget = [targetIn retain];
		_action = [actionIn retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [ (CCTargetedAction*) [[self class] allocWithZone: zone] initWithTarget:target_ action:[[action_ copy] autorelease]];
=======
	CCAction *copy = [ (CCTargetedAction*) [[self class] allocWithZone: zone] initWithTarget:_forcedTarget action:[[_action copy] autorelease]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

- (void) dealloc
{
<<<<<<< HEAD
	[forcedTarget_ release];
	[action_ release];
=======
	[_forcedTarget release];
	[_action release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

//- (void) updateDuration:(id)aTarget
//{
//	[action updateDuration:forcedTarget];
<<<<<<< HEAD
//	duration_ = action.duration;
=======
//	_duration = action.duration;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
//}

- (void) startWithTarget:(id)aTarget
{
<<<<<<< HEAD
	[super startWithTarget:forcedTarget_];
	[action_ startWithTarget:forcedTarget_];
=======
	[super startWithTarget:aTarget];
	[_action startWithTarget:_forcedTarget];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) stop
{
<<<<<<< HEAD
	[action_ stop];
=======
	[_action stop];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) update:(ccTime) time
{
<<<<<<< HEAD
	[action_ update:time];
=======
	[_action update:time];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end
