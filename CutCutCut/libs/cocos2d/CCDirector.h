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
 */


#import "ccConfig.h"
#import "ccTypes.h"
#import "ccMacros.h"

#import "CCProtocols.h"
#import "Platforms/CCGL.h"
#import "kazmath/mat4.h"

/** @typedef ccDirectorProjection
 Possible OpenGL projections used by director
 */
typedef enum {
	/// sets a 2D projection (orthogonal projection).
	kCCDirectorProjection2D,

	/// sets a 3D projection with a fovy=60, znear=0.5f and zfar=1500.
	kCCDirectorProjection3D,

	/// it calls "updateProjection" on the projection delegate.
	kCCDirectorProjectionCustom,

	/// Detault projection is 3D projection
	kCCDirectorProjectionDefault = kCCDirectorProjection3D,

} ccDirectorProjection;


@class CCLabelAtlas;
@class CCScene;
@class CCScheduler;
@class CCActionManager;


#ifdef __CC_PLATFORM_IOS
#define CC_VIEWCONTROLLER UIViewController
#elif defined(__CC_PLATFORM_MAC)
#define CC_VIEWCONTROLLER NSObject
#endif

/**Class that creates and handle the main Window and manages how
and when to execute the Scenes.

<<<<<<< HEAD
 The CCDirector is also resposible for:
=======
 The CCDirector is also responsible for:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
  - initializing the OpenGL ES context
  - setting the OpenGL pixel format (default on is RGB565)
  - setting the OpenGL buffer depth (default one is 0-bit)
  - setting the projection (default one is 3D)

 Since the CCDirector is a singleton, the standard way to use it is by calling:
  - [[CCDirector sharedDirector] methodName];

 The CCDirector also sets the default OpenGL context:
  - GL_TEXTURE_2D is enabled
  - GL_VERTEX_ARRAY is enabled
  - GL_COLOR_ARRAY is enabled
  - GL_TEXTURE_COORD_ARRAY is enabled
*/
@interface CCDirector : CC_VIEWCONTROLLER
{
	// internal timer
<<<<<<< HEAD
	NSTimeInterval animationInterval_;
	NSTimeInterval oldAnimationInterval_;

	/* stats */
	BOOL	displayStats_;

	NSUInteger frames_;
	NSUInteger totalFrames_;
	ccTime secondsPerFrame_;

	ccTime		accumDt_;
	ccTime		frameRate_;
	CCLabelAtlas *FPSLabel_;
	CCLabelAtlas *SPFLabel_;
	CCLabelAtlas *drawsLabel_;

	/* is the running scene paused */
	BOOL isPaused_;

	/* The running scene */
	CCScene *runningScene_;

	/* This object will be visited after the scene. Useful to hook a notification node */
	id notificationNode_;

	/* will be the next 'runningScene' in the next frame
	 nextScene is a weak reference. */
	CCScene *nextScene_;

	/* If YES, then "old" scene will receive the cleanup message */
	BOOL	sendCleanupToScene_;

	/* scheduled scenes */
	NSMutableArray *scenesStack_;

	/* last time the main loop was updated */
	struct timeval lastUpdate_;
	/* delta time since last tick to main loop */
	ccTime dt;
	/* whether or not the next delta time will be zero */
	BOOL nextDeltaTimeZero_;

	/* projection used */
	ccDirectorProjection projection_;

	/* CCDirector delegate */
	id<CCDirectorDelegate>	delegate_;

	/* window size in points */
	CGSize	winSizeInPoints_;

	/* window size in pixels */
	CGSize	winSizeInPixels_;

	/* the cocos2d running thread */
	NSThread	*runningThread_;

	/* scheduler associated with this director */
	CCScheduler *scheduler_;

	/* action manager associated with this director */
	CCActionManager *actionManager_;
	
	/*  OpenGLView. On iOS it is a copy of self.view */
	CCGLView		*view_;
=======
	NSTimeInterval _animationInterval;
	NSTimeInterval _oldAnimationInterval;

	/* stats */
	BOOL	_displayStats;

	NSUInteger _frames;
	NSUInteger _totalFrames;
	ccTime _secondsPerFrame;

	ccTime		_accumDt;
	ccTime		_frameRate;
	CCLabelAtlas *_FPSLabel;
	CCLabelAtlas *_SPFLabel;
	CCLabelAtlas *_drawsLabel;

	/* is the running scene paused */
	BOOL _isPaused;
    
    /* Is the director running */
    BOOL _isAnimating;

	/* The running scene */
	CCScene *_runningScene;

