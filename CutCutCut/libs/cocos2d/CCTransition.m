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



#import "CCTransition.h"
#import "CCNode.h"
#import "CCSprite.h"
#import "CCDirector.h"
#import "CCActionInterval.h"
#import "CCActionInstant.h"
#import "CCActionCamera.h"
#import "CCLayer.h"
#import "CCCamera.h"
#import "CCActionTiledGrid.h"
#import "CCActionEase.h"
#import "CCRenderTexture.h"
#import "ccMacros.h"
#import "Support/CGPointExtension.h"

#ifdef __CC_PLATFORM_IOS
#import "Platforms/iOS/CCTouchDispatcher.h"
#import "Platforms/iOS/CCDirectorIOS.h"
#elif defined(__CC_PLATFORM_MAC)
#import "Platforms/Mac/CCDirectorMac.h"
#import "Platforms/Mac/CCEventDispatcher.h"
#endif

const NSInteger kSceneFade = 0xFADEFADE;


@interface CCTransitionScene (Private)
-(void) sceneOrder;
- (void)setNewScene:(ccTime)dt;
@end

@implementation CCTransitionScene
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s
{
	return [[[self alloc] initWithDuration:t scene:s] autorelease];
}

-(id) initWithDuration:(ccTime) t scene:(CCScene*)s
{
	NSAssert( s != nil, @"Argument scene must be non-nil");

	if( (self=[super init]) ) {

<<<<<<< HEAD
		duration_ = t;

		// retain
		inScene_ = [s retain];
		outScene_ = [[CCDirector sharedDirector] runningScene];
		[outScene_ retain];

		NSAssert( inScene_ != outScene_, @"Incoming scene must be different from the outgoing scene" );

		// disable events while transitions
		CCDirector *director = [CCDirector sharedDirector];
#ifdef __CC_PLATFORM_IOS
		[[director touchDispatcher] setDispatchEvents: NO];
#elif defined(__CC_PLATFORM_MAC)
		[[director eventDispatcher] setDispatchEvents: NO];
#endif
=======
		_duration = t;

		// retain
		_inScene = [s retain];
		_outScene = [[CCDirector sharedDirector] runningScene];
		[_outScene retain];

		NSAssert( _inScene != _outScene, @"Incoming scene must be different from the outgoing scene" );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[self sceneOrder];
	}
	return self;
}
-(void) sceneOrder
{
<<<<<<< HEAD
	inSceneOnTop_ = YES;
=======
	_inSceneOnTop = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) draw
{
	[super draw];

<<<<<<< HEAD
	if( inSceneOnTop_ ) {
		[outScene_ visit];
		[inScene_ visit];
	} else {
		[inScene_ visit];
		[outScene_ visit];
=======
	if( _inSceneOnTop ) {
		[_outScene visit];
		[_inScene visit];
	} else {
		[_inScene visit];
		[_outScene visit];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) finish
{
	/* clean up */
<<<<<<< HEAD
	[inScene_ setVisible:YES];
	[inScene_ setPosition:ccp(0,0)];
	[inScene_ setScale:1.0f];
	[inScene_ setRotation:0.0f];
	[inScene_.camera restore];

	[outScene_ setVisible:NO];
	[outScene_ setPosition:ccp(0,0)];
	[outScene_ setScale:1.0f];
	[outScene_ setRotation:0.0f];
	[outScene_.camera restore];
=======
	[_inScene setVisible:YES];
	[_inScene setPosition:ccp(0,0)];
	[_inScene setScale:1.0f];
	[_inScene setRotation:0.0f];
	[_inScene.camera restore];

	[_outScene setVisible:NO];
	[_outScene setPosition:ccp(0,0)];
	[_outScene setScale:1.0f];
	[_outScene setRotation:0.0f];
	[_outScene.camera restore];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[self schedule:@selector(setNewScene:) interval:0];
}

-(void) setNewScene: (ccTime) dt
{
	[self unschedule:_cmd];

	CCDirector *director = [CCDirector sharedDirector];

	// Before replacing, save the "send cleanup to scene"
<<<<<<< HEAD
	sendCleanupToScene_ = [director sendCleanupToScene];

	[director replaceScene: inScene_];

	// enable events while transitions
#ifdef __CC_PLATFORM_IOS
	[[director touchDispatcher] setDispatchEvents: YES];
#elif defined(__CC_PLATFORM_MAC)
	[[director eventDispatcher] setDispatchEvents: YES];
#endif

	// issue #267
	[outScene_ setVisible:YES];
=======
	_sendCleanupToScene = [director sendCleanupToScene];

	[director replaceScene: _inScene];

	// issue #267
	[_outScene setVisible:YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) hideOutShowIn
{
<<<<<<< HEAD
	[inScene_ setVisible:YES];
	[outScene_ setVisible:NO];
=======
	[_inScene setVisible:YES];
	[_outScene setVisible:NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// custom onEnter
-(void) onEnter
{
	[super onEnter];
	
<<<<<<< HEAD
	// outScene_ should not receive the onExit callback
	// only the onExitTransitionDidStart
	[outScene_ onExitTransitionDidStart];
	
	[inScene_ onEnter];
=======
	// disable events while transitions
	CCDirector *director = [CCDirector sharedDirector];
#ifdef __CC_PLATFORM_IOS
	[[director touchDispatcher] setDispatchEvents: NO];
#elif defined(__CC_PLATFORM_MAC)
	[[director eventDispatcher] setDispatchEvents: NO];
#endif
	
	
	// _outScene should not receive the onExit callback
	// only the onExitTransitionDidStart
	[_outScene onExitTransitionDidStart];
	
	[_inScene onEnter];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// custom onExit
-(void) onExit
{
	[super onExit];
<<<<<<< HEAD
	[outScene_ onExit];

	// inScene_ should not receive the onEnter callback
	// only the onEnterTransitionDidFinish
	[inScene_ onEnterTransitionDidFinish];
=======
	
	// enable events while transitions
	CCDirector *director = [CCDirector sharedDirector];
#ifdef __CC_PLATFORM_IOS
	[[director touchDispatcher] setDispatchEvents: YES];
#elif defined(__CC_PLATFORM_MAC)
	[[director eventDispatcher] setDispatchEvents: YES];
#endif
	

	[_outScene onExit];

	// _inScene should not receive the onEnter callback
	// only the onEnterTransitionDidFinish
	[_inScene onEnterTransitionDidFinish];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// custom cleanup
-(void) cleanup
{
	[super cleanup];

<<<<<<< HEAD
	if( sendCleanupToScene_ )
	   [outScene_ cleanup];
=======
	if( _sendCleanupToScene )
	   [_outScene cleanup];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
<<<<<<< HEAD
	[inScene_ release];
	[outScene_ release];
=======
	[_inScene release];
	[_outScene release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}
@end

//
// Oriented Transition
//
@implementation CCTransitionSceneOriented
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s orientation:(tOrientation)o
{
	return [[[self alloc] initWithDuration:t scene:s orientation:o] autorelease];
}

-(id) initWithDuration:(ccTime) t scene:(CCScene*)s orientation:(tOrientation)o
{
	if( (self=[super initWithDuration:t scene:s]) )
		orientation = o;
	return self;
}
@end


//
// RotoZoom
//
@implementation CCTransitionRotoZoom
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

<<<<<<< HEAD
	[inScene_ setScale:0.001f];
	[outScene_ setScale:1.0f];

	[inScene_ setAnchorPoint:ccp(0.5f, 0.5f)];
	[outScene_ setAnchorPoint:ccp(0.5f, 0.5f)];

	CCActionInterval *rotozoom = [CCSequence actions: [CCSpawn actions:
								   [CCScaleBy actionWithDuration:duration_/2 scale:0.001f],
								   [CCRotateBy actionWithDuration:duration_/2 angle:360 *2],
								   nil],
								[CCDelayTime actionWithDuration:duration_/2],
							nil];


	[outScene_ runAction: rotozoom];
	[inScene_ runAction: [CCSequence actions:
=======
	[_inScene setScale:0.001f];
	[_outScene setScale:1.0f];

	[_inScene setAnchorPoint:ccp(0.5f, 0.5f)];
	[_outScene setAnchorPoint:ccp(0.5f, 0.5f)];

	CCActionInterval *rotozoom = [CCSequence actions: [CCSpawn actions:
								   [CCScaleBy actionWithDuration:_duration/2 scale:0.001f],
								   [CCRotateBy actionWithDuration:_duration/2 angle:360 *2],
								   nil],
								[CCDelayTime actionWithDuration:_duration/2],
							nil];


	[_outScene runAction: rotozoom];
	[_inScene runAction: [CCSequence actions:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
					[rotozoom reverse],
					[CCCallFunc actionWithTarget:self selector:@selector(finish)],
				  nil]];
}
@end

//
// JumpZoom
//
@implementation CCTransitionJumpZoom
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];
	CGSize s = [[CCDirector sharedDirector] winSize];

<<<<<<< HEAD
	[inScene_ setScale:0.5f];
	[inScene_ setPosition:ccp( s.width,0 )];

	[inScene_ setAnchorPoint:ccp(0.5f, 0.5f)];
	[outScene_ setAnchorPoint:ccp(0.5f, 0.5f)];

	CCActionInterval *jump = [CCJumpBy actionWithDuration:duration_/4 position:ccp(-s.width,0) height:s.width/4 jumps:2];
	CCActionInterval *scaleIn = [CCScaleTo actionWithDuration:duration_/4 scale:1.0f];
	CCActionInterval *scaleOut = [CCScaleTo actionWithDuration:duration_/4 scale:0.5f];
=======
	[_inScene setScale:0.5f];
	[_inScene setPosition:ccp( s.width,0 )];

	[_inScene setAnchorPoint:ccp(0.5f, 0.5f)];
	[_outScene setAnchorPoint:ccp(0.5f, 0.5f)];

	CCActionInterval *jump = [CCJumpBy actionWithDuration:_duration/4 position:ccp(-s.width,0) height:s.width/4 jumps:2];
	CCActionInterval *scaleIn = [CCScaleTo actionWithDuration:_duration/4 scale:1.0f];
	CCActionInterval *scaleOut = [CCScaleTo actionWithDuration:_duration/4 scale:0.5f];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CCActionInterval *jumpZoomOut = [CCSequence actions: scaleOut, jump, nil];
	CCActionInterval *jumpZoomIn = [CCSequence actions: jump, scaleIn, nil];

<<<<<<< HEAD
	CCActionInterval *delay = [CCDelayTime actionWithDuration:duration_/2];

	[outScene_ runAction: jumpZoomOut];
	[inScene_ runAction: [CCSequence actions: delay,
=======
	CCActionInterval *delay = [CCDelayTime actionWithDuration:_duration/2];

	[_outScene runAction: jumpZoomOut];
	[_inScene runAction: [CCSequence actions: delay,
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
								jumpZoomIn,
								[CCCallFunc actionWithTarget:self selector:@selector(finish)],
								nil] ];
}
@end

//
// MoveInL
//
@implementation CCTransitionMoveInL
-(void) onEnter
{
	[super onEnter];

	[self initScenes];

	CCActionInterval *a = [self action];

<<<<<<< HEAD
	[inScene_ runAction: [CCSequence actions:
=======
	[_inScene runAction: [CCSequence actions:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
						 [self easeActionWithAction:a],
						 [CCCallFunc actionWithTarget:self selector:@selector(finish)],
						 nil]
	];

}
-(CCActionInterval*) action
{
<<<<<<< HEAD
	return [CCMoveTo actionWithDuration:duration_ position:ccp(0,0)];
=======
	return [CCMoveTo actionWithDuration:_duration position:ccp(0,0)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) easeActionWithAction:(CCActionInterval*)action
{
	return [CCEaseOut actionWithAction:action rate:2.0f];
//	return [EaseElasticOut actionWithAction:action period:0.4f];
}

-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp( -s.width,0) ];
=======
	[_inScene setPosition: ccp( -s.width,0) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// MoveInR
//
@implementation CCTransitionMoveInR
-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp( s.width,0) ];
=======
	[_inScene setPosition: ccp( s.width,0) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// MoveInT
//
@implementation CCTransitionMoveInT
-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp( 0, s.height) ];
=======
	[_inScene setPosition: ccp( 0, s.height) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// MoveInB
//
@implementation CCTransitionMoveInB
-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp( 0, -s.height) ];
=======
	[_inScene setPosition: ccp( 0, -s.height) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// SlideInL
//

// The adjust factor is needed to prevent issue #442
// One solution is to use DONT_RENDER_IN_SUBPIXELS images, but NO
// The other issue is that in some transitions (and I don't know why)
// the order should be reversed (In in top of Out or vice-versa).
#define ADJUST_FACTOR 0.5f
@implementation CCTransitionSlideInL
-(void) onEnter
{
	[super onEnter];

	[self initScenes];

	CCActionInterval *in = [self action];
	CCActionInterval *out = [self action];

	id inAction = [self easeActionWithAction:in];
	id outAction = [CCSequence actions:
					[self easeActionWithAction:out],
					[CCCallFunc actionWithTarget:self selector:@selector(finish)],
					nil];

<<<<<<< HEAD
	[inScene_ runAction: inAction];
	[outScene_ runAction: outAction];
}
-(void) sceneOrder
{
	inSceneOnTop_ = NO;
=======
	[_inScene runAction: inAction];
	[_outScene runAction: outAction];
}
-(void) sceneOrder
{
	_inSceneOnTop = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp( -(s.width-ADJUST_FACTOR),0) ];
=======
	[_inScene setPosition: ccp( -(s.width-ADJUST_FACTOR),0) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
-(CCActionInterval*) action
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	return [CCMoveBy actionWithDuration:duration_ position:ccp(s.width-ADJUST_FACTOR,0)];
=======
	return [CCMoveBy actionWithDuration:_duration position:ccp(s.width-ADJUST_FACTOR,0)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) easeActionWithAction:(CCActionInterval*)action
{
	return [CCEaseOut actionWithAction:action rate:2.0f];
//	return [EaseElasticOut actionWithAction:action period:0.4f];
}

@end

//
// SlideInR
//
@implementation CCTransitionSlideInR
-(void) sceneOrder
{
<<<<<<< HEAD
	inSceneOnTop_ = YES;
=======
	_inSceneOnTop = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp( s.width-ADJUST_FACTOR,0) ];
=======
	[_inScene setPosition: ccp( s.width-ADJUST_FACTOR,0) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) action
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	return [CCMoveBy actionWithDuration:duration_ position:ccp(-(s.width-ADJUST_FACTOR),0)];
=======
	return [CCMoveBy actionWithDuration:_duration position:ccp(-(s.width-ADJUST_FACTOR),0)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
// SlideInT
//
@implementation CCTransitionSlideInT
-(void) sceneOrder
{
<<<<<<< HEAD
	inSceneOnTop_ = NO;
=======
	_inSceneOnTop = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp(0,s.height-ADJUST_FACTOR) ];
=======
	[_inScene setPosition: ccp(0,s.height-ADJUST_FACTOR) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) action
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	return [CCMoveBy actionWithDuration:duration_ position:ccp(0,-(s.height-ADJUST_FACTOR))];
=======
	return [CCMoveBy actionWithDuration:_duration position:ccp(0,-(s.height-ADJUST_FACTOR))];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
// SlideInB
//
@implementation CCTransitionSlideInB
-(void) sceneOrder
{
<<<<<<< HEAD
	inSceneOnTop_ = YES;
=======
	_inSceneOnTop = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) initScenes
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	[inScene_ setPosition: ccp(0,-(s.height-ADJUST_FACTOR)) ];
=======
	[_inScene setPosition: ccp(0,-(s.height-ADJUST_FACTOR)) ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) action
{
	CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
	return [CCMoveBy actionWithDuration:duration_ position:ccp(0,s.height-ADJUST_FACTOR)];
=======
	return [CCMoveBy actionWithDuration:_duration position:ccp(0,s.height-ADJUST_FACTOR)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// ShrinkGrow Transition
//
@implementation CCTransitionShrinkGrow
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

<<<<<<< HEAD
	[inScene_ setScale:0.001f];
	[outScene_ setScale:1.0f];

	[inScene_ setAnchorPoint:ccp(2/3.0f,0.5f)];
	[outScene_ setAnchorPoint:ccp(1/3.0f,0.5f)];

	CCActionInterval *scaleOut = [CCScaleTo actionWithDuration:duration_ scale:0.01f];
	CCActionInterval *scaleIn = [CCScaleTo actionWithDuration:duration_ scale:1.0f];

	[inScene_ runAction: [self easeActionWithAction:scaleIn]];
	[outScene_ runAction: [CCSequence actions:
=======
	[_inScene setScale:0.001f];
	[_outScene setScale:1.0f];

	[_inScene setAnchorPoint:ccp(2/3.0f,0.5f)];
	[_outScene setAnchorPoint:ccp(1/3.0f,0.5f)];

	CCActionInterval *scaleOut = [CCScaleTo actionWithDuration:_duration scale:0.01f];
	CCActionInterval *scaleIn = [CCScaleTo actionWithDuration:_duration scale:1.0f];

	[_inScene runAction: [self easeActionWithAction:scaleIn]];
	[_outScene runAction: [CCSequence actions:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
					[self easeActionWithAction:scaleOut],
					[CCCallFunc actionWithTarget:self selector:@selector(finish)],
					nil] ];
}
-(CCActionInterval*) easeActionWithAction:(CCActionInterval*)action
{
	return [CCEaseOut actionWithAction:action rate:2.0f];
//	return [EaseElasticOut actionWithAction:action period:0.3f];
}
@end

//
// FlipX Transition
//
@implementation CCTransitionFlipX
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

	CCActionInterval *inA, *outA;
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	float inDeltaZ, inAngleZ;
	float outDeltaZ, outAngleZ;

<<<<<<< HEAD
	if( orientation == kOrientationRightOver ) {
=======
	if( orientation == kCCTransitionOrientationRightOver ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		inDeltaZ = 90;
		inAngleZ = 270;
		outDeltaZ = 90;
		outAngleZ = 0;
	} else {
		inDeltaZ = -90;
		inAngleZ = 90;
		outDeltaZ = -90;
		outAngleZ = 0;
	}

	inA = [CCSequence actions:
<<<<<<< HEAD
		   [CCDelayTime actionWithDuration:duration_/2],
		   [CCShow action],
		   [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:0 deltaAngleX:0],
		   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
		   nil ];
	outA = [CCSequence actions:
			[CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:0 deltaAngleX:0],
			[CCHide action],
			[CCDelayTime actionWithDuration:duration_/2],
			nil ];

	[inScene_ runAction: inA];
	[outScene_ runAction: outA];
=======
		   [CCDelayTime actionWithDuration:_duration/2],
		   [CCShow action],
		   [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:0 deltaAngleX:0],
		   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
		   nil ];
	outA = [CCSequence actions:
			[CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:0 deltaAngleX:0],
			[CCHide action],
			[CCDelayTime actionWithDuration:_duration/2],
			nil ];

	[_inScene runAction: inA];
	[_outScene runAction: outA];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

}
@end

//
// FlipY Transition
//
@implementation CCTransitionFlipY
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

	CCActionInterval *inA, *outA;
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	float inDeltaZ, inAngleZ;
	float outDeltaZ, outAngleZ;

<<<<<<< HEAD
	if( orientation == kOrientationUpOver ) {
=======
	if( orientation == kCCTransitionOrientationUpOver ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		inDeltaZ = 90;
		inAngleZ = 270;
		outDeltaZ = 90;
		outAngleZ = 0;
	} else {
		inDeltaZ = -90;
		inAngleZ = 90;
		outDeltaZ = -90;
		outAngleZ = 0;
	}
	inA = [CCSequence actions:
<<<<<<< HEAD
		   [CCDelayTime actionWithDuration:duration_/2],
		   [CCShow action],
		   [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:90 deltaAngleX:0],
		   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
		   nil ];
	outA = [CCSequence actions:
			[CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:90 deltaAngleX:0],
			[CCHide action],
			[CCDelayTime actionWithDuration:duration_/2],
			nil ];

	[inScene_ runAction: inA];
	[outScene_ runAction: outA];
=======
		   [CCDelayTime actionWithDuration:_duration/2],
		   [CCShow action],
		   [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:90 deltaAngleX:0],
		   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
		   nil ];
	outA = [CCSequence actions:
			[CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:90 deltaAngleX:0],
			[CCHide action],
			[CCDelayTime actionWithDuration:_duration/2],
			nil ];

	[_inScene runAction: inA];
	[_outScene runAction: outA];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

}
@end

//
// FlipAngular Transition
//
@implementation CCTransitionFlipAngular
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

	CCActionInterval *inA, *outA;
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	float inDeltaZ, inAngleZ;
	float outDeltaZ, outAngleZ;

<<<<<<< HEAD
	if( orientation == kOrientationRightOver ) {
=======
	if( orientation == kCCTransitionOrientationRightOver ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		inDeltaZ = 90;
		inAngleZ = 270;
		outDeltaZ = 90;
		outAngleZ = 0;
	} else {
		inDeltaZ = -90;
		inAngleZ = 90;
		outDeltaZ = -90;
		outAngleZ = 0;
	}
	inA = [CCSequence actions:
<<<<<<< HEAD
			   [CCDelayTime actionWithDuration:duration_/2],
			   [CCShow action],
			   [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:-45 deltaAngleX:0],
			   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
			   nil ];
	outA = [CCSequence actions:
				[CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:45 deltaAngleX:0],
				[CCHide action],
				[CCDelayTime actionWithDuration:duration_/2],
				nil ];

	[inScene_ runAction: inA];
	[outScene_ runAction: outA];
=======
			   [CCDelayTime actionWithDuration:_duration/2],
			   [CCShow action],
			   [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:-45 deltaAngleX:0],
			   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
			   nil ];
	outA = [CCSequence actions:
				[CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:45 deltaAngleX:0],
				[CCHide action],
				[CCDelayTime actionWithDuration:_duration/2],
				nil ];

	[_inScene runAction: inA];
	[_outScene runAction: outA];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// ZoomFlipX Transition
//
@implementation CCTransitionZoomFlipX
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

	CCActionInterval *inA, *outA;
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	float inDeltaZ, inAngleZ;
	float outDeltaZ, outAngleZ;

<<<<<<< HEAD
	if( orientation == kOrientationRightOver ) {
=======
	if( orientation == kCCTransitionOrientationRightOver ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		inDeltaZ = 90;
		inAngleZ = 270;
		outDeltaZ = 90;
		outAngleZ = 0;
	} else {
		inDeltaZ = -90;
		inAngleZ = 90;
		outDeltaZ = -90;
		outAngleZ = 0;
	}
	inA = [CCSequence actions:
<<<<<<< HEAD
		   [CCDelayTime actionWithDuration:duration_/2],
		   [CCSpawn actions:
			[CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:0 deltaAngleX:0],
			[CCScaleTo actionWithDuration:duration_/2 scale:1],
=======
		   [CCDelayTime actionWithDuration:_duration/2],
		   [CCSpawn actions:
			[CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:0 deltaAngleX:0],
			[CCScaleTo actionWithDuration:_duration/2 scale:1],
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			[CCShow action],
			nil],
		   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
		   nil ];
	outA = [CCSequence actions:
			[CCSpawn actions:
<<<<<<< HEAD
			 [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:0 deltaAngleX:0],
			 [CCScaleTo actionWithDuration:duration_/2 scale:0.5f],
			 nil],
			[CCHide action],
			[CCDelayTime actionWithDuration:duration_/2],
			nil ];

	inScene_.scale = 0.5f;
	[inScene_ runAction: inA];
	[outScene_ runAction: outA];
=======
			 [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:0 deltaAngleX:0],
			 [CCScaleTo actionWithDuration:_duration/2 scale:0.5f],
			 nil],
			[CCHide action],
			[CCDelayTime actionWithDuration:_duration/2],
			nil ];

	_inScene.scale = 0.5f;
	[_inScene runAction: inA];
	[_outScene runAction: outA];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// ZoomFlipY Transition
//
@implementation CCTransitionZoomFlipY
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

	CCActionInterval *inA, *outA;
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	float inDeltaZ, inAngleZ;
	float outDeltaZ, outAngleZ;

<<<<<<< HEAD
	if( orientation == kOrientationUpOver ) {
=======
	if( orientation == kCCTransitionOrientationUpOver ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		inDeltaZ = 90;
		inAngleZ = 270;
		outDeltaZ = 90;
		outAngleZ = 0;
	} else {
		inDeltaZ = -90;
		inAngleZ = 90;
		outDeltaZ = -90;
		outAngleZ = 0;
	}

	inA = [CCSequence actions:
<<<<<<< HEAD
			   [CCDelayTime actionWithDuration:duration_/2],
			   [CCSpawn actions:
				 [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:90 deltaAngleX:0],
				 [CCScaleTo actionWithDuration:duration_/2 scale:1],
=======
			   [CCDelayTime actionWithDuration:_duration/2],
			   [CCSpawn actions:
				 [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:90 deltaAngleX:0],
				 [CCScaleTo actionWithDuration:_duration/2 scale:1],
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
				 [CCShow action],
				 nil],
			   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
			   nil ];
	outA = [CCSequence actions:
				[CCSpawn actions:
<<<<<<< HEAD
				 [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:90 deltaAngleX:0],
				 [CCScaleTo actionWithDuration:duration_/2 scale:0.5f],
				 nil],
				[CCHide action],
				[CCDelayTime actionWithDuration:duration_/2],
				nil ];

	inScene_.scale = 0.5f;
	[inScene_ runAction: inA];
	[outScene_ runAction: outA];
=======
				 [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:90 deltaAngleX:0],
				 [CCScaleTo actionWithDuration:_duration/2 scale:0.5f],
				 nil],
				[CCHide action],
				[CCDelayTime actionWithDuration:_duration/2],
				nil ];

	_inScene.scale = 0.5f;
	[_inScene runAction: inA];
	[_outScene runAction: outA];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// ZoomFlipAngular Transition
//
@implementation CCTransitionZoomFlipAngular
<<<<<<< HEAD
=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) onEnter
{
	[super onEnter];

	CCActionInterval *inA, *outA;
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	float inDeltaZ, inAngleZ;
	float outDeltaZ, outAngleZ;

<<<<<<< HEAD
	if( orientation == kOrientationRightOver ) {
=======
	if( orientation == kCCTransitionOrientationUpOver ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		inDeltaZ = 90;
		inAngleZ = 270;
		outDeltaZ = 90;
		outAngleZ = 0;
	} else {
		inDeltaZ = -90;
		inAngleZ = 90;
		outDeltaZ = -90;
		outAngleZ = 0;
	}

	inA = [CCSequence actions:
<<<<<<< HEAD
		   [CCDelayTime actionWithDuration:duration_/2],
		   [CCSpawn actions:
			[CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:-45 deltaAngleX:0],
			[CCScaleTo actionWithDuration:duration_/2 scale:1],
=======
		   [CCDelayTime actionWithDuration:_duration/2],
		   [CCSpawn actions:
			[CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:inAngleZ deltaAngleZ:inDeltaZ angleX:-45 deltaAngleX:0],
			[CCScaleTo actionWithDuration:_duration/2 scale:1],
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			[CCShow action],
			nil],
		   [CCShow action],
		   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
		   nil ];
	outA = [CCSequence actions:
			[CCSpawn actions:
<<<<<<< HEAD
			 [CCOrbitCamera actionWithDuration: duration_/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:45 deltaAngleX:0],
			 [CCScaleTo actionWithDuration:duration_/2 scale:0.5f],
			 nil],
			[CCHide action],
			[CCDelayTime actionWithDuration:duration_/2],
			nil ];

	inScene_.scale = 0.5f;
	[inScene_ runAction: inA];
	[outScene_ runAction: outA];
=======
			 [CCOrbitCamera actionWithDuration: _duration/2 radius: 1 deltaRadius:0 angleZ:outAngleZ deltaAngleZ:outDeltaZ angleX:45 deltaAngleX:0],
			 [CCScaleTo actionWithDuration:_duration/2 scale:0.5f],
			 nil],
			[CCHide action],
			[CCDelayTime actionWithDuration:_duration/2],
			nil ];

	_inScene.scale = 0.5f;
	[_inScene runAction: inA];
	[_outScene runAction: outA];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


//
// Fade Transition
//
@implementation CCTransitionFade
+(id) transitionWithDuration:(ccTime)d scene:(CCScene*)s withColor:(ccColor3B)color
{
	return [[[self alloc] initWithDuration:d scene:s withColor:color] autorelease];
}

-(id) initWithDuration:(ccTime)d scene:(CCScene*)s withColor:(ccColor3B)aColor
{
	if( (self=[super initWithDuration:d scene:s]) ) {
		color.r = aColor.r;
		color.g = aColor.g;
		color.b = aColor.b;
	}

	return self;
}

-(id) initWithDuration:(ccTime)d scene:(CCScene*)s
{
	return [self initWithDuration:d scene:s withColor:ccBLACK];
}

-(void) onEnter
{
	[super onEnter];

	CCLayerColor *l = [CCLayerColor layerWithColor:color];
<<<<<<< HEAD
	[inScene_ setVisible: NO];
=======
	[_inScene setVisible: NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[self addChild: l z:2 tag:kSceneFade];


	CCNode *f = [self getChildByTag:kSceneFade];

	CCActionInterval *a = [CCSequence actions:
<<<<<<< HEAD
						   [CCFadeIn actionWithDuration:duration_/2],
						   [CCCallFunc actionWithTarget:self selector:@selector(hideOutShowIn)],
						   [CCFadeOut actionWithDuration:duration_/2],
=======
						   [CCFadeIn actionWithDuration:_duration/2],
						   [CCCallFunc actionWithTarget:self selector:@selector(hideOutShowIn)],
						   [CCFadeOut actionWithDuration:_duration/2],
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
						   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
						   nil ];
	[f runAction: a];
}

-(void) onExit
{
	[super onExit];
<<<<<<< HEAD
	[self removeChildByTag:kSceneFade cleanup:NO];
=======
	[self removeChildByTag:kSceneFade cleanup:YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


//
// Cross Fade Transition
//
@implementation CCTransitionCrossFade
<<<<<<< HEAD

=======
-(id) init {
	return [super init];
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) draw
{
	// override draw since both scenes (textures) are rendered in 1 scene
}

-(void) onEnter
{
	[super onEnter];

	// create a transparent color layer
	// in which we are going to add our rendertextures
	ccColor4B  color = {0,0,0,0};
	CGSize size = [[CCDirector sharedDirector] winSize];
	CCLayerColor * layer = [CCLayerColor layerWithColor:color];

<<<<<<< HEAD
	// create the first render texture for inScene_
=======
	// create the first render texture for _inScene
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	CCRenderTexture *inTexture = [CCRenderTexture renderTextureWithWidth:size.width height:size.height];
	inTexture.sprite.anchorPoint= ccp(0.5f,0.5f);
	inTexture.position = ccp(size.width/2, size.height/2);
	inTexture.anchorPoint = ccp(0.5f,0.5f);

<<<<<<< HEAD
	// render inScene_ to its texturebuffer
	[inTexture begin];
	[inScene_ visit];
	[inTexture end];

	// create the second render texture for outScene_
=======
	// render _inScene to its texturebuffer
	[inTexture begin];
	[_inScene visit];
	[inTexture end];

	// create the second render texture for _outScene
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	CCRenderTexture *outTexture = [CCRenderTexture renderTextureWithWidth:size.width height:size.height];
	outTexture.sprite.anchorPoint= ccp(0.5f,0.5f);
	outTexture.position = ccp(size.width/2, size.height/2);
	outTexture.anchorPoint = ccp(0.5f,0.5f);

<<<<<<< HEAD
	// render outScene_ to its texturebuffer
	[outTexture begin];
	[outScene_ visit];
=======
	// render _outScene to its texturebuffer
	[outTexture begin];
	[_outScene visit];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[outTexture end];

	// create blend functions

<<<<<<< HEAD
	ccBlendFunc blend1 = {GL_ONE, GL_ONE}; // inScene_ will lay on background and will not be used with alpha
	ccBlendFunc blend2 = {GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA}; // we are going to blend outScene_ via alpha
=======
	ccBlendFunc blend1 = {GL_ONE, GL_ONE}; // _inScene will lay on background and will not be used with alpha
	ccBlendFunc blend2 = {GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA}; // we are going to blend _outScene via alpha
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// set blendfunctions
	[inTexture.sprite setBlendFunc:blend1];
	[outTexture.sprite setBlendFunc:blend2];

	// add render textures to the layer
	[layer addChild:inTexture];
	[layer addChild:outTexture];

	// initial opacity:
	[inTexture.sprite setOpacity:255];
	[outTexture.sprite setOpacity:255];

	// create the blend action
	CCActionInterval * layerAction = [CCSequence actions:
<<<<<<< HEAD
									  [CCFadeTo actionWithDuration:duration_ opacity:0],
=======
									  [CCFadeTo actionWithDuration:_duration opacity:0],
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
									  [CCCallFunc actionWithTarget:self selector:@selector(hideOutShowIn)],
									  [CCCallFunc actionWithTarget:self selector:@selector(finish)],
									  nil ];


	// run the blend action
	[outTexture.sprite runAction: layerAction];

	// add the layer (which contains our two rendertextures) to the scene
	[self addChild: layer z:2 tag:kSceneFade];
}

// clean up on exit
-(void) onExit
{
	// remove our layer and release all containing objects
<<<<<<< HEAD
	[self removeChildByTag:kSceneFade cleanup:NO];
=======
	[self removeChildByTag:kSceneFade cleanup:YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super onExit];
}
@end

//
// TurnOffTilesTransition
//
@implementation CCTransitionTurnOffTiles
<<<<<<< HEAD

// override addScenes, and change the order
-(void) sceneOrder
{
	inSceneOnTop_ = NO;
=======
-(id) init {
	return [super init];
}
// override addScenes, and change the order
-(void) sceneOrder
{
	_inSceneOnTop = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) onEnter
{
	[super onEnter];
	CGSize s = [[CCDirector sharedDirector] winSize];
	float aspect = s.width / s.height;
	int x = 12 * aspect;
	int y = 12;

<<<<<<< HEAD
	id toff = [CCTurnOffTiles actionWithSize: ccg(x,y) duration:duration_];
	id action = [self easeActionWithAction:toff];
	[outScene_ runAction: [CCSequence actions: action,
=======
	id toff = [CCTurnOffTiles actionWithDuration:_duration size:CGSizeMake(x,y)];
	id action = [self easeActionWithAction:toff];
	[_outScene runAction: [CCSequence actions: action,
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
				   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
				   [CCStopGrid action],
				   nil]
	 ];

}
-(CCActionInterval*) easeActionWithAction:(CCActionInterval*)action
{
	return action;
//	return [EaseIn actionWithAction:action rate:2.0f];
}
@end

#pragma mark Split Transitions

//
// SplitCols Transition
//
@implementation CCTransitionSplitCols

-(void) onEnter
{
	[super onEnter];

<<<<<<< HEAD
	inScene_.visible = NO;
=======
	_inScene.visible = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	id split = [self action];
	id seq = [CCSequence actions:
				split,
				[CCCallFunc actionWithTarget:self selector:@selector(hideOutShowIn)],
				[split reverse],
				nil
			  ];
	[self runAction: [CCSequence actions:
			   [self easeActionWithAction:seq],
			   [CCCallFunc actionWithTarget:self selector:@selector(finish)],
			   [CCStopGrid action],
			   nil]
	 ];
}

-(CCActionInterval*) action
{
<<<<<<< HEAD
	return [CCSplitCols actionWithCols:3 duration:duration_/2.0f];
=======
	return [CCSplitCols actionWithDuration:_duration/2.0f cols:3];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) easeActionWithAction:(CCActionInterval*)action
{
	return [CCEaseInOut actionWithAction:action rate:3.0f];
}
@end

//
// SplitRows Transition
//
@implementation CCTransitionSplitRows
-(CCActionInterval*) action
{
<<<<<<< HEAD
	return [CCSplitRows actionWithRows:3 duration:duration_/2.0f];
=======
	return [CCSplitRows actionWithDuration:_duration/2.0f rows:3];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


#pragma mark Fade Grid Transitions

//
// FadeTR Transition
//
@implementation CCTransitionFadeTR
-(void) sceneOrder
{
<<<<<<< HEAD
	inSceneOnTop_ = NO;
=======
	_inSceneOnTop = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) onEnter
{
	[super onEnter];

	CGSize s = [[CCDirector sharedDirector] winSize];
	float aspect = s.width / s.height;
	int x = 12 * aspect;
	int y = 12;

<<<<<<< HEAD
	id action  = [self actionWithSize:ccg(x,y)];

	[outScene_ runAction: [CCSequence actions:
=======
	id action  = [self actionWithSize:CGSizeMake(x,y)];

	[_outScene runAction: [CCSequence actions:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
					[self easeActionWithAction:action],
				    [CCCallFunc actionWithTarget:self selector:@selector(finish)],
				    [CCStopGrid action],
				    nil]
	 ];
}

<<<<<<< HEAD
-(CCActionInterval*) actionWithSize: (ccGridSize) v
{
	return [CCFadeOutTRTiles actionWithSize:v duration:duration_];
=======
-(CCActionInterval*) actionWithSize: (CGSize) v
{
	return [CCFadeOutTRTiles actionWithDuration:_duration size:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCActionInterval*) easeActionWithAction:(CCActionInterval*)action
{
	return action;
//	return [CCEaseOut actionWithAction:action rate:3.0f];
}
@end

//
// FadeBL Transition
//
@implementation CCTransitionFadeBL
<<<<<<< HEAD
-(CCActionInterval*) actionWithSize: (ccGridSize) v
{
	return [CCFadeOutBLTiles actionWithSize:v duration:duration_];
=======
-(CCActionInterval*) actionWithSize: (CGSize) v
{
	return [CCFadeOutBLTiles actionWithDuration:_duration size:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// FadeUp Transition
//
@implementation CCTransitionFadeUp
<<<<<<< HEAD
-(CCActionInterval*) actionWithSize: (ccGridSize) v
{
	return [CCFadeOutUpTiles actionWithSize:v duration:duration_];
=======
-(CCActionInterval*) actionWithSize: (CGSize) v
{
	return [CCFadeOutUpTiles actionWithDuration:_duration size:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// FadeDown Transition
//
@implementation CCTransitionFadeDown
<<<<<<< HEAD
-(CCActionInterval*) actionWithSize: (ccGridSize) v
{
	return [CCFadeOutDownTiles actionWithSize:v duration:duration_];
=======
-(CCActionInterval*) actionWithSize: (CGSize) v
{
	return [CCFadeOutDownTiles actionWithDuration:_duration size:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end
