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


#import <stdarg.h>

#import "Platforms/CCGL.h"

#import "CCLayer.h"
#import "CCDirector.h"
#import "ccMacros.h"
#import "CCShaderCache.h"
#import "CCGLProgram.h"
#import "ccGLStateCache.h"
#import "Support/TransformUtils.h"
#import "Support/CGPointExtension.h"

#ifdef __CC_PLATFORM_IOS
#import "Platforms/iOS/CCTouchDispatcher.h"
#import "Platforms/iOS/CCDirectorIOS.h"
#elif defined(__CC_PLATFORM_MAC)
#import "Platforms/Mac/CCEventDispatcher.h"
#import "Platforms/Mac/CCDirectorMac.h"
#endif

// extern
#import "kazmath/GL/matrix.h"

#pragma mark -
#pragma mark Layer

<<<<<<< HEAD
=======
#if __CC_PLATFORM_IOS
@interface CCLayer ()
-(void) registerWithTouchDispatcher;
@end
#endif // __CC_PLATFORM_IOS

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@implementation CCLayer

#pragma mark Layer - Init
-(id) init
{
	if( (self=[super init]) ) {

		CGSize s = [[CCDirector sharedDirector] winSize];
<<<<<<< HEAD
		anchorPoint_ = ccp(0.5f, 0.5f);
		[self setContentSize:s];
		self.isRelativeAnchorPoint = NO;

		isTouchEnabled_ = NO;

#ifdef __CC_PLATFORM_IOS
		isAccelerometerEnabled_ = NO;
#elif defined(__CC_PLATFORM_MAC)
		isMouseEnabled_ = NO;
		isKeyboardEnabled_ = NO;
=======
		_anchorPoint = ccp(0.5f, 0.5f);
		[self setContentSize:s];
		self.ignoreAnchorPointForPosition = YES;

		_touchEnabled = NO;
		_touchPriority = 0;
		_touchMode = kCCTouchesAllAtOnce;
        _touchSwallow = YES;

#ifdef __CC_PLATFORM_IOS
		_accelerometerEnabled = NO;
#elif defined(__CC_PLATFORM_MAC)
        _gestureEnabled = NO;
        _gesturePriority = 0;
		_mouseEnabled = NO;
		_keyboardEnabled = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif
	}

	return self;
}

<<<<<<< HEAD
#pragma mark Layer - Touch and Accelerometer related
=======
#pragma mark Layer - iOS - Touch and Accelerometer related
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#ifdef __CC_PLATFORM_IOS
-(void) registerWithTouchDispatcher
{
	CCDirector *director = [CCDirector sharedDirector];
<<<<<<< HEAD
	[[director touchDispatcher] addStandardDelegate:self priority:0];
=======
	
	if( _touchMode == kCCTouchesAllAtOnce )
		[[director touchDispatcher] addStandardDelegate:self priority:_touchPriority];
	else /* one by one */
		[[director touchDispatcher] addTargetedDelegate:self priority:_touchPriority swallowsTouches:_touchSwallow];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) isAccelerometerEnabled
{
<<<<<<< HEAD
	return isAccelerometerEnabled_;
}

