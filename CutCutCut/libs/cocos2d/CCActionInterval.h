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


#import "CCNode.h"
#import "CCAction.h"
#import "CCProtocols.h"

#include <sys/time.h>

/** An interval action is an action that takes place within a certain period of time.
It has an start time, and a finish time. The finish time is the parameter
duration plus the start time.

These CCActionInterval actions have some interesting properties, like:
 - They can run normally (default)
 - They can run reversed with the reverse method
 - They can run with the time altered with the Accelerate, AccelDeccel and Speed actions.

For example, you can simulate a Ping Pong effect running the action normally and
then running it again in Reverse mode.

Example:

	CCAction * pingPongAction = [CCSequence actions: action, [action reverse], nil];
*/
@interface CCActionInterval: CCFiniteTimeAction <NSCopying>
{
<<<<<<< HEAD
	ccTime	elapsed_;
	BOOL	firstTick_;
=======
	ccTime	_elapsed;
	BOOL	_firstTick;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** how many seconds had elapsed since the actions started to run. */
@property (nonatomic,readonly) ccTime elapsed;

/** creates the action */
+(id) actionWithDuration: (ccTime) d;
/** initializes the action */
-(id) initWithDuration: (ccTime) d;
/** returns YES if the action has finished */
-(BOOL) isDone;
/** returns a reversed action */
- (CCActionInterval*) reverse;
@end

/** Runs actions sequentially, one after another
 */
@interface CCSequence : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	CCFiniteTimeAction *actions_[2];
	ccTime split_;
	int last_;
}
/** helper contructor to create an array of sequenceable actions */
+(id) actions: (CCFiniteTimeAction*) action1, ... NS_REQUIRES_NIL_TERMINATION;
/** helper contructor to create an array of sequenceable actions given an array */
+(id) actionsWithArray: (NSArray*) actions;
=======
	CCFiniteTimeAction *_actions[2];
	ccTime _split;
	int _last;
}
/** helper constructor to create an array of sequence-able actions */
+(id) actions: (CCFiniteTimeAction*) action1, ... NS_REQUIRES_NIL_TERMINATION;
/** helper constructor to create an array of sequence-able actions */
+(id) actions: (CCFiniteTimeAction*) action1 vaList:(va_list) args;
/** helper constructor to create an array of sequence-able actions given an array */
+(id) actionWithArray: (NSArray*) arrayOfActions;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** creates the action */
+(id) actionOne:(CCFiniteTimeAction*)actionOne two:(CCFiniteTimeAction*)actionTwo;
/** initializes the action */
-(id) initOne:(CCFiniteTimeAction*)actionOne two:(CCFiniteTimeAction*)actionTwo;
@end


/** Repeats an action a number of times.
 * To repeat an action forever use the CCRepeatForever action.
 */
@interface CCRepeat : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	NSUInteger times_;
	NSUInteger total_;
	ccTime nextDt_;
	BOOL isActionInstant_;
	CCFiniteTimeAction *innerAction_;
=======
	NSUInteger _times;
	NSUInteger _total;
	ccTime _nextDt;
	BOOL _isActionInstant;
	CCFiniteTimeAction *_innerAction;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** Inner action */
@property (nonatomic,readwrite,retain) CCFiniteTimeAction *innerAction;

/** creates a CCRepeat action. Times is an unsigned integer between 1 and MAX_UINT.
 */
+(id) actionWithAction:(CCFiniteTimeAction*)action times: (NSUInteger)times;
/** initializes a CCRepeat action. Times is an unsigned integer between 1 and MAX_UINT */
-(id) initWithAction:(CCFiniteTimeAction*)action times: (NSUInteger)times;
@end

/** Spawn a new action immediately
 */
