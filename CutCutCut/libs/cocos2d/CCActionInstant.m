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


#import "CCActionInstant.h"
#import "CCNode.h"
#import "CCSprite.h"


//
// InstantAction
//
#pragma mark CCActionInstant

@implementation CCActionInstant

-(id) init
{
	if( (self=[super init]) )
<<<<<<< HEAD
		duration_ = 0;
=======
		_duration = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
	CCActionInstant *copy = [[[self class] allocWithZone: zone] init];
	return copy;
}

- (BOOL) isDone
{
	return YES;
}

-(void) step: (ccTime) dt
{
	[self update: 1];
}

-(void) update: (ccTime) t
{
	// nothing
}

-(CCFiniteTimeAction*) reverse
{
	return [[self copy] autorelease];
}
@end

//
// Show
//
#pragma mark CCShow

@implementation CCShow
-(void) update:(ccTime)time
{
<<<<<<< HEAD
	((CCNode *)target_).visible = YES;
=======
	((CCNode *)_target).visible = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCFiniteTimeAction*) reverse
{
	return [CCHide action];
}
@end

//
// Hide
//
#pragma mark CCHide

@implementation CCHide
-(void) update:(ccTime)time
{
<<<<<<< HEAD
	((CCNode *)target_).visible = NO;
=======
	((CCNode *)_target).visible = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCFiniteTimeAction*) reverse
{
	return [CCShow action];
}
@end

//
// ToggleVisibility
//
#pragma mark CCToggleVisibility

@implementation CCToggleVisibility
-(void) update:(ccTime)time
{
<<<<<<< HEAD
	((CCNode *)target_).visible = !((CCNode *)target_).visible;
=======
	((CCNode *)_target).visible = !((CCNode *)_target).visible;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// FlipX
//
#pragma mark CCFlipX

@implementation CCFlipX
+(id) actionWithFlipX:(BOOL)x
{
	return [[[self alloc] initWithFlipX:x] autorelease];
}

-(id) initWithFlipX:(BOOL)x
{
	if(( self=[super init]))
<<<<<<< HEAD
		flipX = x;
=======
		_flipX = x;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(void) update:(ccTime)time
{
<<<<<<< HEAD
	[(CCSprite*)target_ setFlipX:flipX];
=======
	[(CCSprite*)_target setFlipX:_flipX];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCFiniteTimeAction*) reverse
{
<<<<<<< HEAD
	return [CCFlipX actionWithFlipX:!flipX];
=======
	return [CCFlipX actionWithFlipX:!_flipX];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithFlipX:flipX];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithFlipX:_flipX];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}
@end

//
// FlipY
//
#pragma mark CCFlipY

@implementation CCFlipY
+(id) actionWithFlipY:(BOOL)y
{
	return [[[self alloc] initWithFlipY:y] autorelease];
}

