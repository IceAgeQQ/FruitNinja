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
 */

// Only compile this code on Mac. These files should not be included on your iOS project.
// But in case they are included, it won't be compiled.
#import "../../ccMacros.h"
#ifdef __CC_PLATFORM_MAC

#import <sys/time.h>

#import "CCDirectorMac.h"
#import "CCEventDispatcher.h"
#import "CCGLView.h"
#import "CCWindow.h"

#import "../../CCNode.h"
#import "../../CCScheduler.h"
#import "../../ccMacros.h"
#import "../../CCGLProgram.h"
#import "../../ccGLStateCache.h"

// external
#import "kazmath/kazmath.h"
#import "kazmath/GL/matrix.h"

#pragma mark -
#pragma mark Director Mac extensions


@interface CCDirector ()
-(void) setNextScene;
-(void) showStats;
-(void) calculateDeltaTime;
-(void) calculateMPF;
@end

@implementation CCDirector (MacExtension)
-(CGPoint) convertEventToGL:(NSEvent*)event
{
	NSPoint point = [[self view] convertPoint:[event locationInWindow] fromView:nil];
	CGPoint p = NSPointToCGPoint(point);

	return  [(CCDirectorMac*)self convertToLogicalCoordinates:p];
}

-(void) setEventDispatcher:(CCEventDispatcher *)dispatcher
{
	NSAssert(NO, @"override me");
}

-(CCEventDispatcher *) eventDispatcher
{
	NSAssert(NO, @"override me");
	return nil;
}
@end

#pragma mark -
#pragma mark Director Mac

@implementation CCDirectorMac

<<<<<<< HEAD
@synthesize isFullScreen = isFullScreen_;
@synthesize originalWinSize = originalWinSize_;
=======
@synthesize isFullScreen = _isFullScreen;
@synthesize originalWinSize = _originalWinSize;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

