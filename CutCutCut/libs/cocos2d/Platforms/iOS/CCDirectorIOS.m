/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2010 Ricardo Quesada
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

// Only compile this code on iOS. These files should NOT be included on your Mac project.
// But in case they are included, it won't be compiled.
#import "../../ccMacros.h"
#ifdef __CC_PLATFORM_IOS

#import <unistd.h>

// cocos2d imports
#import "CCDirectorIOS.h"
#import "CCTouchDelegateProtocol.h"
#import "CCTouchDispatcher.h"
#import "../../CCScheduler.h"
#import "../../CCActionManager.h"
#import "../../CCTextureCache.h"
#import "../../ccMacros.h"
#import "../../CCScene.h"
#import "../../CCGLProgram.h"
#import "../../ccGLStateCache.h"
#import "../../CCLayer.h"
<<<<<<< HEAD
=======
#import "../../ccFPSImages.h"
#import "../../CCConfiguration.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

// support imports
#import "../../Support/OpenGL_Internal.h"
#import "../../Support/CGPointExtension.h"
#import "../../Support/TransformUtils.h"
<<<<<<< HEAD
=======
#import "../../Support/CCFileUtils.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#import "kazmath/kazmath.h"
#import "kazmath/GL/matrix.h"

#if CC_ENABLE_PROFILERS
#import "../../Support/CCProfiling.h"
#endif


#pragma mark -
#pragma mark Director - global variables (optimization)

CGFloat	__ccContentScaleFactor = 1;

#pragma mark -
#pragma mark Director

@interface CCDirector ()
-(void) setNextScene;
-(void) showStats;
-(void) calculateDeltaTime;
-(void) calculateMPF;
@end

@implementation CCDirector (iOSExtensionClassMethods)

+(Class) defaultDirector
{
	return [CCDirectorDisplayLink class];
}

-(void) setInterfaceOrientationDelegate:(id)delegate
{
	// override me
}

-(CCTouchDispatcher*) touchDispatcher
{
	return nil;
}

-(void) setTouchDispatcher:(CCTouchDispatcher*)touchDispatcher
{
	//
}
@end



#pragma mark -
#pragma mark CCDirectorIOS

@interface CCDirectorIOS ()
-(void) updateContentScaleFactor;
@end

@implementation CCDirectorIOS

- (id) init
{
	if( (self=[super init]) ) {

		__ccContentScaleFactor = 1;
<<<<<<< HEAD
		isContentScaleSupported_ = NO;

		touchDispatcher_ = [[CCTouchDispatcher alloc] init];

		// running thread is main thread on iOS
		runningThread_ = [NSThread currentThread];
=======
		_isContentScaleSupported = NO;

		_touchDispatcher = [[CCTouchDispatcher alloc] init];

		// running thread is main thread on iOS
		_runningThread = [NSThread currentThread];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		
		// Apparently it comes with a default view, and we don't want it
//		[self setView:nil];
	}

	return self;
}

- (void) dealloc
{
<<<<<<< HEAD
	[touchDispatcher_ release];
=======
	[_touchDispatcher release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

//
// Draw the Scene
//
- (void) drawScene
{
	/* calculate "global" dt */
	[self calculateDeltaTime];

	CCGLView *openGLview = (CCGLView*)[self view];

	[EAGLContext setCurrentContext: [openGLview context]];

	/* tick before glClear: issue #533 */
<<<<<<< HEAD
	if( ! isPaused_ )
		[scheduler_ update: dt];
=======
	if( ! _isPaused )
		[_scheduler update: _dt];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	/* to avoid flickr, nextScene MUST be here: after tick and before draw.
	 XXX: Which bug is this one. It seems that it can't be reproduced with v0.9 */
<<<<<<< HEAD
	if( nextScene_ )
=======
	if( _nextScene )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self setNextScene];

	kmGLPushMatrix();

<<<<<<< HEAD
	[runningScene_ visit];

	[notificationNode_ visit];

	if( displayStats_ )
=======
	[_runningScene visit];

	[_notificationNode visit];

	if( _displayStats )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self showStats];

	kmGLPopMatrix();

<<<<<<< HEAD
	totalFrames_++;

	[openGLview swapBuffers];

	if( displayStats_ )
		[self calculateMPF];
}

-(void) setProjection:(ccDirectorProjection)projection
{
	CGSize size = winSizeInPixels_;
	CGSize sizePoint = winSizeInPoints_;

	glViewport(0, 0, size.width * CC_CONTENT_SCALE_FACTOR(), size.height * CC_CONTENT_SCALE_FACTOR() );
=======
	_totalFrames++;

	[openGLview swapBuffers];

	if( _displayStats )
		[self calculateMPF];
}