-(id) initWithFlipY:(BOOL)y
{
	if(( self=[super init]))
<<<<<<< HEAD
		flipY = y;
=======
		_flipY = y;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(void) update:(ccTime)time
{
<<<<<<< HEAD
	[(CCSprite*)target_ setFlipY:flipY];
=======
	[(CCSprite*)_target setFlipY:_flipY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCFiniteTimeAction*) reverse
{
<<<<<<< HEAD
	return [CCFlipY actionWithFlipY:!flipY];
=======
	return [CCFlipY actionWithFlipY:!_flipY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithFlipY:flipY];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithFlipY:_flipY];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}
@end


//
// Place
//
#pragma mark CCPlace

@implementation CCPlace
+(id) actionWithPosition: (CGPoint) pos
{
	return [[[self alloc]initWithPosition:pos]autorelease];
}

-(id) initWithPosition: (CGPoint) pos
{
	if( (self=[super init]) )
<<<<<<< HEAD
		position = pos;
=======
		_position = pos;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithPosition: position];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithPosition: _position];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) update:(ccTime)time
{
<<<<<<< HEAD
	((CCNode *)target_).position = position;
=======
	((CCNode *)_target).position = _position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end

//
// CallFunc
//
#pragma mark CCCallFunc

@implementation CCCallFunc

<<<<<<< HEAD
@synthesize targetCallback = targetCallback_;
=======
@synthesize targetCallback = _targetCallback;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithTarget: (id) t selector:(SEL) s
{
	return [[[self alloc] initWithTarget: t selector: s] autorelease];
}

-(id) initWithTarget: (id) t selector:(SEL) s
{
	if( (self=[super init]) ) {
		self.targetCallback = t;
<<<<<<< HEAD
		selector_ = s;
=======
		_selector = s;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(NSString*) description
{
<<<<<<< HEAD
	return [NSString stringWithFormat:@"<%@ = %08X | Tag = %i | target = %@ | selector = %@>",
			[self class],
			self,
			tag_,
			[targetCallback_ class],
			NSStringFromSelector(selector_)
=======
	return [NSString stringWithFormat:@"<%@ = %p | Tag = %ld | selector = %@>",
			[self class],
			self,
			(long)_tag,
			NSStringFromSelector(_selector)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			];
}

-(void) dealloc
{
<<<<<<< HEAD
	[targetCallback_ release];
=======
	[_targetCallback release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithTarget:targetCallback_ selector:selector_];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithTarget:_targetCallback selector:_selector];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) update:(ccTime)time
{
	[self execute];
}

-(void) execute
{
<<<<<<< HEAD
	[targetCallback_ performSelector:selector_];
=======
	[_targetCallback performSelector:_selector];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// CallFuncN
//
#pragma mark CCCallFuncN

@implementation CCCallFuncN

-(void) execute
{
<<<<<<< HEAD
	[targetCallback_ performSelector:selector_ withObject:target_];
=======
	[_targetCallback performSelector:_selector withObject:_target];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

//
// CallFuncND
//
#pragma mark CCCallFuncND

@implementation CCCallFuncND

<<<<<<< HEAD
@synthesize callbackMethod = callbackMethod_;
=======
@synthesize callbackMethod = _callbackMethod;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithTarget:(id)t selector:(SEL)s data:(void*)d
{
	return [[[self alloc] initWithTarget:t selector:s data:d] autorelease];
}

-(id) initWithTarget:(id)t selector:(SEL)s data:(void*)d
{
	if( (self=[super initWithTarget:t selector:s]) ) {
<<<<<<< HEAD
		data_ = d;
=======
		_data = d;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#if COCOS2D_DEBUG
		NSMethodSignature * sig = [t methodSignatureForSelector:s]; // added
		NSAssert(sig !=0 , @"Signature not found for selector - does it have the following form? -(void)name:(id)sender data:(void*)data");
#endif
<<<<<<< HEAD
		callbackMethod_ = (CC_CALLBACK_ND) [t methodForSelector:s];
=======
		_callbackMethod = (CC_CALLBACK_ND) [t methodForSelector:s];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithTarget:targetCallback_ selector:selector_ data:data_];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithTarget:_targetCallback selector:_selector data:_data];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) dealloc
{
	// nothing to dealloc really. Everything is dealloc on super (CCCallFuncN)
	[super dealloc];
}

-(void) execute
{
<<<<<<< HEAD
	callbackMethod_(targetCallback_,selector_,target_, data_);
=======
	_callbackMethod(_targetCallback,_selector,_target, _data);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

@implementation CCCallFuncO
<<<<<<< HEAD
@synthesize  object = object_;
=======
@synthesize  object = _object;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithTarget: (id) t selector:(SEL) s object:(id)object
{
	return [[[self alloc] initWithTarget:t selector:s object:object] autorelease];
}

-(id) initWithTarget:(id) t selector:(SEL) s object:(id)object
{
	if( (self=[super initWithTarget:t selector:s] ) )
		self.object = object;

	return self;
}

- (void) dealloc
{
<<<<<<< HEAD
	[object_ release];
=======
	[_object release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithTarget:targetCallback_ selector:selector_ object:object_];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithTarget:_targetCallback selector:_selector object:_object];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}


-(void) execute
{
<<<<<<< HEAD
	[targetCallback_ performSelector:selector_ withObject:object_];
=======
	[_targetCallback performSelector:_selector withObject:_object];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end


#pragma mark -
#pragma mark Blocks

#pragma mark CCCallBlock

@implementation CCCallBlock

+(id) actionWithBlock:(void(^)())block
{
	return [[[self alloc] initWithBlock:block] autorelease];
}

-(id) initWithBlock:(void(^)())block
{
	if ((self = [super init]))
<<<<<<< HEAD
		block_ = [block copy];
=======
		_block = [block copy];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithBlock:block_];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithBlock:_block];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) update:(ccTime)time
{
	[self execute];
}

-(void) execute
{
<<<<<<< HEAD
	block_();
=======
	_block();
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
<<<<<<< HEAD
	[block_ release];
=======
	[_block release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

@end

#pragma mark CCCallBlockN

@implementation CCCallBlockN

+(id) actionWithBlock:(void(^)(CCNode *node))block
{
	return [[[self alloc] initWithBlock:block] autorelease];
}

-(id) initWithBlock:(void(^)(CCNode *node))block
{
	if ((self = [super init]))
<<<<<<< HEAD
		block_ = [block copy];
=======
		_block = [block copy];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithBlock:block_];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithBlock:_block];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) update:(ccTime)time
{
	[self execute];
}

-(void) execute
{
<<<<<<< HEAD
	block_(target_);
=======
	_block(_target);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
<<<<<<< HEAD
	[block_ release];
=======
	[_block release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

@end

#pragma mark CCCallBlockO

@implementation CCCallBlockO

<<<<<<< HEAD
@synthesize object=object_;
=======
@synthesize object=_object;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) actionWithBlock:(void(^)(id object))block object:(id)object
{
	return [[[self alloc] initWithBlock:block object:object] autorelease];
}

-(id) initWithBlock:(void(^)(id object))block object:(id)object
{
	if ((self = [super init])) {
<<<<<<< HEAD
		block_ = [block copy];
		object_ = [object retain];
=======
		_block = [block copy];
		_object = [object retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
<<<<<<< HEAD
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithBlock:block_];
=======
	CCActionInstant *copy = [[[self class] allocWithZone: zone] initWithBlock:_block];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return copy;
}

-(void) update:(ccTime)time
{
	[self execute];
}

-(void) execute
{
<<<<<<< HEAD
	block_(object_);
=======
	_block(_object);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
<<<<<<< HEAD
	[object_ release];
	[block_ release];
=======
	[_object release];
	[_block release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

@end

