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


/* Idea of decoupling Window from Director taken from OC3D project: http://code.google.com/p/oc3d/
 */

#import <unistd.h>

// cocos2d imports
#import "CCDirector.h"
#import "CCScheduler.h"
#import "CCActionManager.h"
#import "CCTextureCache.h"
#import "CCAnimationCache.h"
#import "CCLabelAtlas.h"
#import "ccMacros.h"
#import "CCTransition.h"
#import "CCScene.h"
#import "CCSpriteFrameCache.h"
#import "CCTexture2D.h"
#import "CCLabelBMFont.h"
#import "CCLayer.h"
#import "ccGLStateCache.h"
#import "CCShaderCache.h"
<<<<<<< HEAD
=======
#import "ccFPSImages.h"
#import "CCDrawingPrimitives.h"
#import "CCConfiguration.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

// support imports
#import "Platforms/CCGL.h"
#import "Platforms/CCNS.h"

#import "Support/OpenGL_Internal.h"
#import "Support/CGPointExtension.h"
#import "Support/CCProfiling.h"
<<<<<<< HEAD
=======
#import "Support/CCFileUtils.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#ifdef __CC_PLATFORM_IOS
#import "Platforms/iOS/CCDirectorIOS.h"
#define CC_DIRECTOR_DEFAULT CCDirectorDisplayLink
#elif defined(__CC_PLATFORM_MAC)
#import "Platforms/Mac/CCDirectorMac.h"
#define CC_DIRECTOR_DEFAULT CCDirectorDisplayLink
#endif


#pragma mark -
#pragma mark Director - global variables (optimization)

// XXX it shoul be a Director ivar. Move it there once support for multiple directors is added
NSUInteger	__ccNumberOfDraws = 0;

#define kDefaultFPS		60.0	// 60 frames per second

extern NSString * cocos2dVersion(void);

@interface CCDirector (Private)
-(void) setNextScene;
// shows the statistics
-(void) showStats;
// calculates delta time since last time it was called
-(void) calculateDeltaTime;
// calculates the milliseconds per frame from the start of the frame
-(void) calculateMPF;
<<<<<<< HEAD
=======
// returns the FPS image data pointer and len
-(void)getFPSImageData:(unsigned char**)datapointer length:(NSUInteger*)len;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

@implementation CCDirector

<<<<<<< HEAD
@synthesize animationInterval = animationInterval_;
@synthesize runningScene = runningScene_;
@synthesize displayStats = displayStats_;
@synthesize nextDeltaTimeZero = nextDeltaTimeZero_;
@synthesize isPaused = isPaused_;
@synthesize sendCleanupToScene = sendCleanupToScene_;
@synthesize runningThread = runningThread_;
@synthesize notificationNode = notificationNode_;
@synthesize delegate = delegate_;
@synthesize totalFrames = totalFrames_;
@synthesize secondsPerFrame = secondsPerFrame_;
@synthesize scheduler = scheduler_;
@synthesize actionManager = actionManager_;
=======
@synthesize animationInterval = _animationInterval;
@synthesize runningScene = _runningScene;
@synthesize displayStats = _displayStats;
@synthesize nextDeltaTimeZero = _nextDeltaTimeZero;
@synthesize paused = _isPaused;
@synthesize isAnimating = _isAnimating;
@synthesize sendCleanupToScene = _sendCleanupToScene;
@synthesize runningThread = _runningThread;
@synthesize notificationNode = _notificationNode;
@synthesize delegate = _delegate;
@synthesize totalFrames = _totalFrames;
@synthesize secondsPerFrame = _secondsPerFrame;
@synthesize scheduler = _scheduler;
@synthesize actionManager = _actionManager;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

//
// singleton stuff
//
static CCDirector *_sharedDirector = nil;

+ (CCDirector *)sharedDirector
{
	if (!_sharedDirector) {

		//
		// Default Director is DisplayLink
		//
		if( [ [CCDirector class] isEqual:[self class]] )
			_sharedDirector = [[CC_DIRECTOR_DEFAULT alloc] init];
		else
			_sharedDirector = [[self alloc] init];
	}

	return _sharedDirector;
}