@interface CCSpawn : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	CCFiniteTimeAction *one_;
	CCFiniteTimeAction *two_;
}
/** helper constructor to create an array of spawned actions */
+(id) actions: (CCFiniteTimeAction*) action1, ... NS_REQUIRES_NIL_TERMINATION;
/** helper contructor to create an array of spawned actions given an array */
+(id) actionsWithArray: (NSArray*) actions;
=======
	CCFiniteTimeAction *_one;
	CCFiniteTimeAction *_two;
}
/** helper constructor to create an array of spawned actions */
+(id) actions: (CCFiniteTimeAction*) action1, ... NS_REQUIRES_NIL_TERMINATION;
/** helper constructor to create an array of spawned actions */
+(id) actions: (CCFiniteTimeAction*) action1 vaList:(va_list)args;
/** helper constructor to create an array of spawned actions given an array */
+(id) actionWithArray: (NSArray*) arrayOfActions;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** creates the Spawn action */
+(id) actionOne: (CCFiniteTimeAction*) one two:(CCFiniteTimeAction*) two;
/** initializes the Spawn action with the 2 actions to spawn */
-(id) initOne: (CCFiniteTimeAction*) one two:(CCFiniteTimeAction*) two;
@end

/**  Rotates a CCNode object to a certain angle by modifying it's
 rotation attribute.
 The direction will be decided by the shortest angle.
*/
@interface CCRotateTo : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	float dstAngle_;
	float startAngle_;
	float diffAngle_;
=======
	float _dstAngleX;
	float _startAngleX;
	float _diffAngleX;
  
	float _dstAngleY;
	float _startAngleY;
	float _diffAngleY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates the action */
+(id) actionWithDuration:(ccTime)duration angle:(float)angle;
/** initializes the action */
-(id) initWithDuration:(ccTime)duration angle:(float)angle;
<<<<<<< HEAD
@end

/** Rotates a CCNode object clockwise a number of degrees by modiying its rotation attribute.
*/
@interface CCRotateBy : CCActionInterval <NSCopying>
{
	float angle_;
	float startAngle_;
=======

/** creates the action with separate rotation angles */
+(id) actionWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY;
-(id) initWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY;
@end

/** Rotates a CCNode object clockwise a number of degrees by modifying its rotation attribute.
*/
@interface CCRotateBy : CCActionInterval <NSCopying>
{
	float _angleX;
	float _startAngleX;
	float _angleY;
	float _startAngleY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates the action */
+(id) actionWithDuration:(ccTime)duration angle:(float)deltaAngle;
/** initializes the action */
-(id) initWithDuration:(ccTime)duration angle:(float)deltaAngle;
<<<<<<< HEAD
@end

/** Moves a CCNode object to the position x,y. x and y are absolute coordinates by modifying its position attribute.
*/
@interface CCMoveTo : CCActionInterval <NSCopying>
{
	CGPoint endPosition_;
	CGPoint startPosition_;
	CGPoint delta_;
}
/** creates the action */
+(id) actionWithDuration:(ccTime)duration position:(CGPoint)position;
/** initializes the action */
-(id) initWithDuration:(ccTime)duration position:(CGPoint)position;
@end

/**  Moves a CCNode object x,y pixels by modifying its position attribute.
 x and y are relative to the position of the object.
 Duration is is seconds.
*/
@interface CCMoveBy : CCMoveTo <NSCopying>
{
}
/** creates the action */
+(id) actionWithDuration: (ccTime)duration position:(CGPoint)deltaPosition;
/** initializes the action */
-(id) initWithDuration: (ccTime)duration position:(CGPoint)deltaPosition;
=======

/** creates the action with separate rotation angles */
+(id) actionWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY;
-(id) initWithDuration: (ccTime) t angleX:(float) aX angleY:(float) aY;
@end

/**  Moves a CCNode object x,y pixels by modifying it's position attribute.
 x and y are relative to the position of the object.
 Several CCMoveBy actions can be concurrently called, and the resulting
 movement will be the sum of individual movements.
 @since v2.1beta2-custom
 */
@interface CCMoveBy : CCActionInterval <NSCopying>
{
	CGPoint _positionDelta;
	CGPoint _startPos;
	CGPoint _previousPos;
}
/** creates the action */
+(id) actionWithDuration: (ccTime)duration position:(CGPoint)deltaPosition;
/** initializes the action */
-(id) initWithDuration: (ccTime)duration position:(CGPoint)deltaPosition;
@end

/** Moves a CCNode object to the position x,y. x and y are absolute coordinates by modifying it's position attribute.
 Several CCMoveTo actions can be concurrently called, and the resulting
 movement will be the sum of individual movements.
 @since v2.1beta2-custom
 */
@interface CCMoveTo : CCMoveBy
{
	CGPoint _endPosition;
}
/** creates the action */
+(id) actionWithDuration:(ccTime)duration position:(CGPoint)position;
/** initializes the action */
-(id) initWithDuration:(ccTime)duration position:(CGPoint)position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Skews a CCNode object to given angles by modifying its skewX and skewY attributes
 @since v1.0
 */
@interface CCSkewTo : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	float skewX_;
	float skewY_;
	float startSkewX_;
	float startSkewY_;
	float endSkewX_;
	float endSkewY_;
	float deltaX_;
	float deltaY_;
}
/** creates the action */
+(id) actionWithDuration:(ccTime)t skewX:(float)sx skewY:(float)sy;
/** initializes the action */
=======
	float _skewX;
	float _skewY;
	float _startSkewX;
	float _startSkewY;
	float _endSkewX;
	float _endSkewY;
	float _deltaX;
	float _deltaY;
}
/** creates the action */
+(id) actionWithDuration:(ccTime)t skewX:(float)sx skewY:(float)sy;
/** initializes the action with duration, skew X and skew Y */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id) initWithDuration:(ccTime)t skewX:(float)sx skewY:(float)sy;
@end

