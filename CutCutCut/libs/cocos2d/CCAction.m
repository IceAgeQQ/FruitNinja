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


#import "CCDirector.h"
#import "ccMacros.h"
#import "CCAction.h"
#import "CCActionInterval.h"
#import "Support/CGPointExtension.h"

//
// Action Base Class
//
#pragma mark -
#pragma mark Action
@implementation CCAction

<<<<<<< HEAD
@synthesize tag = tag_, target = target_, originalTarget = originalTarget_;
=======
@synthesize tag = _tag, target = _target, originalTarget = _originalTarget;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) action
{
	return [[[self alloc] init] autorelease];
}

-(id) init
{
	if( (self=[super init]) ) {
<<<<<<< HEAD
		originalTarget_ = target_ = nil;
		tag_ = kCCActionTagInvalid;
=======
		_originalTarget = _target = nil;
		_tag = kCCActionTagInvalid;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(void) dealloc
{
	CCLOGINFO(@"cocos2d: deallocing %@", self);
	[super dealloc];
}

-(NSString*) description
{
<<<<<<< HEAD
	return [NSString stringWithFormat:@"<%@ = %08X | Tag = %i>", [self class], self, tag_];
=======
	return [NSString stringWithFormat:@"<%@ = %p | Tag = %ld>", [self class], self, (long)_tag];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
	CCAction *copy = [[[self class] allocWithZone: zone] init];
<<<<<<< HEAD
	copy.tag = tag_;
=======
	copy.tag = _tag;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) startWithTarget:(id)aTarget
{
<<<<<<< HEAD
	originalTarget_ = target_ = aTarget;
=======
	_originalTarget = _target = aTarget;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
	target_ = nil;
=======
	_target = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) isDone
{
	return YES;
}

-(void) step: (ccTime) dt
{
	CCLOG(@"[Action step]. override me");
}

-(void) update: (ccTime) time
{
	CCLOG(@"[Action update]. override me");
}
@end

//
// FiniteTimeAction
//
#pragma mark -
#pragma mark FiniteTimeAction
@implementation CCFiniteTimeAction
<<<<<<< HEAD
@synthesize duration = duration_;
=======
@synthesize duration = _duration;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

- (CCFiniteTimeAction*) reverse
{
	CCLOG(@"cocos2d: FiniteTimeAction#reverse: Implement me");
	return nil;
}
@end


//
// RepeatForever
//
#pragma mark -
#pragma mark RepeatForever
@implementation CCRepeatForever
<<<<<<< HEAD
@synthesize innerAction=innerAction_;
=======
@synthesize innerAction=_innerAction;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) actionWithAction: (CCActionInterval*) action
{
	return [[[self alloc] initWithAction: action] autorelease];
}

-(id) initWithAction: (CCActionInterval*) action
{
	if( (self=[super init]) )
		self.innerAction = action;

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithAction:[[innerAction_ copy] autorelease] ];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithAction:[[_innerAction copy] autorelease] ];
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
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[innerAction_ startWithTarget:target_];
=======
	[_innerAction startWithTarget:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) step:(ccTime) dt
{
<<<<<<< HEAD
	[innerAction_ step: dt];
	if( [innerAction_ isDone] ) {
		ccTime diff = innerAction_.elapsed - innerAction_.duration;
		[innerAction_ startWithTarget:target_];

		// to prevent jerk. issue #390, 1247
		[innerAction_ step: 0.0f];
		[innerAction_ step: diff];
=======
	[_innerAction step: dt];
	if( [_innerAction isDone] ) {
		ccTime diff = _innerAction.elapsed - _innerAction.duration;
		[_innerAction startWithTarget:_target];

		// to prevent jerk. issue #390, 1247
		[_innerAction step: 0.0f];
		[_innerAction step: diff];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}


-(BOOL) isDone
{
	return NO;
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [CCRepeatForever actionWithAction:[innerAction_ reverse]];
=======
	return [CCRepeatForever actionWithAction:[_innerAction reverse]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// Speed
//
#pragma mark -
#pragma mark Speed
@implementation CCSpeed
<<<<<<< HEAD
@synthesize speed=speed_;
@synthesize innerAction=innerAction_;

+(id) actionWithAction: (CCActionInterval*) action speed:(float)value
=======
@synthesize speed=_speed;
@synthesize innerAction=_innerAction;

+(id) actionWithAction: (CCActionInterval*) action speed:(CGFloat)value
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	return [[[self alloc] initWithAction: action speed:value] autorelease];
}

<<<<<<< HEAD
-(id) initWithAction: (CCActionInterval*) action speed:(float)value
{
	if( (self=[super init]) ) {
		self.innerAction = action;
		speed_ = value;
=======
-(id) initWithAction: (CCActionInterval*) action speed:(CGFloat)value
{
	if( (self=[super init]) ) {
		self.innerAction = action;
		_speed = value;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCAction *copy = [[[self class] allocWithZone: zone] initWithAction:[[innerAction_ copy] autorelease] speed:speed_];
=======
	CCAction *copy = [[[self class] allocWithZone: zone] initWithAction:[[_innerAction copy] autorelease] speed:_speed];
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
	[super startWithTarget:aTarget];
<<<<<<< HEAD
	[innerAction_ startWithTarget:target_];
=======
	[_innerAction startWithTarget:_target];
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

-(void) step:(ccTime) dt
{
<<<<<<< HEAD
	[innerAction_ step: dt * speed_];
=======
	[_innerAction step: dt * _speed];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) isDone
{
<<<<<<< HEAD
	return [innerAction_ isDone];
=======
	return [_innerAction isDone];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CCActionInterval *) reverse
{
<<<<<<< HEAD
	return [CCSpeed actionWithAction:[innerAction_ reverse] speed:speed_];
=======
	return [CCSpeed actionWithAction:[_innerAction reverse] speed:_speed];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// Follow
//
#pragma mark -
#pragma mark Follow
@implementation CCFollow

<<<<<<< HEAD
@synthesize boundarySet;
=======
@synthesize boundarySet = _boundarySet;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithTarget:(CCNode *) fNode
{
	return [[[self alloc] initWithTarget:fNode] autorelease];
}

+(id) actionWithTarget:(CCNode *) fNode worldBoundary:(CGRect)rect
{
	return [[[self alloc] initWithTarget:fNode worldBoundary:rect] autorelease];
}

-(id) initWithTarget:(CCNode *)fNode
{
	if( (self=[super init]) ) {

<<<<<<< HEAD
		followedNode_ = [fNode retain];
		boundarySet = FALSE;
		boundaryFullyCovered = FALSE;

		CGSize s = [[CCDirector sharedDirector] winSize];
		fullScreenSize = CGPointMake(s.width, s.height);
		halfScreenSize = ccpMult(fullScreenSize, .5f);
=======
		_followedNode = [fNode retain];
		_boundarySet = FALSE;
		_boundaryFullyCovered = FALSE;

		CGSize s = [[CCDirector sharedDirector] winSize];
		_fullScreenSize = CGPointMake(s.width, s.height);
		_halfScreenSize = ccpMult(_fullScreenSize, .5f);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) initWithTarget:(CCNode *)fNode worldBoundary:(CGRect)rect
{
	if( (self=[super init]) ) {

<<<<<<< HEAD
		followedNode_ = [fNode retain];
		boundarySet = TRUE;
		boundaryFullyCovered = FALSE;

		CGSize winSize = [[CCDirector sharedDirector] winSize];
		fullScreenSize = CGPointMake(winSize.width, winSize.height);
		halfScreenSize = ccpMult(fullScreenSize, .5f);

		leftBoundary = -((rect.origin.x+rect.size.width) - fullScreenSize.x);
		rightBoundary = -rect.origin.x ;
		topBoundary = -rect.origin.y;
		bottomBoundary = -((rect.origin.y+rect.size.height) - fullScreenSize.y);

		if(rightBoundary < leftBoundary)
		{
			// screen width is larger than world's boundary width
			//set both in the middle of the world
			rightBoundary = leftBoundary = (leftBoundary + rightBoundary) / 2;
		}
		if(topBoundary < bottomBoundary)
		{
			// screen width is larger than world's boundary width
			//set both in the middle of the world
			topBoundary = bottomBoundary = (topBoundary + bottomBoundary) / 2;
		}

		if( (topBoundary == bottomBoundary) && (leftBoundary == rightBoundary) )
			boundaryFullyCovered = TRUE;
=======
		_followedNode = [fNode retain];
		_boundarySet = TRUE;
		_boundaryFullyCovered = FALSE;

		CGSize winSize = [[CCDirector sharedDirector] winSize];
		_fullScreenSize = CGPointMake(winSize.width, winSize.height);
		_halfScreenSize = ccpMult(_fullScreenSize, .5f);

		_leftBoundary = -((rect.origin.x+rect.size.width) - _fullScreenSize.x);
		_rightBoundary = -rect.origin.x ;
		_topBoundary = -rect.origin.y;
		_bottomBoundary = -((rect.origin.y+rect.size.height) - _fullScreenSize.y);

		if(_rightBoundary < _leftBoundary)
		{
			// screen width is larger than world's boundary width
			//set both in the middle of the world
			_rightBoundary = _leftBoundary = (_leftBoundary + _rightBoundary) / 2;
		}
		if(_topBoundary < _bottomBoundary)
		{
			// screen width is larger than world's boundary width
			//set both in the middle of the world
			_topBoundary = _bottomBoundary = (_topBoundary + _bottomBoundary) / 2;
		}

		if( (_topBoundary == _bottomBoundary) && (_leftBoundary == _rightBoundary) )
			_boundaryFullyCovered = TRUE;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
	CCAction *copy = [[[self class] allocWithZone: zone] init];
<<<<<<< HEAD
	copy.tag = tag_;
=======
	copy.tag = _tag;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) step:(ccTime) dt
{
<<<<<<< HEAD
	if(boundarySet)
	{
		// whole map fits inside a single screen, no need to modify the position - unless map boundaries are increased
		if(boundaryFullyCovered)
			return;

		CGPoint tempPos = ccpSub( halfScreenSize, followedNode_.position);
		[target_ setPosition:ccp(clampf(tempPos.x,leftBoundary,rightBoundary), clampf(tempPos.y,bottomBoundary,topBoundary))];
	}
	else
		[target_ setPosition:ccpSub( halfScreenSize, followedNode_.position )];
=======
	if(_boundarySet)
	{
		// whole map fits inside a single screen, no need to modify the position - unless map boundaries are increased
		if(_boundaryFullyCovered)
			return;

		CGPoint tempPos = ccpSub( _halfScreenSize, _followedNode.position);
		[_target setPosition:ccp(clampf(tempPos.x, _leftBoundary, _rightBoundary), clampf(tempPos.y, _bottomBoundary, _topBoundary))];
	}
	else
		[_target setPosition:ccpSub( _halfScreenSize, _followedNode.position )];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


-(BOOL) isDone
{
<<<<<<< HEAD
	return !followedNode_.isRunning;
=======
	return !_followedNode.isRunning;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stop
{
<<<<<<< HEAD
	target_ = nil;
=======
	_target = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super stop];
}

-(void) dealloc
{
<<<<<<< HEAD
	[followedNode_ release];
=======
	[_followedNode release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

@end