+(id)alloc
{
	NSAssert(_sharedDirector == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}

- (id) init
{
<<<<<<< HEAD
	CCLOG(@"cocos2d: %@", cocos2dVersion() );

	if( (self=[super init] ) ) {

		CCLOG(@"cocos2d: Using Director Type:%@", [self class]);

		// scenes
		runningScene_ = nil;
		nextScene_ = nil;

		notificationNode_ = nil;

		oldAnimationInterval_ = animationInterval_ = 1.0 / kDefaultFPS;
		scenesStack_ = [[NSMutableArray alloc] initWithCapacity:10];

		// Set default projection (3D)
		projection_ = kCCDirectorProjectionDefault;

		// projection delegate if "Custom" projection is used
		delegate_ = nil;

		// FPS
		displayStats_ = NO;
		totalFrames_ = frames_ = 0;

		// paused ?
		isPaused_ = NO;

		// running thread
		runningThread_ = nil;

		// scheduler
		scheduler_ = [[CCScheduler alloc] init];

		// action manager
		actionManager_ = [[CCActionManager alloc] init];
		[scheduler_ scheduleUpdateForTarget:actionManager_ priority:kCCActionManagerPriority paused:NO];

		winSizeInPixels_ = winSizeInPoints_ = CGSizeZero;
=======
	if( (self=[super init] ) ) {

		// scenes
		_runningScene = nil;
		_nextScene = nil;

		_notificationNode = nil;

		_oldAnimationInterval = _animationInterval = 1.0 / kDefaultFPS;
		_scenesStack = [[NSMutableArray alloc] initWithCapacity:10];

		// Set default projection (3D)
		_projection = kCCDirectorProjectionDefault;

		// projection delegate if "Custom" projection is used
		_delegate = nil;

		// FPS
		_displayStats = NO;
		_totalFrames = _frames = 0;

		// paused ?
		_isPaused = NO;

		// running thread
		_runningThread = nil;

		// scheduler
		_scheduler = [[CCScheduler alloc] init];

		// action manager
		_actionManager = [[CCActionManager alloc] init];
		[_scheduler scheduleUpdateForTarget:_actionManager priority:kCCPrioritySystem paused:NO];

		_winSizeInPixels = _winSizeInPoints = CGSizeZero;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

- (NSString*) description
{
<<<<<<< HEAD
	return [NSString stringWithFormat:@"<%@ = %08X | Size: %0.f x %0.f, view = %@>", [self class], self, winSizeInPoints_.width, winSizeInPoints_.height, view_];
=======
	return [NSString stringWithFormat:@"<%@ = %p | Size: %0.f x %0.f, view = %@>", [self class], self, _winSizeInPoints.width, _winSizeInPoints.height, __view];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) dealloc
{
	CCLOGINFO(@"cocos2d: deallocing %@", self);

<<<<<<< HEAD
	[FPSLabel_ release];
	[SPFLabel_ release];
	[drawsLabel_ release];
	[runningScene_ release];
	[notificationNode_ release];
	[scenesStack_ release];
	[scheduler_ release];
	[actionManager_ release];
	[delegate_ release];
=======
	[_FPSLabel release];
	[_SPFLabel release];
	[_drawsLabel release];
	[_runningScene release];
	[_notificationNode release];
	[_scenesStack release];
	[_scheduler release];
	[_actionManager release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	_sharedDirector = nil;

	[super dealloc];
}

-(void) setGLDefaultValues
{
<<<<<<< HEAD
	// This method SHOULD be called only after view_ was initialized
	NSAssert( view_, @"view_ must be initialized");

	[self setAlphaBlending: YES];
	[self setDepthTest: YES];
	[self setProjection: projection_];
=======
	// This method SHOULD be called only after __view was initialized
	NSAssert( __view, @"__view must be initialized");

	[self setAlphaBlending: YES];
	[self setDepthTest: __view.depthFormat];
	[self setProjection: _projection];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// set other opengl default values
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}

//
// Draw the Scene
//
- (void) drawScene
{
	// Override me
}

-(void) calculateDeltaTime
{
	struct timeval now;

	if( gettimeofday( &now, NULL) != 0 ) {
		CCLOG(@"cocos2d: error in gettimeofday");
<<<<<<< HEAD
		dt = 0;
=======
		_dt = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		return;
	}

	// new delta time
<<<<<<< HEAD
	if( nextDeltaTimeZero_ ) {
		dt = 0;
		nextDeltaTimeZero_ = NO;
	} else {
		dt = (now.tv_sec - lastUpdate_.tv_sec) + (now.tv_usec - lastUpdate_.tv_usec) / 1000000.0f;
		dt = MAX(0,dt);
=======
	if( _nextDeltaTimeZero ) {
		_dt = 0;
		_nextDeltaTimeZero = NO;
	} else {
		_dt = (now.tv_sec - _lastUpdate.tv_sec) + (now.tv_usec - _lastUpdate.tv_usec) / 1000000.0f;
		_dt = MAX(0,_dt);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

#ifdef DEBUG
	// If we are debugging our code, prevent big delta time
<<<<<<< HEAD
	if( dt > 0.2f )
		dt = 1/60.0f;
#endif

	lastUpdate_ = now;
=======
	if( _dt > 0.2f )
		_dt = 1/60.0f;
#endif

	_lastUpdate = now;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark Director - Memory Helper

-(void) purgeCachedData
{
	[CCLabelBMFont purgeCachedData];
<<<<<<< HEAD
	[[CCTextureCache sharedTextureCache] removeUnusedTextures];
=======
	if ([_sharedDirector view])
		[[CCTextureCache sharedTextureCache] removeUnusedTextures];
	[[CCFileUtils sharedFileUtils] purgeCachedEntries];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark Director - Scene OpenGL Helper

-(ccDirectorProjection) projection
{
<<<<<<< HEAD
	return projection_;
=======
	return _projection;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(float) getZEye
{
<<<<<<< HEAD
	return ( winSizeInPixels_.height / 1.1566f );
=======
	return ( _winSizeInPixels.height / 1.1566f / CC_CONTENT_SCALE_FACTOR() );
}

-(void) setViewport
{
	CCLOG(@"cocos2d: override me");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setProjection:(ccDirectorProjection)projection
{
	CCLOG(@"cocos2d: override me");
}

- (void) setAlphaBlending: (BOOL) on
{
	if (on) {
<<<<<<< HEAD
		ccGLEnable(CC_GL_BLEND);
		ccGLBlendFunc(CC_BLEND_SRC, CC_BLEND_DST);

	} else
		glDisable(GL_BLEND);
=======
		ccGLBlendFunc(CC_BLEND_SRC, CC_BLEND_DST);

	} else
		ccGLBlendFunc(GL_ONE, GL_ZERO);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CHECK_GL_ERROR_DEBUG();
}

- (void) setDepthTest: (BOOL) on
{
	if (on) {
		glClearDepth(1.0f);

		glEnable(GL_DEPTH_TEST);
		glDepthFunc(GL_LEQUAL);
//		glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
	} else
		glDisable( GL_DEPTH_TEST );

	CHECK_GL_ERROR_DEBUG();
}

#pragma mark Director Integration with a UIKit view

-(void) setView:(CCGLView*)view
{
//	NSAssert( view, @"OpenGLView must be non-nil");

<<<<<<< HEAD
	if( view != view_ ) {
=======
	if( view != __view ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	
#ifdef __CC_PLATFORM_IOS
		[super setView:view];
#endif
<<<<<<< HEAD
		[view_ release];
		view_ = [view retain];

		// set size
		winSizeInPixels_ = winSizeInPoints_ = CCNSSizeToCGSize( [view_ bounds].size );

		[self createStatsLabel];
		
		// it could be nil
		if( view )
			[self setGLDefaultValues];
=======
		[__view release];
		__view = [view retain];

		// set size
		_winSizeInPixels = _winSizeInPoints = CCNSSizeToCGSize( [__view bounds].size );

		// it could be nil
		if( view ) {
			[self createStatsLabel];
			[self setGLDefaultValues];
		}

		// Dump info once OpenGL was initilized
		[[CCConfiguration sharedConfiguration] dumpInfo];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		CHECK_GL_ERROR_DEBUG();
	}
}

-(CCGLView*) view
{
<<<<<<< HEAD
	return  view_;
=======
	return  __view;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


#pragma mark Director Scene Landscape

-(CGPoint)convertToGL:(CGPoint)uiPoint
{
	CCLOG(@"CCDirector#convertToGL: OVERRIDE ME.");
	return CGPointZero;
}

-(CGPoint)convertToUI:(CGPoint)glPoint
{
	CCLOG(@"CCDirector#convertToUI: OVERRIDE ME.");
	return CGPointZero;
}

-(CGSize)winSize
{
<<<<<<< HEAD
	return winSizeInPoints_;
=======
	return _winSizeInPoints;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CGSize)winSizeInPixels
{
<<<<<<< HEAD
	return winSizeInPixels_;
=======
	return _winSizeInPixels;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) reshapeProjection:(CGSize)newWindowSize
{
<<<<<<< HEAD
	winSizeInPixels_ = winSizeInPoints_ = newWindowSize;
	[self setProjection:projection_];
=======
	_winSizeInPixels = _winSizeInPoints = newWindowSize;
	[self setProjection:_projection];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark Director Scene Management

- (void)runWithScene:(CCScene*) scene
{
	NSAssert( scene != nil, @"Argument must be non-nil");
<<<<<<< HEAD
=======
	NSAssert(_runningScene == nil, @"This command can only be used to start the CCDirector. There is already a scene present.");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[self pushScene:scene];
	[self startAnimation];
}

-(void) replaceScene: (CCScene*) scene
{
<<<<<<< HEAD
	NSAssert( scene != nil, @"Argument must be non-nil");

	NSUInteger index = [scenesStack_ count];

	sendCleanupToScene_ = YES;
	[scenesStack_ replaceObjectAtIndex:index-1 withObject:scene];
	nextScene_ = scene;	// nextScene_ is a weak ref
=======
	NSAssert( _runningScene, @"Use runWithScene: instead to start the director");
	NSAssert( scene != nil, @"Argument must be non-nil");

	NSUInteger index = [_scenesStack count];

	_sendCleanupToScene = YES;
	[_scenesStack replaceObjectAtIndex:index-1 withObject:scene];
	_nextScene = scene;	// _nextScene is a weak ref
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) pushScene: (CCScene*) scene
{
	NSAssert( scene != nil, @"Argument must be non-nil");

<<<<<<< HEAD
	sendCleanupToScene_ = NO;

	[scenesStack_ addObject: scene];
	nextScene_ = scene;	// nextScene_ is a weak ref
=======
	_sendCleanupToScene = NO;

	[_scenesStack addObject: scene];
	_nextScene = scene;	// _nextScene is a weak ref
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) popScene
{
<<<<<<< HEAD
	NSAssert( runningScene_ != nil, @"A running Scene is needed");

	[scenesStack_ removeLastObject];
	NSUInteger c = [scenesStack_ count];
=======
	NSAssert( _runningScene != nil, @"A running Scene is needed");

	[_scenesStack removeLastObject];
	NSUInteger c = [_scenesStack count];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if( c == 0 )
		[self end];
	else {
<<<<<<< HEAD
		sendCleanupToScene_ = YES;
		nextScene_ = [scenesStack_ objectAtIndex:c-1];
	}
=======
		_sendCleanupToScene = YES;
		_nextScene = [_scenesStack objectAtIndex:c-1];
	}
}

-(void) popToRootScene
{
	[self popToSceneStackLevel:1];
}

-(void) popToSceneStackLevel:(NSUInteger)level
{
	NSAssert(_runningScene != nil, @"A running Scene is needed");
	NSUInteger c = [_scenesStack count];

	// level 0? -> end
	if( level == 0) {
		[self end];
		return;
	}

	// current level or lower -> nothing
	if( level >= c)
		return;

	// pop stack until reaching desired level
	while (c > level) {
		CCScene *current = [_scenesStack lastObject];
		if( [current isRunning] ){
			[current onExitTransitionDidStart];
			[current onExit];
		}
		[current cleanup];

		[_scenesStack removeLastObject];
		c--;
	}
	_nextScene = [_scenesStack lastObject];
	_sendCleanupToScene = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) end
{
<<<<<<< HEAD
	[runningScene_ onExit];
	[runningScene_ cleanup];
	[runningScene_ release];

	runningScene_ = nil;
	nextScene_ = nil;

	// remove all objects, but don't release it.
	// runWithScene might be executed after 'end'.
	[scenesStack_ removeAllObjects];

	[self stopAnimation];

	[FPSLabel_ release];
	[SPFLabel_ release];
	[drawsLabel_ release];
	FPSLabel_ = nil, SPFLabel_=nil, drawsLabel_=nil;

	[delegate_ release];
	delegate_ = nil;
=======
	[_runningScene onExitTransitionDidStart];
	[_runningScene onExit];
	[_runningScene cleanup];
	[_runningScene release];

	_runningScene = nil;
	_nextScene = nil;

	// remove all objects, but don't release it.
	// runWithScene might be executed after 'end'.
	[_scenesStack removeAllObjects];

	[self stopAnimation];

	[_FPSLabel release];
	[_SPFLabel release];
	[_drawsLabel release];
	_FPSLabel = nil, _SPFLabel=nil, _drawsLabel=nil;

	_delegate = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[self setView:nil];
	
	// Purge bitmap cache
	[CCLabelBMFont purgeCachedData];

	// Purge all managers / caches
<<<<<<< HEAD
=======
	ccDrawFree();
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[CCAnimationCache purgeSharedAnimationCache];
	[CCSpriteFrameCache purgeSharedSpriteFrameCache];
	[CCTextureCache purgeSharedTextureCache];
	[CCShaderCache purgeSharedShaderCache];
<<<<<<< HEAD
=======
	[[CCFileUtils sharedFileUtils] purgeCachedEntries];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// OpenGL view

	// Since the director doesn't attach the openglview to the window
	// it shouldn't remove it from the window too.
//	[openGLView_ removeFromSuperview];


	// Invalidate GL state cache
	ccGLInvalidateStateCache();

	CHECK_GL_ERROR();
}

-(void) setNextScene
{
	Class transClass = [CCTransitionScene class];
<<<<<<< HEAD
	BOOL runningIsTransition = [runningScene_ isKindOfClass:transClass];
	BOOL newIsTransition = [nextScene_ isKindOfClass:transClass];

	// If it is not a transition, call onExit/cleanup
	if( ! newIsTransition ) {
		[runningScene_ onExit];

		// issue #709. the root node (scene) should receive the cleanup message too
		// otherwise it might be leaked.
		if( sendCleanupToScene_)
			[runningScene_ cleanup];
	}

	[runningScene_ release];

	runningScene_ = [nextScene_ retain];
	nextScene_ = nil;

	if( ! runningIsTransition ) {
		[runningScene_ onEnter];
		[runningScene_ onEnterTransitionDidFinish];
=======
	BOOL runningIsTransition = [_runningScene isKindOfClass:transClass];
	BOOL newIsTransition = [_nextScene isKindOfClass:transClass];

	// If it is not a transition, call onExit/cleanup
	if( ! newIsTransition ) {
		[_runningScene onExitTransitionDidStart];
		[_runningScene onExit];

		// issue #709. the root node (scene) should receive the cleanup message too
		// otherwise it might be leaked.
		if( _sendCleanupToScene)
			[_runningScene cleanup];
	}

	[_runningScene release];

	_runningScene = [_nextScene retain];
	_nextScene = nil;

	if( ! runningIsTransition ) {
		[_runningScene onEnter];
		[_runningScene onEnterTransitionDidFinish];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) pause
{
<<<<<<< HEAD
	if( isPaused_ )
		return;

	oldAnimationInterval_ = animationInterval_;
=======
	if( _isPaused )
		return;

	_oldAnimationInterval = _animationInterval;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// when paused, don't consume CPU
	[self setAnimationInterval:1/4.0];
	
	[self willChangeValueForKey:@"isPaused"];
<<<<<<< HEAD
	isPaused_ = YES;
=======
	_isPaused = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self didChangeValueForKey:@"isPaused"];
}

-(void) resume
{
<<<<<<< HEAD
	if( ! isPaused_ )
		return;

	[self setAnimationInterval: oldAnimationInterval_];

	if( gettimeofday( &lastUpdate_, NULL) != 0 ) {
=======
	if( ! _isPaused )
		return;

	[self setAnimationInterval: _oldAnimationInterval];

	if( gettimeofday( &_lastUpdate, NULL) != 0 ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		CCLOG(@"cocos2d: Director: Error in gettimeofday");
	}

	[self willChangeValueForKey:@"isPaused"];
<<<<<<< HEAD
	isPaused_ = NO;
	[self didChangeValueForKey:@"isPaused"];

	dt = 0;
=======
	_isPaused = NO;
	[self didChangeValueForKey:@"isPaused"];

	_dt = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void)startAnimation
{
<<<<<<< HEAD
	CCLOG(@"cocos2d: Director#startAnimation. Override me");
=======
	_nextDeltaTimeZero = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void)stopAnimation
{
	CCLOG(@"cocos2d: Director#stopAnimation. Override me");
}

- (void)setAnimationInterval:(NSTimeInterval)interval
{
	CCLOG(@"cocos2d: Director#setAnimationInterval. Override me");
}


// display statistics
-(void) showStats
{
<<<<<<< HEAD
	frames_++;
	accumDt_ += dt;

	if( displayStats_ ) {
		// Ms per Frame

		if( accumDt_ > CC_DIRECTOR_STATS_INTERVAL)
		{
			NSString *spfstr = [[NSString alloc] initWithFormat:@"%.3f", secondsPerFrame_];
			[SPFLabel_ setString:spfstr];
			[spfstr release];

			frameRate_ = frames_/accumDt_;
			frames_ = 0;
			accumDt_ = 0;
=======
	_frames++;
	_accumDt += _dt;

	if( _displayStats ) {
		// Ms per Frame

		if( _accumDt > CC_DIRECTOR_STATS_INTERVAL)
		{
			NSString *spfstr = [[NSString alloc] initWithFormat:@"%.3f", _secondsPerFrame];
			[_SPFLabel setString:spfstr];
			[spfstr release];

			_frameRate = _frames/_accumDt;
			_frames = 0;
			_accumDt = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

//			sprintf(format,"%.1f",frameRate);
//			[FPSLabel setCString:format];

<<<<<<< HEAD
			NSString *fpsstr = [[NSString alloc] initWithFormat:@"%.1f", frameRate_];
			[FPSLabel_ setString:fpsstr];
			[fpsstr release];
			
			NSString *draws = [[NSString alloc] initWithFormat:@"%4d", __ccNumberOfDraws];
			[drawsLabel_ setString:draws];
			[draws release];
		}

		[drawsLabel_ visit];
		[FPSLabel_ visit];
		[SPFLabel_ visit];
=======
			NSString *fpsstr = [[NSString alloc] initWithFormat:@"%.1f", _frameRate];
			[_FPSLabel setString:fpsstr];
			[fpsstr release];
			
			NSString *draws = [[NSString alloc] initWithFormat:@"%4lu", (unsigned long)__ccNumberOfDraws];
			[_drawsLabel setString:draws];
			[draws release];
		}

		[_drawsLabel visit];
		[_FPSLabel visit];
		[_SPFLabel visit];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	
	__ccNumberOfDraws = 0;
}

-(void) calculateMPF
{
	struct timeval now;
	gettimeofday( &now, NULL);

<<<<<<< HEAD
	secondsPerFrame_ = (now.tv_sec - lastUpdate_.tv_sec) + (now.tv_usec - lastUpdate_.tv_usec) / 1000000.0f;
=======
	_secondsPerFrame = (now.tv_sec - _lastUpdate.tv_sec) + (now.tv_usec - _lastUpdate.tv_usec) / 1000000.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark Director - Helper

<<<<<<< HEAD
-(void) createStatsLabel
{
	if( FPSLabel_ && SPFLabel_ ) {
		CCTexture2D *texture = [FPSLabel_ texture];

		[FPSLabel_ release];
		[SPFLabel_ release];
		[[CCTextureCache sharedTextureCache ] removeTexture:texture];
		FPSLabel_ = nil;
		SPFLabel_ = nil;
=======
-(void)getFPSImageData:(unsigned char**)datapointer length:(NSUInteger*)len
{
	*datapointer = cc_fps_images_png;
	*len = cc_fps_images_len();
}

-(void) createStatsLabel
{
	CCTexture2D *texture;
	CCTextureCache *textureCache = [CCTextureCache sharedTextureCache];
	
	if( _FPSLabel && _SPFLabel ) {

		[_FPSLabel release];
		[_SPFLabel release];
		[_drawsLabel release];
		[textureCache removeTextureForKey:@"cc_fps_images"];
		_FPSLabel = nil;
		_SPFLabel = nil;
		_drawsLabel = nil;
		
		[[CCFileUtils sharedFileUtils] purgeCachedEntries];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	CCTexture2DPixelFormat currentFormat = [CCTexture2D defaultAlphaPixelFormat];
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
<<<<<<< HEAD
	FPSLabel_ = [[CCLabelAtlas alloc]  initWithString:@"00.0" charMapFile:@"fps_images.png" itemWidth:12 itemHeight:32 startCharMap:'.'];
	SPFLabel_ = [[CCLabelAtlas alloc]  initWithString:@"0.000" charMapFile:@"fps_images.png" itemWidth:12 itemHeight:32 startCharMap:'.'];
	drawsLabel_ = [[CCLabelAtlas alloc]  initWithString:@"000" charMapFile:@"fps_images.png" itemWidth:12 itemHeight:32 startCharMap:'.'];

	[CCTexture2D setDefaultAlphaPixelFormat:currentFormat];

	[drawsLabel_ setPosition: ccpAdd( ccp(0,34), CC_DIRECTOR_STATS_POSITION ) ];
	[SPFLabel_ setPosition: ccpAdd( ccp(0,17), CC_DIRECTOR_STATS_POSITION ) ];
	[FPSLabel_ setPosition: CC_DIRECTOR_STATS_POSITION ];
=======

	unsigned char *data;
	NSUInteger data_len;
	[self getFPSImageData:&data length:&data_len];
	
	NSData *nsdata = [NSData dataWithBytes:data length:data_len];
	CGDataProviderRef imgDataProvider = CGDataProviderCreateWithCFData( (CFDataRef) nsdata);
	CGImageRef imageRef = CGImageCreateWithPNGDataProvider(imgDataProvider, NULL, true, kCGRenderingIntentDefault);
	texture = [textureCache addCGImage:imageRef forKey:@"cc_fps_images"];
	CGDataProviderRelease(imgDataProvider);
	CGImageRelease(imageRef);

	_FPSLabel = [[CCLabelAtlas alloc]  initWithString:@"00.0" texture:texture itemWidth:12 itemHeight:32 startCharMap:'.'];
	_SPFLabel = [[CCLabelAtlas alloc]  initWithString:@"0.000" texture:texture itemWidth:12 itemHeight:32 startCharMap:'.'];
	_drawsLabel = [[CCLabelAtlas alloc]  initWithString:@"000" texture:texture itemWidth:12 itemHeight:32 startCharMap:'.'];

	[CCTexture2D setDefaultAlphaPixelFormat:currentFormat];

	[_drawsLabel setPosition: ccpAdd( ccp(0,34), CC_DIRECTOR_STATS_POSITION ) ];
	[_SPFLabel setPosition: ccpAdd( ccp(0,17), CC_DIRECTOR_STATS_POSITION ) ];
	[_FPSLabel setPosition: CC_DIRECTOR_STATS_POSITION ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

