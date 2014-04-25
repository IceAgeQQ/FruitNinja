/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009 Valentin Milea
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

/*
 * This file contains the delegates of the touches
 * There are 2 possible delegates:
 *   - CCStandardTouchHandler: propagates all the events at once
 *   - CCTargetedTouchHandler: propagates 1 event at the time
 */

#import "CCTouchHandler.h"
#import "../../ccMacros.h"

#pragma mark -
#pragma mark TouchHandler
@implementation CCTouchHandler

<<<<<<< HEAD
@synthesize delegate, priority;
@synthesize enabledSelectors=enabledSelectors_;
=======
@synthesize delegate=_delegate, priority=_priority;
@synthesize enabledSelectors=_enabledSelectors;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+ (id)handlerWithDelegate:(id) aDelegate priority:(int)aPriority
{
	return [[[self alloc] initWithDelegate:aDelegate priority:aPriority] autorelease];
}

- (id)initWithDelegate:(id) aDelegate priority:(int)aPriority
{
	NSAssert(aDelegate != nil, @"Touch delegate may not be nil");

	if ((self = [super init])) {
		self.delegate = aDelegate;
<<<<<<< HEAD
		priority = aPriority;
		enabledSelectors_ = 0;
=======
		_priority = aPriority;
		_enabledSelectors = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

- (void)dealloc {
	CCLOGINFO(@"cocos2d: deallocing %@", self);
<<<<<<< HEAD
	[delegate release];
=======
	[_delegate release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}
@end

#pragma mark -
#pragma mark StandardTouchHandler
@implementation CCStandardTouchHandler
-(id) initWithDelegate:(id)del priority:(int)pri
{
	if( (self=[super initWithDelegate:del priority:pri]) ) {
		if( [del respondsToSelector:@selector(ccTouchesBegan:withEvent:)] )
<<<<<<< HEAD
			enabledSelectors_ |= kCCTouchSelectorBeganBit;
		if( [del respondsToSelector:@selector(ccTouchesMoved:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorMovedBit;
		if( [del respondsToSelector:@selector(ccTouchesEnded:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorEndedBit;
		if( [del respondsToSelector:@selector(ccTouchesCancelled:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorCancelledBit;
=======
			_enabledSelectors |= kCCTouchSelectorBeganBit;
		if( [del respondsToSelector:@selector(ccTouchesMoved:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorMovedBit;
		if( [del respondsToSelector:@selector(ccTouchesEnded:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorEndedBit;
		if( [del respondsToSelector:@selector(ccTouchesCancelled:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorCancelledBit;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}
@end

#pragma mark -
#pragma mark TargetedTouchHandler

@interface CCTargetedTouchHandler (private)
-(void) updateKnownTouches:(NSMutableSet *)touches withEvent:(UIEvent *)event selector:(SEL)selector unclaim:(BOOL)doUnclaim;
@end

@implementation CCTargetedTouchHandler

<<<<<<< HEAD
@synthesize swallowsTouches, claimedTouches;
=======
@synthesize swallowsTouches=_swallowsTouches, claimedTouches=_claimedTouches;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+ (id)handlerWithDelegate:(id)aDelegate priority:(int)priority swallowsTouches:(BOOL)swallow
{
	return [[[self alloc] initWithDelegate:aDelegate priority:priority swallowsTouches:swallow] autorelease];
}

- (id)initWithDelegate:(id)aDelegate priority:(int)aPriority swallowsTouches:(BOOL)swallow
{
	if ((self = [super initWithDelegate:aDelegate priority:aPriority])) {
<<<<<<< HEAD
		claimedTouches = [[NSMutableSet alloc] initWithCapacity:2];
		swallowsTouches = swallow;

		if( [aDelegate respondsToSelector:@selector(ccTouchBegan:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorBeganBit;
		if( [aDelegate respondsToSelector:@selector(ccTouchMoved:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorMovedBit;
		if( [aDelegate respondsToSelector:@selector(ccTouchEnded:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorEndedBit;
		if( [aDelegate respondsToSelector:@selector(ccTouchCancelled:withEvent:)] )
			enabledSelectors_ |= kCCTouchSelectorCancelledBit;
=======
		_claimedTouches = [[NSMutableSet alloc] initWithCapacity:2];
		_swallowsTouches = swallow;

		if( [aDelegate respondsToSelector:@selector(ccTouchBegan:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorBeganBit;
		if( [aDelegate respondsToSelector:@selector(ccTouchMoved:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorMovedBit;
		if( [aDelegate respondsToSelector:@selector(ccTouchEnded:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorEndedBit;
		if( [aDelegate respondsToSelector:@selector(ccTouchCancelled:withEvent:)] )
			_enabledSelectors |= kCCTouchSelectorCancelledBit;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

- (void)dealloc {
<<<<<<< HEAD
	[claimedTouches release];
=======
	[_claimedTouches release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}
@end


#endif // __CC_PLATFORM_IOS