	/* This object will be visited after the scene. Useful to hook a notification node */
	id _notificationNode;

	/* will be the next 'runningScene' in the next frame
	 nextScene is a weak reference. */
	CCScene *_nextScene;

	/* If YES, then "old" scene will receive the cleanup message */
	BOOL	_sendCleanupToScene;

	/* scheduled scenes */
	NSMutableArray *_scenesStack;

	/* last time the main loop was updated */
	struct timeval _lastUpdate;
	/* delta time since last tick to main loop */
	ccTime _dt;
	/* whether or not the next delta time will be zero */
	BOOL _nextDeltaTimeZero;

	/* projection used */
	ccDirectorProjection _projection;

	/* CCDirector delegate */
	id<CCDirectorDelegate>	_delegate;

	/* window size in points */
	CGSize	_winSizeInPoints;

	/* window size in pixels */
	CGSize	_winSizeInPixels;

	/* the cocos2d running thread */
	NSThread	*_runningThread;

	/* scheduler associated with this director */
	CCScheduler *_scheduler;

	/* action manager associated with this director */
	CCActionManager *_actionManager;
	
	/*  OpenGLView. On iOS it is a copy of self.view */
	CCGLView		*__view;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** returns the cocos2d thread.
 If you want to run any cocos2d task, run it in this thread.
 On iOS usually it is the main thread.
 @since v0.99.5
 */
@property (readonly, nonatomic ) NSThread *runningThread;
/** The current running Scene. Director can only run one Scene at the time */
@property (nonatomic,readonly) CCScene* runningScene;
/** The FPS value */
@property (nonatomic,readwrite, assign) NSTimeInterval animationInterval;
/** Whether or not to display director statistics */
@property (nonatomic, readwrite, assign) BOOL displayStats;
/** whether or not the next delta time will be zero */
@property (nonatomic,readwrite,assign) BOOL nextDeltaTimeZero;
/** Whether or not the Director is paused */
<<<<<<< HEAD
@property (nonatomic,readonly) BOOL isPaused;
=======
@property (nonatomic,readonly,getter=isPaused) BOOL paused;
/** Whether or not the Director is active (animating) */
@property (nonatomic,readonly) BOOL isAnimating;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** Sets an OpenGL projection */
@property (nonatomic,readwrite) ccDirectorProjection projection;
/** How many frames were called since the director started */
@property (nonatomic,readonly) NSUInteger	totalFrames;
/** seconds per frame */
@property (nonatomic, readonly) ccTime secondsPerFrame;

/** Whether or not the replaced scene will receive the cleanup message.
 If the new scene is pushed, then the old scene won't receive the "cleanup" message.
 If the new scene replaces the old one, the it will receive the "cleanup" message.
 @since v0.99.0
 */
@property (nonatomic, readonly) BOOL sendCleanupToScene;

/** This object will be visited after the main scene is visited.
 This object MUST implement the "visit" selector.
 Useful to hook a notification object, like CCNotifications (http://github.com/manucorporat/CCNotifications)
 @since v0.99.5
 */
@property (nonatomic, readwrite, retain) id	notificationNode;

<<<<<<< HEAD
/** CCDirector delegate. It shall implemente the CCDirectorDelegate protocol
 @since v0.99.5
 */
@property (nonatomic, readwrite, retain) id<CCDirectorDelegate> delegate;
=======
/** CCDirector delegate. It shall implement the CCDirectorDelegate protocol
 @since v0.99.5
 */
@property (nonatomic, readwrite, assign) id<CCDirectorDelegate> delegate;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

/** CCScheduler associated with this director
 @since v2.0
 */
@property (nonatomic,readwrite,retain) CCScheduler *scheduler;

/** CCActionManager associated with this director
 @since v2.0
 */
@property (nonatomic,readwrite,retain) CCActionManager *actionManager;

/** returns a shared instance of the director */
+(CCDirector*)sharedDirector;


#pragma mark Director - Stats

#pragma mark Director - Win Size
/** returns the size of the OpenGL view in points */
- (CGSize) winSize;

/** returns the size of the OpenGL view in pixels.
 On Mac winSize and winSizeInPixels return the same value.
 */
- (CGSize) winSizeInPixels;

/** changes the projection size */
-(void) reshapeProjection:(CGSize)newWindowSize;

<<<<<<< HEAD
/** converts a UIKit coordinate to an OpenGL coordinate
 Useful to convert (multi) touchs coordinates to the current layout (portrait or landscape)
=======
/** Sets the glViewport*/
-(void) setViewport;

/** converts a UIKit coordinate to an OpenGL coordinate
 Useful to convert (multi) touch coordinates to the current layout (portrait or landscape)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
-(CGPoint) convertToGL: (CGPoint) p;
/** converts an OpenGL coordinate to a UIKit coordinate
 Useful to convert node points to window points for calls such as glScissor
 */
-(CGPoint) convertToUI:(CGPoint)p;

/// XXX: missing description
-(float) getZEye;

#pragma mark Director - Scene Management

<<<<<<< HEAD
/**Enters the Director's main loop with the given Scene.
=======
/** Enters the Director's main loop with the given Scene.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 * Call it to run only your FIRST scene.
 * Don't call it if there is already a running scene.
 *
 * It will call pushScene: and then it will call startAnimation
 */
- (void) runWithScene:(CCScene*) scene;

<<<<<<< HEAD
/**Suspends the execution of the running scene, pushing it on the stack of suspended scenes.
=======
/** Suspends the execution of the running scene, pushing it on the stack of suspended scenes.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 * The new scene will be executed.
 * Try to avoid big stacks of pushed scenes to reduce memory allocation.
 * ONLY call it if there is a running scene.
 */
- (void) pushScene:(CCScene*) scene;

<<<<<<< HEAD
/**Pops out a scene from the queue.
=======
/** Pops out a scene from the queue.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 * This scene will replace the running one.
 * The running scene will be deleted. If there are no more scenes in the stack the execution is terminated.
 * ONLY call it if there is a running scene.
 */
- (void) popScene;

<<<<<<< HEAD
=======
/**Pops out all scenes from the queue until the root scene in the queue.
 * This scene will replace the running one.
 * Internally it will call `popToSceneStackLevel:1`
 */
- (void) popToRootScene;

/** Pops out all scenes from the queue until it reaches `level`.
 If level is 0, it will end the director.
 If level is 1, it will pop all scenes until it reaches to root scene.
 If level is <= than the current stack level, it won't do anything.
 */
-(void) popToSceneStackLevel:(NSUInteger)level;

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** Replaces the running scene with a new one. The running scene is terminated.
 * ONLY call it if there is a running scene.
 */
-(void) replaceScene: (CCScene*) scene;

/** Ends the execution, releases the running scene.
 It doesn't remove the OpenGL view from its parent. You have to do it manually.
 */
-(void) end;

/** Pauses the running scene.
 The running scene will be _drawed_ but all scheduled timers will be paused
<<<<<<< HEAD
 While paused, the draw rate will be 4 FPS to reduce CPU consuption
=======
 While paused, the draw rate will be 4 FPS to reduce CPU consumption
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
-(void) pause;

/** Resumes the paused scene
 The scheduled timers will be activated again.
 The "delta time" will be 0 (as if the game wasn't paused)
 */
-(void) resume;

/** Stops the animation. Nothing will be drawn. The main loop won't be triggered anymore.
<<<<<<< HEAD
 If you wan't to pause your animation call [pause] instead.
=======
 If you want to pause your animation call [pause] instead.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
-(void) stopAnimation;

/** The main loop is triggered again.
 Call this function only if [stopAnimation] was called earlier
<<<<<<< HEAD
 @warning Dont' call this function to start the main loop. To run the main loop call runWithScene
=======
 @warning Don't call this function to start the main loop. To run the main loop call runWithScene
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
-(void) startAnimation;

/** Draw the scene.
 This method is called every frame. Don't call it manually.
 */
-(void) drawScene;


// XXX: Hack. Should be placed on CCDirectorMac.h. Refactoring needed
#if defined(__CC_PLATFORM_MAC)
/** sets the openGL view */
-(void) setView:(CCGLView*)view;

/** returns the OpenGL view */
-(CCGLView*) view;
#endif

#pragma mark Director - Memory Helper

/** Removes all the cocos2d data that was cached automatically.
 It will purge the CCTextureCache, CCLabelBMFont cache.
 IMPORTANT: The CCSpriteFrameCache won't be purged. If you want to purge it, you have to purge it manually.
 @since v0.99.3
 */
-(void) purgeCachedData;

// OpenGL Helper

/** sets the OpenGL default values */
-(void) setGLDefaultValues;
/** enables/disables OpenGL alpha blending */
- (void) setAlphaBlending: (BOOL) on;
/** enables/disables OpenGL depth test */
- (void) setDepthTest: (BOOL) on;

// helper
/** creates the Stats labels */
-(void) createStatsLabel;
@end

// optimization. Should only be used to read it. Never to write it.
extern NSUInteger __ccNumberOfDraws;