-(void) setViewport
{
	CGSize size = _winSizeInPixels;
	glViewport(0, 0, size.width, size.height );
}

-(void) setProjection:(ccDirectorProjection)projection
{
	CGSize size = _winSizeInPixels;
	CGSize sizePoint = _winSizeInPoints;
    
	[self setViewport];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	switch (projection) {
		case kCCDirectorProjection2D:

			kmGLMatrixMode(KM_GL_PROJECTION);
			kmGLLoadIdentity();

			kmMat4 orthoMatrix;
<<<<<<< HEAD
			kmMat4OrthographicProjection(&orthoMatrix, 0, size.width, 0, size.height, -1024, 1024 );
=======
			kmMat4OrthographicProjection(&orthoMatrix, 0, size.width / CC_CONTENT_SCALE_FACTOR(), 0, size.height / CC_CONTENT_SCALE_FACTOR(), -1024, 1024 );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			kmGLMultMatrix( &orthoMatrix );

			kmGLMatrixMode(KM_GL_MODELVIEW);
			kmGLLoadIdentity();
			break;

		case kCCDirectorProjection3D:
		{
<<<<<<< HEAD
			// reset the viewport if 3d proj & retina display
			if( CC_CONTENT_SCALE_FACTOR() != 1 )
				glViewport(-size.width/2, -size.height/2, size.width * CC_CONTENT_SCALE_FACTOR(), size.height * CC_CONTENT_SCALE_FACTOR() );

=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			float zeye = [self getZEye];

			kmMat4 matrixPerspective, matrixLookup;

			kmGLMatrixMode(KM_GL_PROJECTION);
			kmGLLoadIdentity();

			// issue #1334
			kmMat4PerspectiveProjection( &matrixPerspective, 60, (GLfloat)size.width/size.height, 0.1f, zeye*2);
//			kmMat4PerspectiveProjection( &matrixPerspective, 60, (GLfloat)size.width/size.height, 0.1f, 1500);

			kmGLMultMatrix(&matrixPerspective);

			kmGLMatrixMode(KM_GL_MODELVIEW);
			kmGLLoadIdentity();
			kmVec3 eye, center, up;
			kmVec3Fill( &eye, sizePoint.width/2, sizePoint.height/2, zeye );
			kmVec3Fill( &center, sizePoint.width/2, sizePoint.height/2, 0 );
			kmVec3Fill( &up, 0, 1, 0);
			kmMat4LookAt(&matrixLookup, &eye, &center, &up);
			kmGLMultMatrix(&matrixLookup);
			break;
		}

		case kCCDirectorProjectionCustom:
<<<<<<< HEAD
			if( [delegate_ respondsToSelector:@selector(updateProjection)] )
				[delegate_ updateProjection];
=======
			if( [_delegate respondsToSelector:@selector(updateProjection)] )
				[_delegate updateProjection];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			break;

		default:
			CCLOG(@"cocos2d: Director: unrecognized projection");
			break;
	}

<<<<<<< HEAD
	projection_ = projection;
=======
	_projection = projection;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	ccSetProjectionMatrixDirty();
}