/** Skews a CCNode object by skewX and skewY degrees
 @since v1.0
 */
@interface CCSkewBy : CCSkewTo <NSCopying>
{
}
<<<<<<< HEAD
=======
/** initializes the action with duration, skew X and skew Y */
-(id) initWithDuration:(ccTime)t skewX:(float)sx skewY:(float)sy;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Moves a CCNode object simulating a parabolic jump movement by modifying its position attribute.
*/
<<<<<<< HEAD
 @interface CCJumpBy : CCActionInterval <NSCopying>
{
	CGPoint startPosition_;
	CGPoint delta_;
	ccTime height_;
	NSUInteger jumps_;
=======
@interface CCJumpBy : CCActionInterval <NSCopying>
{
	CGPoint _startPosition;
	CGPoint _delta;
	ccTime	_height;
	NSUInteger _jumps;
	CGPoint _previousPos;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates the action */
+(id) actionWithDuration: (ccTime)duration position:(CGPoint)position height:(ccTime)height jumps:(NSUInteger)jumps;
/** initializes the action */
-(id) initWithDuration: (ccTime)duration position:(CGPoint)position height:(ccTime)height jumps:(NSUInteger)jumps;
@end

/** Moves a CCNode object to a parabolic position simulating a jump movement by modifying its position attribute.
*/
<<<<<<< HEAD
 @interface CCJumpTo : CCJumpBy <NSCopying>
{
}
=======
@interface CCJumpTo : CCJumpBy <NSCopying>
{
}
// XXX: Added to prevent bug on BridgeSupport
-(void) startWithTarget:(CCNode *)aTarget;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** bezier configuration structure
 */
typedef struct _ccBezierConfig {
	//! end position of the bezier
	CGPoint endPosition;
	//! Bezier control point 1
	CGPoint controlPoint_1;
	//! Bezier control point 2
	CGPoint controlPoint_2;
} ccBezierConfig;

/** An action that moves the target with a cubic Bezier curve by a certain distance.
 */
@interface CCBezierBy : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	ccBezierConfig config_;
	CGPoint startPosition_;
=======
	ccBezierConfig _config;
	CGPoint _startPosition;
	CGPoint _previousPosition;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** creates the action with a duration and a bezier configuration */
+(id) actionWithDuration: (ccTime) t bezier:(ccBezierConfig) c;

/** initializes the action with a duration and a bezier configuration */
-(id) initWithDuration: (ccTime) t bezier:(ccBezierConfig) c;
@end

/** An action that moves the target with a cubic Bezier curve to a destination point.
 @since v0.8.2
 */
@interface CCBezierTo : CCBezierBy
{
<<<<<<< HEAD
}
=======
	ccBezierConfig _toConfig;
}
// XXX: Added to prevent bug on BridgeSupport
-(void) startWithTarget:(CCNode *)aTarget;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Scales a CCNode object to a zoom factor by modifying its scale attribute.
 @warning This action doesn't support "reverse"
 */
@interface CCScaleTo : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	float scaleX_;
	float scaleY_;
	float startScaleX_;
	float startScaleY_;
	float endScaleX_;
	float endScaleY_;
	float deltaX_;
	float deltaY_;
=======
	float _scaleX;
	float _scaleY;
	float _startScaleX;
	float _startScaleY;
	float _endScaleX;
	float _endScaleY;
	float _deltaX;
	float _deltaY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates the action with the same scale factor for X and Y */
+(id) actionWithDuration: (ccTime)duration scale:(float) s;
/** initializes the action with the same scale factor for X and Y */
-(id) initWithDuration: (ccTime)duration scale:(float) s;
/** creates the action with and X factor and a Y factor */
+(id) actionWithDuration: (ccTime)duration scaleX:(float) sx scaleY:(float)sy;
/** initializes the action with and X factor and a Y factor */
-(id) initWithDuration: (ccTime)duration scaleX:(float) sx scaleY:(float)sy;
@end

/** Scales a CCNode object a zoom factor by modifying its scale attribute.
*/
@interface CCScaleBy : CCScaleTo <NSCopying>
{
}
<<<<<<< HEAD
=======
// XXX: Added to prevent bug on BridgeSupport
-(void) startWithTarget:(CCNode *)aTarget;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Blinks a CCNode object by modifying its visible attribute
*/
@interface CCBlink : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	NSUInteger times_;
}
/** creates the action */
+(id) actionWithDuration: (ccTime)duration blinks:(NSUInteger)blinks;
/** initilizes the action */
=======
	NSUInteger _times;
	BOOL _originalState;
}
/** creates the action */
+(id) actionWithDuration: (ccTime)duration blinks:(NSUInteger)blinks;
/** initializes the action */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id) initWithDuration: (ccTime)duration blinks:(NSUInteger)blinks;
@end

