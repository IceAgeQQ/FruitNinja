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


#include <sys/time.h>
#import <Foundation/Foundation.h>

#import "ccTypes.h"

enum {
	//! Default tag
	kCCActionTagInvalid = -1,
};

/** Base class for CCAction objects.
 */
@interface CCAction : NSObject <NSCopying>
{
<<<<<<< HEAD
	id			originalTarget_;
	id			target_;
	NSInteger	tag_;
=======
	id			_originalTarget;
	id			_target;
	NSInteger	_tag;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** The "target". The action will modify the target properties.
 The target will be set with the 'startWithTarget' method.
 When the 'stop' method is called, target will be set to nil.
 The target is 'assigned', it is not 'retained'.
 */
@property (nonatomic,readonly,assign) id target;

/** The original target, since target can be nil.
 Is the target that were used to run the action. Unless you are doing something complex, like CCActionManager, you should NOT call this method.
 @since v0.8.2
*/
@property (nonatomic,readonly,assign) id originalTarget;


/** The action tag. An identifier of the action */
@property (nonatomic,readwrite,assign) NSInteger tag;

/** Allocates and initializes the action */
+(id) action;

/** Initializes the action */
-(id) init;

-(id) copyWithZone: (NSZone*) zone;

//! return YES if the action has finished
-(BOOL) isDone;
//! called before the action start. It will also set the target.
-(void) startWithTarget:(id)target;
//! called after the action has finished. It will set the 'target' to nil.
//! IMPORTANT: You should never call "[action stop]" manually. Instead, use: "[target stopAction:action];"
-(void) stop;
//! called every frame with its delta time. DON'T override unless you know what you are doing.
-(void) step: (ccTime) dt;
//! called once per frame. time a value between 0 and 1
//! For example:
//! * 0 means that the action just started
//! * 0.5 means that the action is in the middle
//! * 1 means that the action is over
-(void) update: (ccTime) time;

@end

/** Base class actions that do have a finite time duration.
 Possible actions:
   - An action with a duration of 0 seconds
   - An action with a duration of 35.5 seconds
<<<<<<< HEAD
 Infitite time actions are valid
=======
 Infinite time actions are valid
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
@interface CCFiniteTimeAction : CCAction <NSCopying>
{
	//! duration in seconds
<<<<<<< HEAD
	ccTime duration_;
=======
	ccTime _duration;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
//! duration in seconds of the action
@property (nonatomic,readwrite) ccTime duration;

/** returns a reversed action */
- (CCFiniteTimeAction*) reverse;
@end


@class CCActionInterval;
/** Repeats an action for ever.
 To repeat the an action for a limited number of times use the Repeat action.
<<<<<<< HEAD
 @warning This action can't be Sequenceable because it is not an IntervalAction
 */
@interface CCRepeatForever : CCAction <NSCopying>
{
	CCActionInterval *innerAction_;
=======
 @warning This action can't be Sequence-able because it is not an IntervalAction
 */
@interface CCRepeatForever : CCAction <NSCopying>
{
	CCActionInterval *_innerAction;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** Inner action */
@property (nonatomic, readwrite, retain) CCActionInterval *innerAction;

/** creates the action */
+(id) actionWithAction: (CCActionInterval*) action;
/** initializes the action */
-(id) initWithAction: (CCActionInterval*) action;
@end

/** Changes the speed of an action, making it take longer (speed<1)
 or less (speed>1) time.
 Useful to simulate 'slow motion' or 'fast forward' effect.
<<<<<<< HEAD
 @warning This action can't be Sequenceable because it is not an CCIntervalAction
 */
@interface CCSpeed : CCAction <NSCopying>
{
	CCActionInterval	*innerAction_;
	float speed_;
}
/** alter the speed of the inner function in runtime */
@property (nonatomic,readwrite) float speed;
=======
 @warning This action can't be Sequence-able because it is not an CCIntervalAction
 */
@interface CCSpeed : CCAction <NSCopying>
{
	CCActionInterval	*_innerAction;
	CGFloat _speed;
}
/** alter the speed of the inner function in runtime */
@property (nonatomic,readwrite) CGFloat speed;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** Inner action of CCSpeed */
@property (nonatomic, readwrite, retain) CCActionInterval *innerAction;

/** creates the action */
<<<<<<< HEAD
+(id) actionWithAction: (CCActionInterval*) action speed:(float)value;
/** initializes the action */
-(id) initWithAction: (CCActionInterval*) action speed:(float)value;
=======
+(id) actionWithAction: (CCActionInterval*) action speed:(CGFloat)value;
/** initializes the action */
-(id) initWithAction: (CCActionInterval*) action speed:(CGFloat)value;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

@class CCNode;
/** CCFollow is an action that "follows" a node.

 Eg:
	[layer runAction: [CCFollow actionWithTarget:hero]];

 Instead of using CCCamera as a "follower", use this action instead.
 @since v0.99.2
 */
@interface CCFollow : CCAction <NSCopying>
{
	/* node to follow */
<<<<<<< HEAD
	CCNode	*followedNode_;

	/* whether camera should be limited to certain area */
	BOOL boundarySet;

	/* if screensize is bigger than the boundary - update not needed */
	BOOL boundaryFullyCovered;

	/* fast access to the screen dimensions */
	CGPoint halfScreenSize;
	CGPoint fullScreenSize;

	/* world boundaries */
	float leftBoundary;
	float rightBoundary;
	float topBoundary;
	float bottomBoundary;
=======
	CCNode	*_followedNode;

	/* whether camera should be limited to certain area */
	BOOL _boundarySet;

	/* if screen-size is bigger than the boundary - update not needed */
	BOOL _boundaryFullyCovered;

	/* fast access to the screen dimensions */
	CGPoint _halfScreenSize;
	CGPoint _fullScreenSize;

	/* world boundaries */
	float _leftBoundary;
	float _rightBoundary;
	float _topBoundary;
	float _bottomBoundary;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** alter behavior - turn on/off boundary */
@property (nonatomic,readwrite) BOOL boundarySet;

/** creates the action with no boundary set */
+(id) actionWithTarget:(CCNode *)followedNode;

/** creates the action with a set boundary */
+(id) actionWithTarget:(CCNode *)followedNode worldBoundary:(CGRect)rect;

/** initializes the action */
-(id) initWithTarget:(CCNode *)followedNode;

/** initializes the action with a set boundary */
-(id) initWithTarget:(CCNode *)followedNode worldBoundary:(CGRect)rect;

@end

