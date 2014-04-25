/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009-2010 Ricardo Quesada
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

#import "CCParallaxNode.h"
#import "Support/CGPointExtension.h"
#import "Support/ccCArray.h"

@interface CGPointObject : NSObject
{
<<<<<<< HEAD
	CGPoint	ratio_;
	CGPoint offset_;
	CCNode *child_;	// weak ref
=======
	CGPoint	_ratio;
	CGPoint _offset;
	CCNode *_child;	// weak ref
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@property (nonatomic,readwrite) CGPoint ratio;
@property (nonatomic,readwrite) CGPoint offset;
@property (nonatomic,readwrite,assign) CCNode *child;
+(id) pointWithCGPoint:(CGPoint)point offset:(CGPoint)offset;
-(id) initWithCGPoint:(CGPoint)point offset:(CGPoint)offset;
@end
@implementation CGPointObject
<<<<<<< HEAD
@synthesize ratio = ratio_;
@synthesize offset = offset_;
@synthesize child=child_;
=======
@synthesize ratio = _ratio;
@synthesize offset = _offset;
@synthesize child = _child;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) pointWithCGPoint:(CGPoint)ratio offset:(CGPoint)offset
{
	return [[[self alloc] initWithCGPoint:ratio offset:offset] autorelease];
}
-(id) initWithCGPoint:(CGPoint)ratio offset:(CGPoint)offset
{
	if( (self=[super init])) {
<<<<<<< HEAD
		ratio_ = ratio;
		offset_ = offset;
=======
		_ratio = ratio;
		_offset = offset;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}
@end

@implementation CCParallaxNode

<<<<<<< HEAD
@synthesize parallaxArray = parallaxArray_;
=======
@synthesize parallaxArray = _parallaxArray;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

-(id) init
{
	if( (self=[super init]) ) {
<<<<<<< HEAD
		parallaxArray_ = ccArrayNew(5);
		lastPosition = CGPointMake(-100,-100);
=======
		_parallaxArray = ccArrayNew(5);
		_lastPosition = CGPointMake(-100,-100);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

- (void) dealloc
{
<<<<<<< HEAD
	if( parallaxArray_ ) {
		ccArrayFree(parallaxArray_);
		parallaxArray_ = nil;
=======
	if( _parallaxArray ) {
		ccArrayFree(_parallaxArray);
		_parallaxArray = nil;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	[super dealloc];
}

-(void) addChild:(CCNode*)child z:(NSInteger)z tag:(NSInteger)tag
{
	NSAssert(NO,@"ParallaxNode: use addChild:z:parallaxRatio:positionOffset instead");
}

-(void) addChild: (CCNode*) child z:(NSInteger)z parallaxRatio:(CGPoint)ratio positionOffset:(CGPoint)offset
{
	NSAssert( child != nil, @"Argument must be non-nil");
	CGPointObject *obj = [CGPointObject pointWithCGPoint:ratio offset:offset];
	obj.child = child;
<<<<<<< HEAD
	ccArrayAppendObjectWithResize(parallaxArray_, obj);
=======
	ccArrayAppendObjectWithResize(_parallaxArray, obj);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CGPoint pos = self.position;
	pos.x = pos.x * ratio.x + offset.x;
	pos.y = pos.y * ratio.y + offset.y;
	child.position = pos;

	[super addChild: child z:z tag:child.tag];
}

-(void) removeChild:(CCNode*)node cleanup:(BOOL)cleanup
{
<<<<<<< HEAD
	for( unsigned int i=0;i < parallaxArray_->num;i++) {
		CGPointObject *point = parallaxArray_->arr[i];
		if( [point.child isEqual:node] ) {
			ccArrayRemoveObjectAtIndex(parallaxArray_, i);
=======
	for( unsigned int i=0;i < _parallaxArray->num;i++) {
		CGPointObject *point = _parallaxArray->arr[i];
		if( [point.child isEqual:node] ) {
			ccArrayRemoveObjectAtIndex(_parallaxArray, i);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			break;
		}
	}
	[super removeChild:node cleanup:cleanup];
}

-(void) removeAllChildrenWithCleanup:(BOOL)cleanup
{
<<<<<<< HEAD
	ccArrayRemoveAllObjects(parallaxArray_);
=======
	ccArrayRemoveAllObjects(_parallaxArray);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super removeAllChildrenWithCleanup:cleanup];
}

-(CGPoint) absolutePosition_
{
<<<<<<< HEAD
	CGPoint ret = position_;
=======
	CGPoint ret = _position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CCNode *cn = self;

	while (cn.parent != nil) {
		cn = cn.parent;
		ret = ccpAdd( ret,  cn.position );
	}

	return ret;
}

/*
 The positions are updated at visit because:
   - using a timer is not guaranteed that it will called after all the positions were updated
   - overriding "draw" will only be precise if the children have a z > 0
*/
-(void) visit
{
<<<<<<< HEAD
//	CGPoint pos = position_;
//	CGPoint	pos = [self convertToWorldSpace:CGPointZero];
	CGPoint pos = [self absolutePosition_];
	if( ! CGPointEqualToPoint(pos, lastPosition) ) {

		for(unsigned int i=0; i < parallaxArray_->num; i++ ) {

			CGPointObject *point = parallaxArray_->arr[i];
=======
//	CGPoint pos = _position;
//	CGPoint	pos = [self convertToWorldSpace:CGPointZero];
	CGPoint pos = [self absolutePosition_];
	if( ! CGPointEqualToPoint(pos, _lastPosition) ) {

		for(unsigned int i=0; i < _parallaxArray->num; i++ ) {

			CGPointObject *point = _parallaxArray->arr[i];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			float x = -pos.x + pos.x * point.ratio.x + point.offset.x;
			float y = -pos.y + pos.y * point.ratio.y + point.offset.y;
			point.child.position = ccp(x,y);
		}

<<<<<<< HEAD
		lastPosition = pos;
=======
		_lastPosition = pos;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	[super visit];
}
@end