/** Fades In an object that implements the CCRGBAProtocol protocol. It modifies the opacity from 0 to 255.
 The "reverse" of this action is FadeOut
 */
@interface CCFadeIn : CCActionInterval <NSCopying>
{
}
<<<<<<< HEAD
=======
// XXX: Added to prevent bug on BridgeSupport
-(void) update:(ccTime)dt;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Fades Out an object that implements the CCRGBAProtocol protocol. It modifies the opacity from 255 to 0.
 The "reverse" of this action is FadeIn
*/
@interface CCFadeOut : CCActionInterval <NSCopying>
{
}
<<<<<<< HEAD
=======
// XXX: Added to prevent bug on BridgeSupport
-(void) update:(ccTime)dt;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Fades an object that implements the CCRGBAProtocol protocol. It modifies the opacity from the current value to a custom one.
 @warning This action doesn't support "reverse"
 */
@interface CCFadeTo : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	GLubyte toOpacity_;
	GLubyte fromOpacity_;
}
/** creates an action with duration and opactiy */
=======
	GLubyte _toOpacity;
	GLubyte _fromOpacity;
}
/** creates an action with duration and opacity */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) actionWithDuration:(ccTime)duration opacity:(GLubyte)opactiy;
/** initializes the action with duration and opacity */
-(id) initWithDuration:(ccTime)duration opacity:(GLubyte)opacity;
@end