-(id) init
{
	if( (self = [super init]) ) {
<<<<<<< HEAD
		isFullScreen_ = NO;
		resizeMode_ = kCCDirectorResize_AutoScale;

        originalWinSize_ = CGSizeZero;
		fullScreenWindow_ = nil;
		windowGLView_ = nil;
		winOffset_ = CGPointZero;

		eventDispatcher_ = [[CCEventDispatcher alloc] init];
=======
		_isFullScreen = NO;
		_resizeMode = kCCDirectorResize_AutoScale;

        _originalWinSize = CGSizeZero;
		_fullScreenWindow = nil;
		_windowGLView = nil;
		_winOffset = CGPointZero;

		_eventDispatcher = [[CCEventDispatcher alloc] init];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

- (void) dealloc
{
<<<<<<< HEAD
	[eventDispatcher_ release];
	[view_ release];
    [superViewGLView_ release];
	[fullScreenWindow_ release];
	[windowGLView_ release];
=======
	[_eventDispatcher release];
	[__view release];
    [_superViewGLView release];
	[_fullScreenWindow release];
	[_windowGLView release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

//
// setFullScreen code taken from GLFullScreen example by Apple
//
- (void) setFullScreen:(BOOL)fullscreen
{
<<<<<<< HEAD
	// Mac OS X 10.6 and later offer a simplified mechanism to create full-screen contexts
#if MAC_OS_X_VERSION_MIN_REQUIRED > MAC_OS_X_VERSION_10_5

    if (isFullScreen_ == fullscreen)
		return;

	CCGLView *openGLview = (CCGLView*) self.view;

    if( fullscreen ) {
        originalWinRect_ = [openGLview frame];

        // Cache normal window and superview of openGLView
        if(!windowGLView_)
            windowGLView_ = [[openGLview window] retain];

        [superViewGLView_ release];
        superViewGLView_ = [[openGLview superview] retain];
=======
//	_isFullScreen = !_isFullScreen;
//		
//	if (_isFullScreen)
//	{
//		[self.view enterFullScreenMode:[[self.view window] screen] withOptions:nil];
//	}
//	else
//	{
//		[self.view exitFullScreenModeWithOptions:nil];
//		[[self.view window] makeFirstResponder: self.view];
//	}
//	
//	return;

	// Mac OS X 10.6 and later offer a simplified mechanism to create full-screen contexts
#if MAC_OS_X_VERSION_MIN_REQUIRED > MAC_OS_X_VERSION_10_5

    if (_isFullScreen == fullscreen)
		return;

	CCGLView *openGLview = (CCGLView*) self.view;
    BOOL viewAcceptsTouchEvents = openGLview.acceptsTouchEvents;

    if( fullscreen ) {
        _originalWinRect = [openGLview frame];

        // Cache normal window and superview of openGLView
        if(!_windowGLView)
            _windowGLView = [[openGLview window] retain];

        [_superViewGLView release];
        _superViewGLView = [[openGLview superview] retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


        // Get screen size
        NSRect displayRect = [[NSScreen mainScreen] frame];

        // Create a screen-sized window on the display you want to take over
<<<<<<< HEAD
        fullScreenWindow_ = [[CCWindow alloc] initWithFrame:displayRect fullscreen:YES];
=======
        _fullScreenWindow = [[CCWindow alloc] initWithFrame:displayRect fullscreen:YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

        // Remove glView from window
        [openGLview removeFromSuperview];

        // Set new frame
        [openGLview setFrame:displayRect];

        // Attach glView to fullscreen window
<<<<<<< HEAD
        [fullScreenWindow_ setContentView:openGLview];

        // Show the fullscreen window
        [fullScreenWindow_ makeKeyAndOrderFront:self];
		[fullScreenWindow_ makeMainWindow];
=======
        [_fullScreenWindow setContentView:openGLview];

        // Show the fullscreen window
        [_fullScreenWindow makeKeyAndOrderFront:self];
		[_fullScreenWindow makeMainWindow];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

    } else {

        // Remove glView from fullscreen window
        [openGLview removeFromSuperview];

        // Release fullscreen window
<<<<<<< HEAD
        [fullScreenWindow_ release];
        fullScreenWindow_ = nil;

        // Attach glView to superview
        [superViewGLView_ addSubview:openGLview];

        // Set new frame
        [openGLview setFrame:originalWinRect_];

        // Show the window
        [windowGLView_ makeKeyAndOrderFront:self];
		[windowGLView_ makeMainWindow];
    }
	
	// issue #1189
	[windowGLView_ makeFirstResponder:openGLview];

    isFullScreen_ = fullscreen;
=======
        [_fullScreenWindow release];
        _fullScreenWindow = nil;

        // Attach glView to superview
        [_superViewGLView addSubview:openGLview];

        // Set new frame
        [openGLview setFrame:_originalWinRect];

        // Show the window
        [_windowGLView makeKeyAndOrderFront:self];
		[_windowGLView makeMainWindow];
    }
	
	// issue #1189
	[_windowGLView makeFirstResponder:openGLview];

    _isFullScreen = fullscreen;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

    [openGLview retain]; // Retain +1

    // re-configure glView
    [self setView:openGLview];
<<<<<<< HEAD

=======
    
    [openGLview setAcceptsTouchEvents:viewAcceptsTouchEvents];
    
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    [openGLview release]; // Retain -1

    [openGLview setNeedsDisplay:YES];
#else
#error Full screen is not supported for Mac OS 10.5 or older yet
#error If you don't want FullScreen support, you can safely remove these 2 lines
#endif
}

-(void) setView:(CCGLView *)view
{
<<<<<<< HEAD
	if( view != view_) {
=======
	if( view != __view) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[super setView:view];

		// cache the NSWindow and NSOpenGLView created from the NIB
<<<<<<< HEAD
		if( !isFullScreen_ && CGSizeEqualToSize(originalWinSize_, CGSizeZero))
		{
			originalWinSize_ = winSizeInPixels_;
=======
		if( !_isFullScreen && CGSizeEqualToSize(_originalWinSize, CGSizeZero))
		{
			_originalWinSize = _winSizeInPixels;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

-(int) resizeMode
{
<<<<<<< HEAD
	return resizeMode_;
=======
	return _resizeMode;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setResizeMode:(int)mode
{
<<<<<<< HEAD
	if( mode != resizeMode_ ) {

		resizeMode_ = mode;

        [self setProjection:projection_];
=======
	if( mode != _resizeMode ) {

		_resizeMode = mode;

        [self setProjection:_projection];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        [self.view setNeedsDisplay: YES];
	}
}

<<<<<<< HEAD
-(void) setProjection:(ccDirectorProjection)projection
{
	CGSize size = winSizeInPixels_;

	CGPoint offset = CGPointZero;
	float widthAspect = size.width;
	float heightAspect = size.height;


	if( resizeMode_ == kCCDirectorResize_AutoScale && ! CGSizeEqualToSize(originalWinSize_, CGSizeZero ) ) {

		size = originalWinSize_;

		float aspect = originalWinSize_.width / originalWinSize_.height;
		widthAspect = winSizeInPixels_.width;
		heightAspect = winSizeInPixels_.width / aspect;

		if( heightAspect > winSizeInPixels_.height ) {
			widthAspect = winSizeInPixels_.height * aspect;
			heightAspect = winSizeInPixels_.height;
		}

		winOffset_.x = (winSizeInPixels_.width - widthAspect) / 2;
		winOffset_.y =  (winSizeInPixels_.height - heightAspect) / 2;

		offset = winOffset_;

	}
=======
-(void) setViewport
{
	CGPoint offset = CGPointZero;
	float widthAspect = _winSizeInPixels.width;
	float heightAspect = _winSizeInPixels.height;


	if( _resizeMode == kCCDirectorResize_AutoScale && ! CGSizeEqualToSize(_originalWinSize, CGSizeZero ) ) {
		
		float aspect = _originalWinSize.width / _originalWinSize.height;
		widthAspect = _winSizeInPixels.width;
		heightAspect = _winSizeInPixels.width / aspect;
		
		if( heightAspect > _winSizeInPixels.height ) {
			widthAspect = _winSizeInPixels.height * aspect;
			heightAspect = _winSizeInPixels.height;
		}
		
		_winOffset.x = (_winSizeInPixels.width - widthAspect) / 2;
		_winOffset.y =  (_winSizeInPixels.height - heightAspect) / 2;
		
		offset = _winOffset;
	}

	glViewport(offset.x, offset.y, widthAspect, heightAspect);
}

-(void) setProjection:(ccDirectorProjection)projection
{
	CGSize size = _winSizeInPixels;
    if( _resizeMode == kCCDirectorResize_AutoScale && ! CGSizeEqualToSize(_originalWinSize, CGSizeZero ) ) {
		size = _originalWinSize;
    }

	[self setViewport];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	switch (projection) {
		case kCCDirectorProjection2D:

<<<<<<< HEAD
			glViewport(offset.x, offset.y, widthAspect, heightAspect);
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			kmGLMatrixMode(KM_GL_PROJECTION);
			kmGLLoadIdentity();

			kmMat4 orthoMatrix;
			kmMat4OrthographicProjection(&orthoMatrix, 0, size.width, 0, size.height, -1024, 1024);
			kmGLMultMatrix( &orthoMatrix );

			kmGLMatrixMode(KM_GL_MODELVIEW);
			kmGLLoadIdentity();
			break;


		case kCCDirectorProjection3D:
		{

			float zeye = [self getZEye];

<<<<<<< HEAD
			glViewport(offset.x, offset.y, widthAspect, heightAspect);
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			kmGLMatrixMode(KM_GL_PROJECTION);
			kmGLLoadIdentity();

			kmMat4 matrixPerspective, matrixLookup;

			// issue #1334
			kmMat4PerspectiveProjection( &matrixPerspective, 60, (GLfloat)size.width/size.height, 0.1f, MAX(zeye*2,1500) );
//			kmMat4PerspectiveProjection( &matrixPerspective, 60, (GLfloat)size.width/size.height, 0.1f, 1500);


			kmGLMultMatrix(&matrixPerspective);


			kmGLMatrixMode(KM_GL_MODELVIEW);
			kmGLLoadIdentity();
			kmVec3 eye, center, up;

<<<<<<< HEAD
			float eyeZ = size.height * zeye / winSizeInPixels_.height;
=======
			float eyeZ = size.height * zeye / _winSizeInPixels.height;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

			kmVec3Fill( &eye, size.width/2, size.height/2, eyeZ );
			kmVec3Fill( &center, size.width/2, size.height/2, 0 );
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


// If scaling is supported, then it should always return the original size
// otherwise it should return the "real" size.
-(CGSize) winSize
{
<<<<<<< HEAD
	if( resizeMode_ == kCCDirectorResize_AutoScale )
		return originalWinSize_;

	return winSizeInPixels_;
=======
	if( _resizeMode == kCCDirectorResize_AutoScale )
		return _originalWinSize;

	return _winSizeInPixels;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CGSize) winSizeInPixels
{
	return [self winSize];
}

- (CGPoint) convertToLogicalCoordinates:(CGPoint)coords
{
	CGPoint ret;

<<<<<<< HEAD
	if( resizeMode_ == kCCDirectorResize_NoScale )
=======
	if( _resizeMode == kCCDirectorResize_NoScale )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		ret = coords;

	else {

<<<<<<< HEAD
		float x_diff = originalWinSize_.width / (winSizeInPixels_.width - winOffset_.x * 2);
		float y_diff = originalWinSize_.height / (winSizeInPixels_.height - winOffset_.y * 2);

		float adjust_x = (winSizeInPixels_.width * x_diff - originalWinSize_.width ) / 2;
		float adjust_y = (winSizeInPixels_.height * y_diff - originalWinSize_.height ) / 2;
=======
		float x_diff = _originalWinSize.width / (_winSizeInPixels.width - _winOffset.x * 2);
		float y_diff = _originalWinSize.height / (_winSizeInPixels.height - _winOffset.y * 2);

		float adjust_x = (_winSizeInPixels.width * x_diff - _originalWinSize.width ) / 2;
		float adjust_y = (_winSizeInPixels.height * y_diff - _originalWinSize.height ) / 2;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		ret = CGPointMake( (x_diff * coords.x) - adjust_x, ( y_diff * coords.y ) - adjust_y );
	}

	return ret;
}

-(void) setEventDispatcher:(CCEventDispatcher *)dispatcher
{
<<<<<<< HEAD
	if( dispatcher != eventDispatcher_ ) {
		[eventDispatcher_ release];
		eventDispatcher_ = [dispatcher retain];
=======
	if( dispatcher != _eventDispatcher ) {
		[_eventDispatcher release];
		_eventDispatcher = [dispatcher retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(CCEventDispatcher *) eventDispatcher
{
<<<<<<< HEAD
	return eventDispatcher_;
=======
	return _eventDispatcher;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end


#pragma mark -
#pragma mark DirectorDisplayLink


@implementation CCDirectorDisplayLink

- (CVReturn) getFrameForTime:(const CVTimeStamp*)outputTime
{
#if (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_DISPLAY_LINK_THREAD)
<<<<<<< HEAD
	if( ! runningThread_ )
		runningThread_ = [NSThread currentThread];
=======
	if( ! _runningThread )
		_runningThread = [NSThread currentThread];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	[self drawScene];

	// Process timers and other events
	[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:nil];

	[pool release];
		
#else
<<<<<<< HEAD
	[self performSelector:@selector(drawScene) onThread:runningThread_ withObject:nil waitUntilDone:YES];
=======
	[self performSelector:@selector(drawScene) onThread:_runningThread withObject:nil waitUntilDone:YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif

    return kCVReturnSuccess;
}

// This is the renderer output callback function
static CVReturn MyDisplayLinkCallback(CVDisplayLinkRef displayLink, const CVTimeStamp* now, const CVTimeStamp* outputTime, CVOptionFlags flagsIn, CVOptionFlags* flagsOut, void* displayLinkContext)
{
    CVReturn result = [(CCDirectorDisplayLink*)displayLinkContext getFrameForTime:outputTime];
    return result;
}

- (void) startAnimation
{
<<<<<<< HEAD
	CCLOG(@"cocos2d: startAnimation");
#if (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_OWN_THREAD)
	runningThread_ = [[NSThread alloc] initWithTarget:self selector:@selector(mainLoop) object:nil];
	[runningThread_ start];
#elif (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_MAIN_THREAD)
    runningThread_ = [NSThread mainThread];
#endif

	gettimeofday( &lastUpdate_, NULL);
=======
	[super startAnimation];
	
    if(_isAnimating)
        return;

	CCLOG(@"cocos2d: startAnimation");
#if (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_OWN_THREAD)
	_runningThread = [[NSThread alloc] initWithTarget:self selector:@selector(mainLoop) object:nil];
	[_runningThread start];
#elif (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_MAIN_THREAD)
    _runningThread = [NSThread mainThread];
#endif

	gettimeofday( &_lastUpdate, NULL);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// Create a display link capable of being used with all active displays
	CVDisplayLinkCreateWithActiveCGDisplays(&displayLink);

	// Set the renderer output callback function
	CVDisplayLinkSetOutputCallback(displayLink, &MyDisplayLinkCallback, self);

	// Set the display link for the current renderer
	CCGLView *openGLview = (CCGLView*) self.view;
	CGLContextObj cglContext = [[openGLview openGLContext] CGLContextObj];
	CGLPixelFormatObj cglPixelFormat = [[openGLview pixelFormat] CGLPixelFormatObj];
	CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(displayLink, cglContext, cglPixelFormat);

	// Activate the display link
	CVDisplayLinkStart(displayLink);
<<<<<<< HEAD
=======
    
    _isAnimating = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) stopAnimation
{
<<<<<<< HEAD
=======
    if(!_isAnimating)
        return;

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	CCLOG(@"cocos2d: stopAnimation");

	if( displayLink ) {
		CVDisplayLinkStop(displayLink);
		CVDisplayLinkRelease(displayLink);
		displayLink = NULL;

#if CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_OWN_THREAD
<<<<<<< HEAD
		[runningThread_ cancel];
		[runningThread_ release];
		runningThread_ = nil;
#elif (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_MAIN_THREAD)
        runningThread_ = nil;
#endif
	}
=======
		[_runningThread cancel];
		[_runningThread release];
		_runningThread = nil;
#elif (CC_DIRECTOR_MAC_THREAD == CC_MAC_USE_MAIN_THREAD)
        _runningThread = nil;
#endif
	}
    
    _isAnimating = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
	if( displayLink ) {
		CVDisplayLinkStop(displayLink);
		CVDisplayLinkRelease(displayLink);
	}
	[super dealloc];
}

//
// Mac Director has its own thread
//
-(void) mainLoop
{
	while( ![[NSThread currentThread] isCancelled] ) {
		// There is no autorelease pool when this method is called because it will be called from a background thread
		// It's important to create one or you will leak objects
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

		[[NSRunLoop currentRunLoop] run];

		[pool release];
	}
}

//
// Draw the Scene
//
- (void) drawScene
{
	/* calculate "global" dt */
	[self calculateDeltaTime];

	// We draw on a secondary thread through the display link
	// When resizing the view, -reshape is called automatically on the main thread
	// Add a mutex around to avoid the threads accessing the context simultaneously	when resizing

	[self.view lockOpenGLContext];

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


	/* draw the scene */
<<<<<<< HEAD
	[runningScene_ visit];

	/* draw the notification node */
	[notificationNode_ visit];

	if( displayStats_ )
=======
	[_runningScene visit];

	/* draw the notification node */
	[_notificationNode visit];

	if( _displayStats )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self showStats];

	kmGLPopMatrix();

<<<<<<< HEAD
	totalFrames_++;
=======
	_totalFrames++;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	

	// flush buffer
	[self.view.openGLContext flushBuffer];	

	[self.view unlockOpenGLContext];

<<<<<<< HEAD
	if( displayStats_ )
=======
	if( _displayStats )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self calculateMPF];
}

// set the event dispatcher
-(void) setView:(CCGLView *)view
{
	[super setView:view];

<<<<<<< HEAD
	[view setEventDelegate:eventDispatcher_];
	[eventDispatcher_ setDispatchEvents: YES];
=======
	[view setEventDelegate:_eventDispatcher];
	[_eventDispatcher setDispatchEvents: YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// Enable Touches. Default no.
	// Only available on OS X 10.6+
#if MAC_OS_X_VERSION_MIN_REQUIRED > MAC_OS_X_VERSION_10_5
	[view setAcceptsTouchEvents:NO];
//		[view setAcceptsTouchEvents:YES];
#endif


	// Synchronize buffer swaps with vertical refresh rate
	[[view openGLContext] makeCurrentContext];
	GLint swapInt = 1;
	[[view openGLContext] setValues:&swapInt forParameter:NSOpenGLCPSwapInterval];
}

@end

#endif // __CC_PLATFORM_MAC