<<<<<<< HEAD
=======
// override default logic
- (void)runWithScene:(CCScene*) scene
{
	NSAssert( scene != nil, @"Argument must be non-nil");
	NSAssert(_runningScene == nil, @"This command can only be used to start the CCDirector. There is already a scene present.");
	
	[self pushScene:scene];

	NSThread *thread = [self runningThread];
	[self performSelector:@selector(drawScene) onThread:thread withObject:nil waitUntilDone:YES];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#pragma mark Director - TouchDispatcher

-(CCTouchDispatcher*) touchDispatcher
{
<<<<<<< HEAD
	return touchDispatcher_;
=======
	return _touchDispatcher;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setTouchDispatcher:(CCTouchDispatcher*)touchDispatcher
{
<<<<<<< HEAD
	if( touchDispatcher != touchDispatcher_ ) {
		[touchDispatcher_ release];
		touchDispatcher_ = [touchDispatcher retain];
=======
	if( touchDispatcher != _touchDispatcher ) {
		[_touchDispatcher release];
		_touchDispatcher = [touchDispatcher retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

#pragma mark Director - Retina Display

-(CGFloat) contentScaleFactor
{
	return __ccContentScaleFactor;
}

-(void) setContentScaleFactor:(CGFloat)scaleFactor
{
	if( scaleFactor != __ccContentScaleFactor ) {

		__ccContentScaleFactor = scaleFactor;
<<<<<<< HEAD
		winSizeInPixels_ = CGSizeMake( winSizeInPoints_.width * scaleFactor, winSizeInPoints_.height * scaleFactor );

		if( view_ )
			[self updateContentScaleFactor];

		// update projection
		[self setProjection:projection_];
=======
		_winSizeInPixels = CGSizeMake( _winSizeInPoints.width * scaleFactor, _winSizeInPoints.height * scaleFactor );

		if( __view )
			[self updateContentScaleFactor];

		// update projection
		[self setProjection:_projection];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) updateContentScaleFactor
{
<<<<<<< HEAD
	NSAssert( [view_ respondsToSelector:@selector(setContentScaleFactor:)], @"cocos2d v2.0+ runs on iOS 4 or later");

	[view_ setContentScaleFactor: __ccContentScaleFactor];
	isContentScaleSupported_ = YES;
=======
	NSAssert( [__view respondsToSelector:@selector(setContentScaleFactor:)], @"cocos2d v2.0+ runs on iOS 4 or later");

	[__view setContentScaleFactor: __ccContentScaleFactor];
	_isContentScaleSupported = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) enableRetinaDisplay:(BOOL)enabled
{
	// Already enabled ?
	if( enabled && __ccContentScaleFactor == 2 )
		return YES;

	// Already disabled
	if( ! enabled && __ccContentScaleFactor == 1 )
		return YES;

	// setContentScaleFactor is not supported
<<<<<<< HEAD
	if (! [view_ respondsToSelector:@selector(setContentScaleFactor:)])
=======
	if (! [__view respondsToSelector:@selector(setContentScaleFactor:)])
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		return NO;

	// SD device
	if ([[UIScreen mainScreen] scale] == 1.0)
		return NO;

	float newScale = enabled ? 2 : 1;
	[self setContentScaleFactor:newScale];

	// Load Hi-Res FPS label
<<<<<<< HEAD
=======
	[[CCFileUtils sharedFileUtils] buildSearchResolutionsOrder];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self createStatsLabel];

	return YES;
}

// overriden, don't call super
-(void) reshapeProjection:(CGSize)size
{
<<<<<<< HEAD
	winSizeInPoints_ = [view_ bounds].size;
	winSizeInPixels_ = CGSizeMake(winSizeInPoints_.width * __ccContentScaleFactor, winSizeInPoints_.height *__ccContentScaleFactor);

	[self setProjection:projection_];
=======
	_winSizeInPoints = [__view bounds].size;
	_winSizeInPixels = CGSizeMake(_winSizeInPoints.width * __ccContentScaleFactor, _winSizeInPoints.height *__ccContentScaleFactor);

	[self setProjection:_projection];
  
	if( [_delegate respondsToSelector:@selector(directorDidReshapeProjection:)] )
		[_delegate directorDidReshapeProjection:self];
}

static void
GLToClipTransform(kmMat4 *transformOut)
{
	kmMat4 projection;
	kmGLGetMatrix(KM_GL_PROJECTION, &projection);
	
	kmMat4 modelview;
	kmGLGetMatrix(KM_GL_MODELVIEW, &modelview);
	
	kmMat4Multiply(transformOut, &projection, &modelview);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark Director Point Convertion

-(CGPoint)convertToGL:(CGPoint)uiPoint
{
<<<<<<< HEAD
	CGSize s = winSizeInPoints_;
	float newY = s.height - uiPoint.y;

	return ccp( uiPoint.x, newY );
}

-(CGPoint)convertToUI:(CGPoint)glPoint
{
	CGSize winSize = winSizeInPoints_;
	int oppositeY = winSize.height - glPoint.y;

	return ccp(glPoint.x, oppositeY);
=======
	kmMat4 transform;
	GLToClipTransform(&transform);
	
	kmMat4 transformInv;
	kmMat4Inverse(&transformInv, &transform);
	
	// Calculate z=0 using -> transform*[0, 0, 0, 1]/w
	kmScalar zClip = transform.mat[14]/transform.mat[15];
	
	CGSize glSize = __view.bounds.size;
	kmVec3 clipCoord = {2.0*uiPoint.x/glSize.width - 1.0, 1.0 - 2.0*uiPoint.y/glSize.height, zClip};
	
	kmVec3 glCoord;
	kmVec3TransformCoord(&glCoord, &clipCoord, &transformInv);
	
//	NSLog(@"uiPoint: %@, glPoint: %@", NSStringFromCGPoint(uiPoint), NSStringFromCGPoint(ccp(glCoord.x, glCoord.y)));
	return ccp(glCoord.x, glCoord.y);
}

-(CGPoint)convertTouchToGL:(UITouch*)touch
{
	CGPoint uiPoint = [touch locationInView: [touch view]];
	return [self convertToGL:uiPoint];
}


-(CGPoint)convertToUI:(CGPoint)glPoint
{
	kmMat4 transform;
	GLToClipTransform(&transform);
		
	kmVec3 clipCoord;
	// Need to calculate the zero depth from the transform.
	kmVec3 glCoord = {glPoint.x, glPoint.y, 0.0};
	kmVec3TransformCoord(&clipCoord, &glCoord, &transform);
	
	CGSize glSize = __view.bounds.size;
	return ccp(glSize.width*(clipCoord.x*0.5 + 0.5), glSize.height*(-clipCoord.y*0.5 + 0.5));
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) end
{
	// don't release the event handlers
	// They are needed in case the director is run again
<<<<<<< HEAD
	[touchDispatcher_ removeAllDelegates];
=======
	[_touchDispatcher removeAllDelegates];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super end];
}

#pragma mark Director - UIViewController delegate


-(void) setView:(CCGLView *)view
{
<<<<<<< HEAD
	if( view != view_) {
		[super setView:view];

		// set size
		winSizeInPixels_ = CGSizeMake(winSizeInPoints_.width * __ccContentScaleFactor, winSizeInPoints_.height *__ccContentScaleFactor);

		if( __ccContentScaleFactor != 1 )
			[self updateContentScaleFactor];

		[view setTouchDelegate: touchDispatcher_];
		[touchDispatcher_ setDispatchEvents: YES];
=======
	if( view != __view) {
		[super setView:view];

		if( view ) {
			// set size
			_winSizeInPixels = CGSizeMake(_winSizeInPoints.width * __ccContentScaleFactor, _winSizeInPoints.height *__ccContentScaleFactor);

			if( __ccContentScaleFactor != 1 )
				[self updateContentScaleFactor];

			[view setTouchDelegate: _touchDispatcher];
			[_touchDispatcher setDispatchEvents: YES];
		}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	BOOL ret =YES;
<<<<<<< HEAD
	if( [delegate_ respondsToSelector:_cmd] )
		ret = (BOOL) [delegate_ shouldAutorotateToInterfaceOrientation:interfaceOrientation];
=======
	if( [_delegate respondsToSelector:_cmd] )
		ret = (BOOL) [_delegate shouldAutorotateToInterfaceOrientation:interfaceOrientation];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return ret;
}

<<<<<<< HEAD
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	// do something ?
}
=======
// Commented. See issue #1453 for further info: http://code.google.com/p/cocos2d-iphone/issues/detail?id=1453
//-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//	if( [_delegate respondsToSelector:_cmd] )
//		[_delegate willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
//}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


-(void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self startAnimation];
}

-(void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
//	[self startAnimation];
}

-(void) viewWillDisappear:(BOOL)animated
{
//	[self stopAnimation];

	[super viewWillDisappear:animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
	[self stopAnimation];

	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
	// Release any cached data, images, etc that aren't in use.
	[super purgeCachedData];

    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

-(void) viewDidLoad
{
	CCLOG(@"cocos2d: viewDidLoad");

	[super viewDidLoad];
}


- (void)viewDidUnload
{
	CCLOG(@"cocos2d: viewDidUnload");

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
<<<<<<< HEAD
=======

#pragma mark helper

-(void)getFPSImageData:(unsigned char**)datapointer length:(NSUInteger*)len
{
	int device = [[CCConfiguration sharedConfiguration] runningDevice];

	if( device == kCCDeviceiPadRetinaDisplay) {
		*datapointer = cc_fps_images_ipadhd_png;
		*len = cc_fps_images_ipadhd_len();
		
	} else if( device == kCCDeviceiPhoneRetinaDisplay || device == kCCDeviceiPhone5RetinaDisplay ) {
		*datapointer = cc_fps_images_hd_png;
		*len = cc_fps_images_hd_len();

	} else {
		*datapointer = cc_fps_images_png;
		*len = cc_fps_images_len();
	}
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end


#pragma mark -
#pragma mark DirectorDisplayLink

@implementation CCDirectorDisplayLink


-(void) mainLoop:(id)sender
{
	[self drawScene];
}

- (void)setAnimationInterval:(NSTimeInterval)interval
{
<<<<<<< HEAD
	animationInterval_ = interval;
	if(displayLink_){
=======
	_animationInterval = interval;
	if(_displayLink){
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self stopAnimation];
		[self startAnimation];
	}
}

- (void) startAnimation
{
<<<<<<< HEAD
	NSAssert( displayLink_ == nil, @"displayLink must be nil. Calling startAnimation twice?");

	gettimeofday( &lastUpdate_, NULL);

	// approximate frame rate
	// assumes device refreshes at 60 fps
	int frameInterval = (int) floor(animationInterval_ * 60.0f);

	CCLOG(@"cocos2d: animation started with frame interval: %.2f", 60.0f/frameInterval);

	displayLink_ = [CADisplayLink displayLinkWithTarget:self selector:@selector(mainLoop:)];
	[displayLink_ setFrameInterval:frameInterval];

#if CC_DIRECTOR_IOS_USE_BACKGROUND_THREAD
	//
	runningThread_ = [[NSThread alloc] initWithTarget:self selector:@selector(threadMainLoop) object:nil];
	[runningThread_ start];

#else
	// setup DisplayLink in main thread
	[displayLink_ addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
#endif


=======
	[super startAnimation];

    if(_isAnimating)
        return;

	gettimeofday( &_lastUpdate, NULL);

	// approximate frame rate
	// assumes device refreshes at 60 fps
	int frameInterval = (int) floor(_animationInterval * 60.0f);

	CCLOG(@"cocos2d: animation started with frame interval: %.2f", 60.0f/frameInterval);

	_displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(mainLoop:)];
	[_displayLink setFrameInterval:frameInterval];

#if CC_DIRECTOR_IOS_USE_BACKGROUND_THREAD
	//
	_runningThread = [[NSThread alloc] initWithTarget:self selector:@selector(threadMainLoop) object:nil];
	[_runningThread start];

#else
	// setup DisplayLink in main thread
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
#endif

    _isAnimating = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) stopAnimation
{
<<<<<<< HEAD
	CCLOG(@"cocos2d: animation stopped");

#if CC_DIRECTOR_IOS_USE_BACKGROUND_THREAD
	[runningThread_ cancel];
	[runningThread_ release];
	runningThread_ = nil;
#endif

	[displayLink_ invalidate];
	displayLink_ = nil;
=======
    if(!_isAnimating)
        return;

	CCLOG(@"cocos2d: animation stopped");

#if CC_DIRECTOR_IOS_USE_BACKGROUND_THREAD
	[_runningThread cancel];
	[_runningThread release];
	_runningThread = nil;
#endif

	[_displayLink invalidate];
	_displayLink = nil;
    _isAnimating = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// Overriden in order to use a more stable delta time
-(void) calculateDeltaTime
{
<<<<<<< HEAD
    // New delta time
    if( nextDeltaTimeZero_ ) {
        dt = 0;
        nextDeltaTimeZero_ = NO;
    } else {
        dt = displayLink_.timestamp - lastDisplayTime_;
        dt = MAX(0,dt);
    }
    // Store this timestamp for next time
    lastDisplayTime_ = displayLink_.timestamp;

	// needed for SPF
	if( displayStats_ )
		gettimeofday( &lastUpdate_, NULL);

#ifdef DEBUG
	// If we are debugging our code, prevent big delta time
	if( dt > 0.2f )
		dt = 1/60.0f;
=======
    // New delta time. Re-fixed issue #1277
    if( _nextDeltaTimeZero || _lastDisplayTime==0 ) {
        _dt = 0;
        _nextDeltaTimeZero = NO;
    } else {
        _dt = _displayLink.timestamp - _lastDisplayTime;
        _dt = MAX(0,_dt);
    }
    // Store this timestamp for next time
    _lastDisplayTime = _displayLink.timestamp;

	// needed for SPF
	if( _displayStats )
		gettimeofday( &_lastUpdate, NULL);

#ifdef DEBUG
	// If we are debugging our code, prevent big delta time
	if( _dt > 0.2f )
		_dt = 1/60.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif
}


#pragma mark Director Thread

//
// Director has its own thread
//
-(void) threadMainLoop
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

<<<<<<< HEAD
	[displayLink_ addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
=======
	[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// start the run loop
	[[NSRunLoop currentRunLoop] run];

	[pool release];
}

-(void) dealloc
{
<<<<<<< HEAD
	[displayLink_ release];
=======
	[_displayLink release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}
@end

#endif // __CC_PLATFORM_IOS