/** Tints a CCNode that implements the CCNodeRGB protocol from current tint to a custom one.
 @warning This action doesn't support "reverse"
 @since v0.7.2
*/
@interface CCTintTo : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	ccColor3B to_;
	ccColor3B from_;
=======
	ccColor3B _to;
	ccColor3B _from;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates an action with duration and color */
+(id) actionWithDuration:(ccTime)duration red:(GLubyte)red green:(GLubyte)green blue:(GLubyte)blue;
/** initializes the action with duration and color */
-(id) initWithDuration:(ccTime)duration red:(GLubyte)red green:(GLubyte)green blue:(GLubyte)blue;
@end

/** Tints a CCNode that implements the CCNodeRGB protocol from current tint to a custom one.
 @since v0.7.2
 */
@interface CCTintBy : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	GLshort deltaR_, deltaG_, deltaB_;
	GLshort fromR_, fromG_, fromB_;
=======
	GLshort _deltaR, _deltaG, _deltaB;
	GLshort _fromR, _fromG, _fromB;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates an action with duration and color */
+(id) actionWithDuration:(ccTime)duration red:(GLshort)deltaRed green:(GLshort)deltaGreen blue:(GLshort)deltaBlue;
/** initializes the action with duration and color */
-(id) initWithDuration:(ccTime)duration red:(GLshort)deltaRed green:(GLshort)deltaGreen blue:(GLshort)deltaBlue;
@end

/** Delays the action a certain amount of seconds
*/
@interface CCDelayTime : CCActionInterval <NSCopying>
{
}
<<<<<<< HEAD
=======
// XXX: Added to prevent bug on BridgeSupport
-(void) update:(ccTime)dt;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

/** Executes an action in reverse order, from time=duration to time=0

 @warning Use this action carefully. This action is not
<<<<<<< HEAD
 sequenceable. Use it as the default "reversed" method
=======
 sequence-able. Use it as the default "reversed" method
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 of your own actions, but using it outside the "reversed"
 scope is not recommended.
*/
@interface CCReverseTime : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	CCFiniteTimeAction * other_;
=======
	CCFiniteTimeAction * _other;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** creates the action */
+(id) actionWithAction: (CCFiniteTimeAction*) action;
/** initializes the action */
-(id) initWithAction: (CCFiniteTimeAction*) action;
@end


@class CCAnimation;
@class CCTexture2D;
/** Animates a sprite given the name of an Animation */
@interface CCAnimate : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	NSMutableArray		*splitTimes_;
	NSInteger			nextFrame_;
	CCAnimation			*animation_;
	id					origFrame_;
	NSUInteger			executedLoops_;
}
/** animation used for the animage */
=======
	NSMutableArray		*_splitTimes;
	NSInteger			_nextFrame;
	CCAnimation			*_animation;
	id					_origFrame;
	NSUInteger			_executedLoops;
}
/** animation used for the image */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@property (readwrite,nonatomic,retain) CCAnimation * animation;

/** creates the action with an Animation and will restore the original frame when the animation is over */
+(id) actionWithAnimation:(CCAnimation*)animation;
<<<<<<< HEAD
/** initializes the action with an Animation and will restore the original frame when the animtion is over */
=======
/** initializes the action with an Animation and will restore the original frame when the animation is over */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id) initWithAnimation:(CCAnimation*)animation;
@end

/** Overrides the target of an action so that it always runs on the target
 * specified at action creation rather than the one specified by runAction.
 */
@interface CCTargetedAction : CCActionInterval <NSCopying>
{
<<<<<<< HEAD
	id forcedTarget_;
	CCFiniteTimeAction* action_;
=======
	id _forcedTarget;
	CCFiniteTimeAction* _action;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
/** This is the target that the action will be forced to run with */
@property(readwrite,nonatomic,retain) id forcedTarget;

/** Create an action with the specified action and forced target */
+ (id) actionWithTarget:(id) target action:(CCFiniteTimeAction*) action;

/** Init an action with the specified action and forced target */
- (id) initWithTarget:(id) target action:(CCFiniteTimeAction*) action;

@end