-(void) setIsAccelerometerEnabled:(BOOL)enabled
{
	if( enabled != isAccelerometerEnabled_ ) {
		isAccelerometerEnabled_ = enabled;
		if( isRunning_ ) {
			if( enabled )
				[[UIAccelerometer sharedAccelerometer] setDelegate:self];
=======
	return _accelerometerEnabled;
}

-(void) setAccelerometerEnabled:(BOOL)enabled
{
	if( enabled != _accelerometerEnabled ) {
		_accelerometerEnabled = enabled;
		if( _isRunning ) {
			if( enabled )
				[[UIAccelerometer sharedAccelerometer] setDelegate:(id<UIAccelerometerDelegate>)self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			else
				[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
		}
	}
}

<<<<<<< HEAD
-(BOOL) isTouchEnabled
{
	return isTouchEnabled_;
}

-(void) setIsTouchEnabled:(BOOL)enabled
{
	if( isTouchEnabled_ != enabled ) {
		isTouchEnabled_ = enabled;
		if( isRunning_ ) {
=======
-(void) setAccelerometerInterval:(float)interval
{
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:interval];
}

-(BOOL) isTouchEnabled
{
	return _touchEnabled;
}

-(void) setTouchEnabled:(BOOL)enabled
{	
	if( _touchEnabled != enabled ) {
		_touchEnabled = enabled;
		if( _isRunning) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			if( enabled )
				[self registerWithTouchDispatcher];
			else {
				CCDirector *director = [CCDirector sharedDirector];
				[[director touchDispatcher] removeDelegate:self];
			}
		}
	}
}

<<<<<<< HEAD
#elif defined(__CC_PLATFORM_MAC)

#pragma mark CCLayer - Mouse, Keyboard & Touch events

-(NSInteger) mouseDelegatePriority
{
	return 0;
}

-(BOOL) isMouseEnabled
{
	return isMouseEnabled_;
}

-(void) setIsMouseEnabled:(BOOL)enabled
{
	if( isMouseEnabled_ != enabled ) {
		isMouseEnabled_ = enabled;

		if( isRunning_ ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addMouseDelegate:self priority:[self mouseDelegatePriority]];
			else
				[[director eventDispatcher] removeMouseDelegate:self];
		}
	}
}

-(NSInteger) keyboardDelegatePriority
{
	return 0;
=======
-(NSInteger) touchPriority
{
	return _touchPriority;
}
-(void) setTouchPriority:(NSInteger)touchPriority
{
	if( _touchPriority != touchPriority ) {
		_touchPriority = touchPriority;
		
		if( _touchEnabled) {
			[self setTouchEnabled:NO];
			[self setTouchEnabled:YES];
		}
	}
}

-(ccTouchesMode) touchMode
{
	return _touchMode;
}
-(void) setTouchMode:(ccTouchesMode)touchMode
{
	if( _touchMode != touchMode ) {
		_touchMode = touchMode;
		if( _touchEnabled) {
			[self setTouchEnabled:NO];
			[self setTouchEnabled:YES];
		}
	}
}

-(BOOL) touchSwallow
{
	return _touchSwallow;
}
-(void) setTouchSwallow:(BOOL)touchSwallow
{
	if( _touchSwallow != touchSwallow ) {
		_touchSwallow = touchSwallow;
		if( _touchEnabled) {
			[self setTouchEnabled:NO];
			[self setTouchEnabled:YES];
		}
	}
}

#elif defined(__CC_PLATFORM_MAC)

#pragma mark CCLayer - OS X - Mouse, Keyboard & Touch events


-(BOOL) isMouseEnabled
{
	return _mouseEnabled;
}

-(void) setMouseEnabled:(BOOL)enabled
{
	if( _mouseEnabled != enabled ) {
		_mouseEnabled = enabled;
		
		if( _isRunning ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addMouseDelegate:self priority:_mousePriority];
			else
				[[director eventDispatcher] removeMouseDelegate:self];
		}
	}	
}

-(NSInteger) mousePriority
{
	return _mousePriority;
}

-(void) setMousePriority:(NSInteger)mousePriority
{
	if( _mousePriority != mousePriority ) {
		_mousePriority = mousePriority;
		if( _mouseEnabled ) {
			[self setMouseEnabled:NO];
			[self setMouseEnabled:YES];
		}
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) isKeyboardEnabled
{
<<<<<<< HEAD
	return isKeyboardEnabled_;
}

-(void) setIsKeyboardEnabled:(BOOL)enabled
{
	if( isKeyboardEnabled_ != enabled ) {
		isKeyboardEnabled_ = enabled;

		if( isRunning_ ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addKeyboardDelegate:self priority:[self keyboardDelegatePriority] ];
=======
	return _keyboardEnabled;
}

-(void) setKeyboardEnabled:(BOOL)enabled
{
	if( _keyboardEnabled != enabled ) {
		_keyboardEnabled = enabled;

		if( _isRunning ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addKeyboardDelegate:self priority:_keyboardPriority ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			else
				[[director eventDispatcher] removeKeyboardDelegate:self];
		}
	}
}

<<<<<<< HEAD
-(NSInteger) touchDelegatePriority
{
	return 0;
=======
-(NSInteger) keyboardPriority
{
	return _keyboardPriority;
}

-(void) setKeyboardPriority:(NSInteger)keyboardPriority
{
	if( _keyboardPriority != keyboardPriority ) {
		_keyboardPriority = keyboardPriority;
		if( _keyboardEnabled ) {
			[self setKeyboardEnabled:NO];
			[self setKeyboardEnabled:YES];
		}
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) isTouchEnabled
{
<<<<<<< HEAD
	return isTouchEnabled_;
}

-(void) setIsTouchEnabled:(BOOL)enabled
{
	if( isTouchEnabled_ != enabled ) {
		isTouchEnabled_ = enabled;
		if( isRunning_ ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addTouchDelegate:self priority:[self touchDelegatePriority]];
=======
	return _touchEnabled;
}

-(void) setTouchEnabled:(BOOL)enabled
{
	if( _touchEnabled != enabled ) {
		_touchEnabled = enabled;
		if( _isRunning ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addTouchDelegate:self priority:_touchPriority];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			else
				[[director eventDispatcher] removeTouchDelegate:self];
		}
	}
}

<<<<<<< HEAD
=======
-(NSInteger) touchPriority
{
	return _touchPriority;
}
-(void) setTouchPriority:(NSInteger)touchPriority
{
	if( _touchPriority != touchPriority ) {
		_touchPriority = touchPriority;
		
		if( _touchEnabled) {
			[self setTouchEnabled:NO];
			[self setTouchEnabled:YES];
		}
	}
}

-(BOOL) isGestureEnabled
{
	return _gestureEnabled;
}

-(void) setGestureEnabled:(BOOL)enabled
{
	if( _gestureEnabled != enabled ) {
		_gestureEnabled = enabled;
		if( _isRunning ) {
			CCDirector *director = [CCDirector sharedDirector];
			if( enabled )
				[[director eventDispatcher] addGestureDelegate:self priority:_gesturePriority];
			else
				[[director eventDispatcher] removeGestureDelegate:self];
		}
	}
}

-(NSInteger) gesturePriority
{
	return _gesturePriority;
}

-(void) setGesturePriority:(NSInteger)gesturePriority
{
	if( _gesturePriority != gesturePriority ) {
		_gesturePriority = gesturePriority;
		
		if( _gestureEnabled) {
			[self setGestureEnabled:NO];
			[self setGestureEnabled:YES];
		}
	}
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#endif // Mac


#pragma mark Layer - Callbacks
-(void) onEnter
{
#ifdef __CC_PLATFORM_IOS
	// register 'parent' nodes first
	// since events are propagated in reverse order
<<<<<<< HEAD
	if (isTouchEnabled_)
=======
	if (_touchEnabled)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self registerWithTouchDispatcher];

#elif defined(__CC_PLATFORM_MAC)
	CCDirector *director = [CCDirector sharedDirector];
	CCEventDispatcher *eventDispatcher = [director eventDispatcher];

<<<<<<< HEAD
	if( isMouseEnabled_ )
		[eventDispatcher addMouseDelegate:self priority:[self mouseDelegatePriority]];

	if( isKeyboardEnabled_)
		[eventDispatcher addKeyboardDelegate:self priority:[self keyboardDelegatePriority]];

	if( isTouchEnabled_)
		[eventDispatcher addTouchDelegate:self priority:[self touchDelegatePriority]];

=======
	if( _mouseEnabled )
		[eventDispatcher addMouseDelegate:self priority:_mousePriority];

	if( _keyboardEnabled)
		[eventDispatcher addKeyboardDelegate:self priority:_keyboardPriority];

	if( _touchEnabled)
		[eventDispatcher addTouchDelegate:self priority:_touchPriority];
    
	if( _gestureEnabled)
		[eventDispatcher addGestureDelegate:self priority:_gesturePriority];
    
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif

	// then iterate over all the children
	[super onEnter];
}

// issue #624.
// Can't register mouse, touches here because of #issue #1018, and #1021
-(void) onEnterTransitionDidFinish
{
#ifdef __CC_PLATFORM_IOS
<<<<<<< HEAD
	if( isAccelerometerEnabled_ )
		[[UIAccelerometer sharedAccelerometer] setDelegate:self];
=======
	if( _accelerometerEnabled )
		[[UIAccelerometer sharedAccelerometer] setDelegate:(id<UIAccelerometerDelegate>)self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif

	[super onEnterTransitionDidFinish];
}


-(void) onExit
{
	CCDirector *director = [CCDirector sharedDirector];

#ifdef __CC_PLATFORM_IOS
<<<<<<< HEAD
	if( isTouchEnabled_ )
		[[director touchDispatcher] removeDelegate:self];

	if( isAccelerometerEnabled_ )
=======
	if( _touchEnabled )
		[[director touchDispatcher] removeDelegate:self];

	if( _accelerometerEnabled )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[[UIAccelerometer sharedAccelerometer] setDelegate:nil];

#elif defined(__CC_PLATFORM_MAC)
	CCEventDispatcher *eventDispatcher = [director eventDispatcher];
<<<<<<< HEAD
	if( isMouseEnabled_ )
		[eventDispatcher removeMouseDelegate:self];

	if( isKeyboardEnabled_ )
		[eventDispatcher removeKeyboardDelegate:self];

	if( isTouchEnabled_ )
		[eventDispatcher removeTouchDelegate:self];

=======
	if( _mouseEnabled )
		[eventDispatcher removeMouseDelegate:self];

	if( _keyboardEnabled )
		[eventDispatcher removeKeyboardDelegate:self];

	if( _touchEnabled )
		[eventDispatcher removeTouchDelegate:self];
    
	if( _gestureEnabled )
		[eventDispatcher removeGestureDelegate:self];
    
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif

	[super onExit];
}

#ifdef __CC_PLATFORM_IOS
-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	NSAssert(NO, @"Layer#ccTouchBegan override me");
	return YES;
}
#endif
@end

<<<<<<< HEAD
=======

#pragma mark - LayerRGBA

@implementation CCLayerRGBA

@synthesize cascadeColorEnabled = _cascadeColorEnabled;
@synthesize cascadeOpacityEnabled = _cascadeOpacityEnabled;

-(id) init
{
	if ( (self=[super init]) ) {
        _displayedOpacity = _realOpacity = 255;
        _displayedColor = _realColor = ccWHITE;
		self.cascadeOpacityEnabled = NO;
		self.cascadeColorEnabled = NO;
    }
    return self;
}

-(GLubyte) opacity
{
	return _realOpacity;
}

-(GLubyte) displayedOpacity
{
	return _displayedOpacity;
}

/** Override synthesized setOpacity to recurse items */
- (void) setOpacity:(GLubyte)opacity
{
	_displayedOpacity = _realOpacity = opacity;

	if( _cascadeOpacityEnabled ) {
		GLubyte parentOpacity = 255;
		if( [_parent conformsToProtocol:@protocol(CCRGBAProtocol)] && [(id<CCRGBAProtocol>)_parent isCascadeOpacityEnabled] )
			parentOpacity = [(id<CCRGBAProtocol>)_parent displayedOpacity];
		[self updateDisplayedOpacity:parentOpacity];
	}
}

-(ccColor3B) color
{
	return _realColor;
}

-(ccColor3B) displayedColor
{
	return _displayedColor;
}

- (void) setColor:(ccColor3B)color
{
	_displayedColor = _realColor = color;
	
	if( _cascadeColorEnabled ) {
		ccColor3B parentColor = ccWHITE;
		if( [_parent conformsToProtocol:@protocol(CCRGBAProtocol)] && [(id<CCRGBAProtocol>)_parent isCascadeColorEnabled] )
			parentColor = [(id<CCRGBAProtocol>)_parent displayedColor];
		[self updateDisplayedColor:parentColor];
	}
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
	_displayedOpacity = _realOpacity * parentOpacity/255.0;

    if (_cascadeOpacityEnabled) {
        id<CCRGBAProtocol> item;
        CCARRAY_FOREACH(_children, item) {
            if ([item conformsToProtocol:@protocol(CCRGBAProtocol)]) {
                [item updateDisplayedOpacity:_displayedOpacity];
            }
        }
    }
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
	_displayedColor.r = _realColor.r * parentColor.r/255.0;
	_displayedColor.g = _realColor.g * parentColor.g/255.0;
	_displayedColor.b = _realColor.b * parentColor.b/255.0;

    if (_cascadeColorEnabled) {
        id<CCRGBAProtocol> item;
        CCARRAY_FOREACH(_children, item) {
            if ([item conformsToProtocol:@protocol(CCRGBAProtocol)]) {
                [item updateDisplayedColor:_displayedColor];
            }
        }
    }
}

@end


>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#pragma mark -
#pragma mark LayerColor

@interface CCLayerColor (Private)
-(void) updateColor;
@end

@implementation CCLayerColor

// Opacity and RGB color protocol
<<<<<<< HEAD
@synthesize opacity = opacity_, color = color_;
@synthesize blendFunc = blendFunc_;
=======
@synthesize blendFunc = _blendFunc;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


+ (id) layerWithColor:(ccColor4B)color width:(GLfloat)w  height:(GLfloat) h
{
	return [[[self alloc] initWithColor:color width:w height:h] autorelease];
}

+ (id) layerWithColor:(ccColor4B)color
{
	return [[(CCLayerColor*)[self alloc] initWithColor:color] autorelease];
}

-(id) init
{
	CGSize s = [[CCDirector sharedDirector] winSize];
	return [self initWithColor:ccc4(0,0,0,0) width:s.width height:s.height];
}

// Designated initializer
- (id) initWithColor:(ccColor4B)color width:(GLfloat)w  height:(GLfloat) h
{
	if( (self=[super init]) ) {

		// default blend function
<<<<<<< HEAD
		blendFunc_ = (ccBlendFunc) { GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA };

		color_.r = color.r;
		color_.g = color.g;
		color_.b = color.b;
		opacity_ = color.a;

		for (NSUInteger i = 0; i<sizeof(squareVertices_) / sizeof( squareVertices_[0]); i++ ) {
			squareVertices_[i].x = 0.0f;
			squareVertices_[i].y = 0.0f;
=======
		_blendFunc = (ccBlendFunc) { GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA };

		_displayedColor.r = _realColor.r = color.r;
		_displayedColor.g = _realColor.g = color.g;
		_displayedColor.b = _realColor.b = color.b;
		_displayedOpacity = _realOpacity = color.a;

		for (NSUInteger i = 0; i<sizeof(_squareVertices) / sizeof( _squareVertices[0]); i++ ) {
			_squareVertices[i].x = 0.0f;
			_squareVertices[i].y = 0.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}

		[self updateColor];
		[self setContentSize:CGSizeMake(w, h) ];

		self.shaderProgram = [[CCShaderCache sharedShaderCache] programForKey:kCCShader_PositionColor];
	}
	return self;
}

- (id) initWithColor:(ccColor4B)color
{
	CGSize s = [[CCDirector sharedDirector] winSize];
	return [self initWithColor:color width:s.width height:s.height];
}

<<<<<<< HEAD
// override contentSize
-(void) setContentSize: (CGSize) size
{
	squareVertices_[1].x = size.width;
	squareVertices_[2].y = size.height;
	squareVertices_[3].x = size.width;
	squareVertices_[3].y = size.height;
=======

// override contentSize
-(void) setContentSize: (CGSize) size
{
	_squareVertices[1].x = size.width;
	_squareVertices[2].y = size.height;
	_squareVertices[3].x = size.width;
	_squareVertices[3].y = size.height;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super setContentSize:size];
}

- (void) changeWidth: (GLfloat) w height:(GLfloat) h
{
	[self setContentSize:CGSizeMake(w, h)];
}

-(void) changeWidth: (GLfloat) w
{
<<<<<<< HEAD
	[self setContentSize:CGSizeMake(w, contentSize_.height)];
=======
	[self setContentSize:CGSizeMake(w, _contentSize.height)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) changeHeight: (GLfloat) h
{
<<<<<<< HEAD
	[self setContentSize:CGSizeMake(contentSize_.width, h)];
=======
	[self setContentSize:CGSizeMake(_contentSize.width, h)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) updateColor
{
	for( NSUInteger i = 0; i < 4; i++ )
	{
<<<<<<< HEAD
		squareColors_[i].r = color_.r / 255.0f;
		squareColors_[i].g = color_.g / 255.0f;
		squareColors_[i].b = color_.b / 255.0f;
		squareColors_[i].a = opacity_ / 255.0f;
=======
		_squareColors[i].r = _displayedColor.r / 255.0f;
		_squareColors[i].g = _displayedColor.g / 255.0f;
		_squareColors[i].b = _displayedColor.b / 255.0f;
		_squareColors[i].a = _displayedOpacity / 255.0f;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

- (void) draw
{
	CC_NODE_DRAW_SETUP();

	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position | kCCVertexAttribFlag_Color );

	//
	// Attributes
	//
<<<<<<< HEAD
	glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, squareVertices_);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_FLOAT, GL_FALSE, 0, squareColors_);

	ccGLBlendFunc( blendFunc_.src, blendFunc_.dst );
=======
	glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, _squareVertices);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_FLOAT, GL_FALSE, 0, _squareColors);

	ccGLBlendFunc( _blendFunc.src, _blendFunc.dst );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	CC_INCREMENT_GL_DRAWS(1);
}

#pragma mark Protocols
// Color Protocol

-(void) setColor:(ccColor3B)color
{
<<<<<<< HEAD
	color_ = color;
	[self updateColor];
}

-(void) setOpacity: (GLubyte) o
{
	opacity_ = o;
=======
    [super setColor:color];
	[self updateColor];
}

-(void) setOpacity: (GLubyte) opacity
{
    [super setOpacity:opacity];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self updateColor];
}
@end


#pragma mark -
#pragma mark LayerGradient

@implementation CCLayerGradient

<<<<<<< HEAD
@synthesize startOpacity = startOpacity_;
@synthesize endColor = endColor_, endOpacity = endOpacity_;
@synthesize vector = vector_;
=======
@synthesize startOpacity = _startOpacity;
@synthesize endColor = _endColor, endOpacity = _endOpacity;
@synthesize vector = _vector;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+ (id) layerWithColor: (ccColor4B) start fadingTo: (ccColor4B) end
{
    return [[[self alloc] initWithColor:start fadingTo:end] autorelease];
}

+ (id) layerWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v
{
    return [[[self alloc] initWithColor:start fadingTo:end alongVector:v] autorelease];
}

<<<<<<< HEAD
=======
- (id) init
{
	return [self initWithColor:ccc4(0, 0, 0, 255) fadingTo:ccc4(0, 0, 0, 255)];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end
{
    return [self initWithColor:start fadingTo:end alongVector:ccp(0, -1)];
}

- (id) initWithColor: (ccColor4B) start fadingTo: (ccColor4B) end alongVector: (CGPoint) v
{
<<<<<<< HEAD
	endColor_.r = end.r;
	endColor_.g = end.g;
	endColor_.b = end.b;

	endOpacity_		= end.a;
	startOpacity_	= start.a;
	vector_ = v;

	start.a	= 255;
	compressedInterpolation_ = YES;
=======
	_endColor.r = end.r;
	_endColor.g = end.g;
	_endColor.b = end.b;

	_endOpacity		= end.a;
	_startOpacity	= start.a;
	_vector = v;

	start.a	= 255;
	_compressedInterpolation = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return [super initWithColor:start];
}

- (void) updateColor
{
    [super updateColor];

<<<<<<< HEAD
	float h = ccpLength(vector_);
=======
	float h = ccpLength(_vector);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    if (h == 0)
		return;

	float c = sqrtf(2);
<<<<<<< HEAD
    CGPoint u = ccp(vector_.x / h, vector_.y / h);

	// Compressed Interpolation mode
	if( compressedInterpolation_ ) {
=======
    CGPoint u = ccp(_vector.x / h, _vector.y / h);

	// Compressed Interpolation mode
	if( _compressedInterpolation ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		float h2 = 1 / ( fabsf(u.x) + fabsf(u.y) );
		u = ccpMult(u, h2 * (float)c);
	}

<<<<<<< HEAD
	float opacityf = (float)opacity_/255.0f;

    ccColor4F S = {
		color_.r / 255.0f,
		color_.g / 255.0f,
		color_.b / 255.0f,
		startOpacity_*opacityf / 255.0f,
	};

    ccColor4F E = {
		endColor_.r / 255.0f,
		endColor_.g / 255.0f,
		endColor_.b / 255.0f,
		endOpacity_*opacityf / 255.0f,
=======
	float opacityf = (float)_displayedOpacity/255.0f;

    ccColor4F S = {
		_displayedColor.r / 255.0f,
		_displayedColor.g / 255.0f,
		_displayedColor.b / 255.0f,
		_startOpacity*opacityf / 255.0f,
	};

    ccColor4F E = {
		_endColor.r / 255.0f,
		_endColor.g / 255.0f,
		_endColor.b / 255.0f,
		_endOpacity*opacityf / 255.0f,
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	};


    // (-1, -1)
<<<<<<< HEAD
	squareColors_[0].r = E.r + (S.r - E.r) * ((c + u.x + u.y) / (2.0f * c));
	squareColors_[0].g = E.g + (S.g - E.g) * ((c + u.x + u.y) / (2.0f * c));
	squareColors_[0].b = E.b + (S.b - E.b) * ((c + u.x + u.y) / (2.0f * c));
	squareColors_[0].a = E.a + (S.a - E.a) * ((c + u.x + u.y) / (2.0f * c));
    // (1, -1)
	squareColors_[1].r = E.r + (S.r - E.r) * ((c - u.x + u.y) / (2.0f * c));
	squareColors_[1].g = E.g + (S.g - E.g) * ((c - u.x + u.y) / (2.0f * c));
	squareColors_[1].b = E.b + (S.b - E.b) * ((c - u.x + u.y) / (2.0f * c));
	squareColors_[1].a = E.a + (S.a - E.a) * ((c - u.x + u.y) / (2.0f * c));
	// (-1, 1)
	squareColors_[2].r = E.r + (S.r - E.r) * ((c + u.x - u.y) / (2.0f * c));
	squareColors_[2].g = E.g + (S.g - E.g) * ((c + u.x - u.y) / (2.0f * c));
	squareColors_[2].b = E.b + (S.b - E.b) * ((c + u.x - u.y) / (2.0f * c));
	squareColors_[2].a = E.a + (S.a - E.a) * ((c + u.x - u.y) / (2.0f * c));
	// (1, 1)
	squareColors_[3].r = E.r + (S.r - E.r) * ((c - u.x - u.y) / (2.0f * c));
	squareColors_[3].g = E.g + (S.g - E.g) * ((c - u.x - u.y) / (2.0f * c));
	squareColors_[3].b = E.b + (S.b - E.b) * ((c - u.x - u.y) / (2.0f * c));
	squareColors_[3].a = E.a + (S.a - E.a) * ((c - u.x - u.y) / (2.0f * c));
=======
	_squareColors[0].r = E.r + (S.r - E.r) * ((c + u.x + u.y) / (2.0f * c));
	_squareColors[0].g = E.g + (S.g - E.g) * ((c + u.x + u.y) / (2.0f * c));
	_squareColors[0].b = E.b + (S.b - E.b) * ((c + u.x + u.y) / (2.0f * c));
	_squareColors[0].a = E.a + (S.a - E.a) * ((c + u.x + u.y) / (2.0f * c));
    // (1, -1)
	_squareColors[1].r = E.r + (S.r - E.r) * ((c - u.x + u.y) / (2.0f * c));
	_squareColors[1].g = E.g + (S.g - E.g) * ((c - u.x + u.y) / (2.0f * c));
	_squareColors[1].b = E.b + (S.b - E.b) * ((c - u.x + u.y) / (2.0f * c));
	_squareColors[1].a = E.a + (S.a - E.a) * ((c - u.x + u.y) / (2.0f * c));
	// (-1, 1)
	_squareColors[2].r = E.r + (S.r - E.r) * ((c + u.x - u.y) / (2.0f * c));
	_squareColors[2].g = E.g + (S.g - E.g) * ((c + u.x - u.y) / (2.0f * c));
	_squareColors[2].b = E.b + (S.b - E.b) * ((c + u.x - u.y) / (2.0f * c));
	_squareColors[2].a = E.a + (S.a - E.a) * ((c + u.x - u.y) / (2.0f * c));
	// (1, 1)
	_squareColors[3].r = E.r + (S.r - E.r) * ((c - u.x - u.y) / (2.0f * c));
	_squareColors[3].g = E.g + (S.g - E.g) * ((c - u.x - u.y) / (2.0f * c));
	_squareColors[3].b = E.b + (S.b - E.b) * ((c - u.x - u.y) / (2.0f * c));
	_squareColors[3].a = E.a + (S.a - E.a) * ((c - u.x - u.y) / (2.0f * c));
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(ccColor3B) startColor
{
<<<<<<< HEAD
	return color_;
}

-(void) setStartColor:(ccColor3B)colors
{
	[self setColor:colors];
}

-(void) setEndColor:(ccColor3B)colors
{
    endColor_ = colors;
=======
	return _realColor;
}

-(void) setStartColor:(ccColor3B)color
{
	[self setColor:color];
}

-(void) setEndColor:(ccColor3B)color
{
    _endColor = color;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    [self updateColor];
}

-(void) setStartOpacity: (GLubyte) o
{
<<<<<<< HEAD
	startOpacity_ = o;
=======
	_startOpacity = o;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    [self updateColor];
}

-(void) setEndOpacity: (GLubyte) o
{
<<<<<<< HEAD
    endOpacity_ = o;
=======
    _endOpacity = o;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    [self updateColor];
}

-(void) setVector: (CGPoint) v
{
<<<<<<< HEAD
    vector_ = v;
=======
    _vector = v;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    [self updateColor];
}

-(BOOL) compressedInterpolation
{
<<<<<<< HEAD
	return compressedInterpolation_;
=======
	return _compressedInterpolation;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setCompressedInterpolation:(BOOL)compress
{
<<<<<<< HEAD
	compressedInterpolation_ = compress;
=======
	_compressedInterpolation = compress;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self updateColor];
}
@end

#pragma mark -
#pragma mark MultiplexLayer

@implementation CCLayerMultiplex
<<<<<<< HEAD
=======
+(id) layerWithArray:(NSArray *)arrayOfLayers
{
	return [[[self alloc] initWithArray:arrayOfLayers] autorelease];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) layerWithLayers: (CCLayer*) layer, ...
{
	va_list args;
	va_start(args,layer);

	id s = [[[self alloc] initWithLayers: layer vaList:args] autorelease];

	va_end(args);
	return s;
}

<<<<<<< HEAD
=======
-(id) initWithArray:(NSArray *)arrayOfLayers
{
	if( (self=[super init])) {
		_layers = [arrayOfLayers mutableCopy];

		_enabledLayer = 0;

		[self addChild: [_layers objectAtIndex:_enabledLayer]];
	}


	return self;
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id) initWithLayers: (CCLayer*) layer vaList:(va_list) params
{
	if( (self=[super init]) ) {

<<<<<<< HEAD
		layers_ = [[NSMutableArray arrayWithCapacity:5] retain];

		[layers_ addObject: layer];

		CCLayer *l = va_arg(params,CCLayer*);
		while( l ) {
			[layers_ addObject: l];
			l = va_arg(params,CCLayer*);
		}

		enabledLayer_ = 0;
		[self addChild: [layers_ objectAtIndex: enabledLayer_]];
=======
		_layers = [[NSMutableArray arrayWithCapacity:5] retain];

		[_layers addObject: layer];

		CCLayer *l = va_arg(params,CCLayer*);
		while( l ) {
			[_layers addObject: l];
			l = va_arg(params,CCLayer*);
		}

		_enabledLayer = 0;
		[self addChild: [_layers objectAtIndex: _enabledLayer]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void) dealloc
{
<<<<<<< HEAD
	[layers_ release];
=======
	[_layers release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void) switchTo: (unsigned int) n
{
<<<<<<< HEAD
	NSAssert( n < [layers_ count], @"Invalid index in MultiplexLayer switchTo message" );

	[self removeChild: [layers_ objectAtIndex:enabledLayer_] cleanup:YES];

	enabledLayer_ = n;

	[self addChild: [layers_ objectAtIndex:n]];
=======
	NSAssert( n < [_layers count], @"Invalid index in MultiplexLayer switchTo message" );

	[self removeChild: [_layers objectAtIndex:_enabledLayer] cleanup:YES];

	_enabledLayer = n;

	[self addChild: [_layers objectAtIndex:n]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) switchToAndReleaseMe: (unsigned int) n
{
<<<<<<< HEAD
	NSAssert( n < [layers_ count], @"Invalid index in MultiplexLayer switchTo message" );

	[self removeChild: [layers_ objectAtIndex:enabledLayer_] cleanup:YES];

	[layers_ replaceObjectAtIndex:enabledLayer_ withObject:[NSNull null]];

	enabledLayer_ = n;

	[self addChild: [layers_ objectAtIndex:n]];
=======
	NSAssert( n < [_layers count], @"Invalid index in MultiplexLayer switchTo message" );

	[self removeChild: [_layers objectAtIndex:_enabledLayer] cleanup:YES];

	[_layers replaceObjectAtIndex:_enabledLayer withObject:[NSNull null]];

	_enabledLayer = n;

	[self addChild: [_layers objectAtIndex:n]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end
