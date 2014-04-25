/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009 Valentin Milea
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

#import "CCNode.h"
#import "CCGrid.h"
#import "CCDirector.h"
#import "CCActionManager.h"
#import "CCCamera.h"
#import "CCScheduler.h"
#import "ccConfig.h"
#import "ccMacros.h"
#import "Support/CGPointExtension.h"
#import "Support/ccCArray.h"
#import "Support/TransformUtils.h"
#import "ccMacros.h"
#import "CCGLProgram.h"

// externals
#import "kazmath/GL/matrix.h"

#ifdef __CC_PLATFORM_IOS
#import "Platforms/iOS/CCDirectorIOS.h"
#endif


#if CC_NODE_RENDER_SUBPIXEL
#define RENDER_IN_SUBPIXEL
#else
<<<<<<< HEAD
#define RENDER_IN_SUBPIXEL (NSInteger)
#endif


=======
#define RENDER_IN_SUBPIXEL(__ARGS__) (ceil(__ARGS__))
#endif


#pragma mark - Node

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@interface CCNode ()
// lazy allocs
-(void) childrenAlloc;
// helper that reorder a child
-(void) insertChild:(CCNode*)child z:(NSInteger)z;
// used internally to alter the zOrder variable. DON'T call this method manually
-(void) _setZOrder:(NSInteger) z;
-(void) detachChild:(CCNode *)child cleanup:(BOOL)doCleanup;
@end

@implementation CCNode

// XXX: Yes, nodes might have a sort problem once every 15 days if the game runs at 60 FPS and each frame sprites are reordered.
static NSUInteger globalOrderOfArrival = 1;

<<<<<<< HEAD
@synthesize children = children_;
@synthesize visible = visible_;
@synthesize parent = parent_;
@synthesize grid = grid_;
@synthesize zOrder = zOrder_;
@synthesize tag = tag_;
@synthesize vertexZ = vertexZ_;
@synthesize isRunning = isRunning_;
@synthesize userData = userData_, userObject = userObject_;
@synthesize	shaderProgram = shaderProgram_;
@synthesize orderOfArrival = orderOfArrival_;
@synthesize glServerState = glServerState_;

#pragma mark CCNode - Transform related properties

@synthesize rotation = rotation_, scaleX = scaleX_, scaleY = scaleY_;
@synthesize position = position_;
@synthesize anchorPoint = anchorPoint_, anchorPointInPoints = anchorPointInPoints_;
@synthesize contentSize = contentSize_;
@synthesize isRelativeAnchorPoint = isRelativeAnchorPoint_;
@synthesize skewX = skewX_, skewY = skewY_;
=======
@synthesize children = _children;
@synthesize visible = _visible;
@synthesize parent = _parent;
@synthesize grid = _grid;
@synthesize zOrder = _zOrder;
@synthesize tag = _tag;
@synthesize vertexZ = _vertexZ;
@synthesize isRunning = _isRunning;
@synthesize userData = _userData, userObject = _userObject;
@synthesize	shaderProgram = _shaderProgram;
@synthesize orderOfArrival = _orderOfArrival;
@synthesize glServerState = _glServerState;

#pragma mark CCNode - Transform related properties

@synthesize rotationX = _rotationX, rotationY = _rotationY, scaleX = _scaleX, scaleY = _scaleY;
@synthesize position = _position;
@synthesize anchorPoint = _anchorPoint, anchorPointInPoints = _anchorPointInPoints;
@synthesize contentSize = _contentSize;
@synthesize ignoreAnchorPointForPosition = _ignoreAnchorPointForPosition;
@synthesize skewX = _skewX, skewY = _skewY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#pragma mark CCNode - Init & cleanup

+(id) node
{
	return [[[self alloc] init] autorelease];
}

-(id) init
{
	if ((self=[super init]) ) {

<<<<<<< HEAD
		isRunning_ = NO;

		skewX_ = skewY_ = 0.0f;
		rotation_ = 0.0f;
		scaleX_ = scaleY_ = 1.0f;
        position_ = CGPointZero;
        contentSize_ = CGSizeZero;
		anchorPointInPoints_ = anchorPoint_ = CGPointZero;


		// "whole screen" objects. like Scenes and Layers, should set isRelativeAnchorPoint to NO
		isRelativeAnchorPoint_ = YES;

		isTransformDirty_ = isInverseDirty_ = YES;

		vertexZ_ = 0;

		grid_ = nil;

		visible_ = YES;

		tag_ = kCCNodeTagInvalid;

		zOrder_ = 0;

		// lazy alloc
		camera_ = nil;

		// children (lazy allocs)
		children_ = nil;

		// userData is always inited as nil
		userData_ = NULL;
		userObject_ = nil;

		//initialize parent to nil
		parent_ = nil;

		shaderProgram_ = nil;

		orderOfArrival_ = 0;

		glServerState_ = CC_GL_BLEND;
=======
		_isRunning = NO;

		_skewX = _skewY = 0.0f;
		_rotationX = _rotationY = 0.0f;
		_scaleX = _scaleY = 1.0f;
        _position = CGPointZero;
        _contentSize = CGSizeZero;
		_anchorPointInPoints = _anchorPoint = CGPointZero;


		// "whole screen" objects. like Scenes and Layers, should set ignoreAnchorPointForPosition to YES
		_ignoreAnchorPointForPosition = NO;

		_isTransformDirty = _isInverseDirty = YES;

		_vertexZ = 0;

		_grid = nil;

		_visible = YES;

		_tag = kCCNodeTagInvalid;

		_zOrder = 0;

		// lazy alloc
		_camera = nil;

		// children (lazy allocs)
		_children = nil;

		// userData is always inited as nil
		_userData = NULL;
		_userObject = nil;

		//initialize parent to nil
		_parent = nil;

		_shaderProgram = nil;

		_orderOfArrival = 0;

		_glServerState = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		
		// set default scheduler and actionManager
		CCDirector *director = [CCDirector sharedDirector];
		self.actionManager = [director actionManager];
		self.scheduler = [director scheduler];
	}

	return self;
}

- (void)cleanup
{
	// actions
	[self stopAllActions];
	[self unscheduleAllSelectors];

	// timers
<<<<<<< HEAD
	[children_ makeObjectsPerformSelector:@selector(cleanup)];
=======
	[_children makeObjectsPerformSelector:@selector(cleanup)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (NSString*) description
{
<<<<<<< HEAD
	return [NSString stringWithFormat:@"<%@ = %08X | Tag = %i>", [self class], self, tag_];
=======
	return [NSString stringWithFormat:@"<%@ = %p | Tag = %ld>", [self class], self, (long)_tag];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) dealloc
{
	CCLOGINFO( @"cocos2d: deallocing %@", self);

<<<<<<< HEAD
	[actionManager_ release];
	[scheduler_ release];
	[camera_ release];
	[grid_ release];
	[shaderProgram_ release];
	[userObject_ release];

	// children
	CCNode *child;
	CCARRAY_FOREACH(children_, child)
		child.parent = nil;

	[children_ release];
=======
	[_actionManager release];
	[_scheduler release];
	[_camera release];
	[_grid release];
	[_shaderProgram release];
	[_userObject release];

	// children
	CCNode *child;
	CCARRAY_FOREACH(_children, child)
		child.parent = nil;

	[_children release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

#pragma mark Setters

// getters synthesized, setters explicit
-(void) setRotation: (float)newRotation
{
<<<<<<< HEAD
	rotation_ = newRotation;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_rotationX = _rotationY = newRotation;
	_isTransformDirty = _isInverseDirty = YES;
}

-(float) rotation
{
	NSAssert( _rotationX == _rotationY, @"CCNode#rotation. RotationX != RotationY. Don't know which one to return");
	return _rotationX;
}

-(void) setRotationX: (float)newX
{
	_rotationX = newX;
	_isTransformDirty = _isInverseDirty = YES;
}

-(void) setRotationY: (float)newY
{
	_rotationY = newY;
	_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setScaleX: (float)newScaleX
{
<<<<<<< HEAD
	scaleX_ = newScaleX;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_scaleX = newScaleX;
	_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setScaleY: (float)newScaleY
{
<<<<<<< HEAD
	scaleY_ = newScaleY;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_scaleY = newScaleY;
	_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setSkewX:(float)newSkewX
{
<<<<<<< HEAD
	skewX_ = newSkewX;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_skewX = newSkewX;
	_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setSkewY:(float)newSkewY
{
<<<<<<< HEAD
	skewY_ = newSkewY;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_skewY = newSkewY;
	_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setPosition: (CGPoint)newPosition
{
<<<<<<< HEAD
	position_ = newPosition;
	isTransformDirty_ = isInverseDirty_ = YES;
}

-(void) setIsRelativeAnchorPoint: (BOOL)newValue
{
	isRelativeAnchorPoint_ = newValue;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_position = newPosition;
	_isTransformDirty = _isInverseDirty = YES;
}

-(void) setIgnoreAnchorPointForPosition: (BOOL)newValue
{
	if( newValue != _ignoreAnchorPointForPosition ) {
		_ignoreAnchorPointForPosition = newValue;
		_isTransformDirty = _isInverseDirty = YES;
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setAnchorPoint:(CGPoint)point
{
<<<<<<< HEAD
	if( ! CGPointEqualToPoint(point, anchorPoint_) ) {
		anchorPoint_ = point;
		anchorPointInPoints_ = ccp( contentSize_.width * anchorPoint_.x, contentSize_.height * anchorPoint_.y );
		isTransformDirty_ = isInverseDirty_ = YES;
=======
	if( ! CGPointEqualToPoint(point, _anchorPoint) ) {
		_anchorPoint = point;
		_anchorPointInPoints = ccp( _contentSize.width * _anchorPoint.x, _contentSize.height * _anchorPoint.y );
		_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) setContentSize:(CGSize)size
{
<<<<<<< HEAD
	if( ! CGSizeEqualToSize(size, contentSize_) ) {
		contentSize_ = size;

		anchorPointInPoints_ = ccp( contentSize_.width * anchorPoint_.x, contentSize_.height * anchorPoint_.y );
		isTransformDirty_ = isInverseDirty_ = YES;
=======
	if( ! CGSizeEqualToSize(size, _contentSize) ) {
		_contentSize = size;

		_anchorPointInPoints = ccp( _contentSize.width * _anchorPoint.x, _contentSize.height * _anchorPoint.y );
		_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

- (CGRect) boundingBox
{
<<<<<<< HEAD
	CGRect rect = CGRectMake(0, 0, contentSize_.width, contentSize_.height);
=======
	CGRect rect = CGRectMake(0, 0, _contentSize.width, _contentSize.height);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return CGRectApplyAffineTransform(rect, [self nodeToParentTransform]);
}

-(void) setVertexZ:(float)vertexZ
{
<<<<<<< HEAD
	vertexZ_ = vertexZ;
=======
	_vertexZ = vertexZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(float) scale
{
<<<<<<< HEAD
	NSAssert( scaleX_ == scaleY_, @"CCNode#scale. ScaleX != ScaleY. Don't know which one to return");
	return scaleX_;
=======
	NSAssert( _scaleX == _scaleY, @"CCNode#scale. ScaleX != ScaleY. Don't know which one to return");
	return _scaleX;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setScale:(float) s
{
<<<<<<< HEAD
	scaleX_ = scaleY_ = s;
	isTransformDirty_ = isInverseDirty_ = YES;
=======
	_scaleX = _scaleY = s;
	_isTransformDirty = _isInverseDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) setZOrder:(NSInteger)zOrder
{
	[self _setZOrder:zOrder];

<<<<<<< HEAD
    if (parent_)
        [parent_ reorderChild:self z:zOrder];
=======
    if (_parent)
        [_parent reorderChild:self z:zOrder];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCNode Composition

-(void) childrenAlloc
{
<<<<<<< HEAD
	children_ = [[CCArray alloc] initWithCapacity:4];
=======
	_children = [[CCArray alloc] initWithCapacity:4];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// camera: lazy alloc
-(CCCamera*) camera
{
<<<<<<< HEAD
	if( ! camera_ ) {
		camera_ = [[CCCamera alloc] init];

		// by default, center camera at the Sprite's anchor point
//		[camera_ setCenterX:anchorPointInPoints_.x centerY:anchorPointInPoints_.y centerZ:0];
//		[camera_ setEyeX:anchorPointInPoints_.x eyeY:anchorPointInPoints_.y eyeZ:1];

//		[camera_ setCenterX:0 centerY:0 centerZ:0];
//		[camera_ setEyeX:0 eyeY:0 eyeZ:1];
	}

	return camera_;
=======
	if( ! _camera ) {
		_camera = [[CCCamera alloc] init];

		// by default, center camera at the Sprite's anchor point
//		[_camera setCenterX:_anchorPointInPoints.x centerY:_anchorPointInPoints.y centerZ:0];
//		[_camera setEyeX:_anchorPointInPoints.x eyeY:_anchorPointInPoints.y eyeZ:1];

//		[_camera setCenterX:0 centerY:0 centerZ:0];
//		[_camera setEyeX:0 eyeY:0 eyeZ:1];
	}

	return _camera;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCNode*) getChildByTag:(NSInteger) aTag
{
	NSAssert( aTag != kCCNodeTagInvalid, @"Invalid tag");

	CCNode *node;
<<<<<<< HEAD
	CCARRAY_FOREACH(children_, node){
=======
	CCARRAY_FOREACH(_children, node){
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		if( node.tag == aTag )
			return node;
	}
	// not found
	return nil;
}

/* "add" logic MUST only be on this method
 * If a class want's to extend the 'addChild' behaviour it only needs
 * to override this method
 */
-(void) addChild: (CCNode*) child z:(NSInteger)z tag:(NSInteger) aTag
{
	NSAssert( child != nil, @"Argument must be non-nil");
	NSAssert( child.parent == nil, @"child already added. It can't be added again");

<<<<<<< HEAD
	if( ! children_ )
=======
	if( ! _children )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self childrenAlloc];

	[self insertChild:child z:z];

	child.tag = aTag;

	[child setParent: self];

	[child setOrderOfArrival: globalOrderOfArrival++];

<<<<<<< HEAD
	if( isRunning_ ) {
=======
	if( _isRunning ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[child onEnter];
		[child onEnterTransitionDidFinish];
	}
}

-(void) addChild: (CCNode*) child z:(NSInteger)z
{
	NSAssert( child != nil, @"Argument must be non-nil");
	[self addChild:child z:z tag:child.tag];
}

-(void) addChild: (CCNode*) child
{
	NSAssert( child != nil, @"Argument must be non-nil");
	[self addChild:child z:child.zOrder tag:child.tag];
}

<<<<<<< HEAD
-(void) removeFromParentAndCleanup:(BOOL)cleanup
{
	[parent_ removeChild:self cleanup:cleanup];
}

/* "remove" logic MUST only be on this method
 * If a class want's to extend the 'removeChild' behavior it only needs
=======
-(void) removeFromParent
{
	[self removeFromParentAndCleanup:YES];
}

-(void) removeFromParentAndCleanup:(BOOL)cleanup
{
	[_parent removeChild:self cleanup:cleanup];
}

-(void) removeChild: (CCNode*)child
{
	[self removeChild:child cleanup:YES];
}

/* "remove" logic MUST only be on this method
 * If a class wants to extend the 'removeChild' behavior it only needs
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 * to override this method
 */
-(void) removeChild: (CCNode*)child cleanup:(BOOL)cleanup
{
	// explicit nil handling
	if (child == nil)
		return;

<<<<<<< HEAD
	if ( [children_ containsObject:child] )
		[self detachChild:child cleanup:cleanup];
}

=======
	if ( [_children containsObject:child] )
		[self detachChild:child cleanup:cleanup];
}

-(void) removeChildByTag:(NSInteger)aTag
{
	[self removeChildByTag:aTag cleanup:YES];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) removeChildByTag:(NSInteger)aTag cleanup:(BOOL)cleanup
{
	NSAssert( aTag != kCCNodeTagInvalid, @"Invalid tag");

	CCNode *child = [self getChildByTag:aTag];

	if (child == nil)
		CCLOG(@"cocos2d: removeChildByTag: child not found!");
	else
		[self removeChild:child cleanup:cleanup];
}

<<<<<<< HEAD
=======
-(void) removeAllChildren
{
	[self removeAllChildrenWithCleanup:YES];
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) removeAllChildrenWithCleanup:(BOOL)cleanup
{
	// not using detachChild improves speed here
	CCNode *c;
<<<<<<< HEAD
	CCARRAY_FOREACH(children_, c)
=======
	CCARRAY_FOREACH(_children, c)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	{
		// IMPORTANT:
		//  -1st do onExit
		//  -2nd cleanup
<<<<<<< HEAD
		if (isRunning_)
=======
		if (_isRunning)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		{
			[c onExitTransitionDidStart];
			[c onExit];
		}

		if (cleanup)
			[c cleanup];

		// set parent nil at the end (issue #476)
		[c setParent:nil];
	}

<<<<<<< HEAD
	[children_ removeAllObjects];
=======
	[_children removeAllObjects];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) detachChild:(CCNode *)child cleanup:(BOOL)doCleanup
{
	// IMPORTANT:
	//  -1st do onExit
	//  -2nd cleanup
<<<<<<< HEAD
	if (isRunning_)
=======
	if (_isRunning)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	{
		[child onExitTransitionDidStart];
		[child onExit];
	}

	// If you don't do cleanup, the child's actions will not get removed and the
	// its scheduledSelectors_ dict will not get released!
	if (doCleanup)
		[child cleanup];

	// set parent nil at the end (issue #476)
	[child setParent:nil];

<<<<<<< HEAD
	[children_ removeObject:child];
=======
	[_children removeObject:child];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// used internally to alter the zOrder variable. DON'T call this method manually
-(void) _setZOrder:(NSInteger) z
{
<<<<<<< HEAD
	zOrder_ = z;
=======
	_zOrder = z;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

// helper used by reorderChild & add
-(void) insertChild:(CCNode*)child z:(NSInteger)z
{
<<<<<<< HEAD
	isReorderChildDirty_=YES;

	ccArrayAppendObjectWithResize(children_->data, child);
=======
	_isReorderChildDirty=YES;

	ccArrayAppendObjectWithResize(_children->data, child);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[child _setZOrder:z];
}

-(void) reorderChild:(CCNode*) child z:(NSInteger)z
{
	NSAssert( child != nil, @"Child must be non-nil");

<<<<<<< HEAD
	isReorderChildDirty_ = YES;
=======
	_isReorderChildDirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[child setOrderOfArrival: globalOrderOfArrival++];
	[child _setZOrder:z];
}

- (void) sortAllChildren
{
<<<<<<< HEAD
	if (isReorderChildDirty_)
	{
		NSInteger i,j,length = children_->data->num;
		CCNode ** x = children_->data->arr;
=======
	if (_isReorderChildDirty)
	{
		NSInteger i,j,length = _children->data->num;
		CCNode ** x = _children->data->arr;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		CCNode *tempItem;

		// insertion sort
		for(i=1; i<length; i++)
		{
			tempItem = x[i];
			j = i-1;

			//continue moving element downwards while zOrder is smaller or when zOrder is the same but mutatedIndex is smaller
			while(j>=0 && ( tempItem.zOrder < x[j].zOrder || ( tempItem.zOrder== x[j].zOrder && tempItem.orderOfArrival < x[j].orderOfArrival ) ) )
			{
				x[j+1] = x[j];
				j = j-1;
			}
			x[j+1] = tempItem;
		}

		//don't need to check children recursively, that's done in visit of each child

<<<<<<< HEAD
		isReorderChildDirty_ = NO;
=======
		_isReorderChildDirty = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

#pragma mark CCNode Draw

-(void) draw
{
}

-(void) visit
{
	// quick return if not visible. children won't be drawn.
<<<<<<< HEAD
	if (!visible_)
=======
	if (!_visible)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		return;

	kmGLPushMatrix();

<<<<<<< HEAD
	if ( grid_ && grid_.active)
		[grid_ beforeDraw];

	[self transform];

	if(children_) {

		[self sortAllChildren];

		ccArray *arrayData = children_->data;
=======
	if ( _grid && _grid.active)
		[_grid beforeDraw];

	[self transform];

	if(_children) {

		[self sortAllChildren];

		ccArray *arrayData = _children->data;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		NSUInteger i = 0;

		// draw children zOrder < 0
		for( ; i < arrayData->num; i++ ) {
			CCNode *child = arrayData->arr[i];
			if ( [child zOrder] < 0 )
				[child visit];
			else
				break;
		}

		// self draw
		[self draw];

		// draw children zOrder >= 0
		for( ; i < arrayData->num; i++ ) {
			CCNode *child =  arrayData->arr[i];
			[child visit];
		}

	} else
		[self draw];

	// reset for next frame
<<<<<<< HEAD
	orderOfArrival_ = 0;

	if ( grid_ && grid_.active)
		[grid_ afterDraw:self];
=======
	_orderOfArrival = 0;

	if ( _grid && _grid.active)
		[_grid afterDraw:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	kmGLPopMatrix();
}

#pragma mark CCNode - Transformations

-(void) transformAncestors
{
<<<<<<< HEAD
	if( parent_ ) {
		[parent_ transformAncestors];
		[parent_ transform];
=======
	if( _parent ) {
		[_parent transformAncestors];
		[_parent transform];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) transform
{
	kmMat4 transfrom4x4;

	// Convert 3x3 into 4x4 matrix
	CGAffineTransform tmpAffine = [self nodeToParentTransform];
	CGAffineToGL(&tmpAffine, transfrom4x4.mat);

	// Update Z vertex manually
<<<<<<< HEAD
	transfrom4x4.mat[14] = vertexZ_;
=======
	transfrom4x4.mat[14] = _vertexZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	kmGLMultMatrix( &transfrom4x4 );


	// XXX: Expensive calls. Camera should be integrated into the cached affine matrix
<<<<<<< HEAD
	if ( camera_ && !(grid_ && grid_.active) )
	{
		BOOL translate = (anchorPointInPoints_.x != 0.0f || anchorPointInPoints_.y != 0.0f);

		if( translate )
			kmGLTranslatef(RENDER_IN_SUBPIXEL(anchorPointInPoints_.x), RENDER_IN_SUBPIXEL(anchorPointInPoints_.y), 0 );

		[camera_ locate];

		if( translate )
			kmGLTranslatef(RENDER_IN_SUBPIXEL(-anchorPointInPoints_.x), RENDER_IN_SUBPIXEL(-anchorPointInPoints_.y), 0 );
=======
	if ( _camera && !(_grid && _grid.active) )
	{
		BOOL translate = (_anchorPointInPoints.x != 0.0f || _anchorPointInPoints.y != 0.0f);

		if( translate )
			kmGLTranslatef(RENDER_IN_SUBPIXEL(_anchorPointInPoints.x), RENDER_IN_SUBPIXEL(_anchorPointInPoints.y), 0 );

		[_camera locate];

		if( translate )
			kmGLTranslatef(RENDER_IN_SUBPIXEL(-_anchorPointInPoints.x), RENDER_IN_SUBPIXEL(-_anchorPointInPoints.y), 0 );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

#pragma mark CCNode SceneManagement

-(void) onEnter
{
<<<<<<< HEAD
	[children_ makeObjectsPerformSelector:@selector(onEnter)];
	[self resumeSchedulerAndActions];

	isRunning_ = YES;
=======
	[_children makeObjectsPerformSelector:@selector(onEnter)];
	[self resumeSchedulerAndActions];

	_isRunning = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) onEnterTransitionDidFinish
{
<<<<<<< HEAD
	[children_ makeObjectsPerformSelector:@selector(onEnterTransitionDidFinish)];
=======
	[_children makeObjectsPerformSelector:@selector(onEnterTransitionDidFinish)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) onExitTransitionDidStart
{
<<<<<<< HEAD
	[children_ makeObjectsPerformSelector:@selector(onExitTransitionDidStart)];
=======
	[_children makeObjectsPerformSelector:@selector(onExitTransitionDidStart)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) onExit
{
	[self pauseSchedulerAndActions];
<<<<<<< HEAD
	isRunning_ = NO;

	[children_ makeObjectsPerformSelector:@selector(onExit)];
=======
	_isRunning = NO;

	[_children makeObjectsPerformSelector:@selector(onExit)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCNode Actions

-(void) setActionManager:(CCActionManager *)actionManager
{
<<<<<<< HEAD
	if( actionManager != actionManager_ ) {
		[self stopAllActions];
		[actionManager_ release];

		actionManager_ = [actionManager retain];
=======
	if( actionManager != _actionManager ) {
		[self stopAllActions];
		[_actionManager release];

		_actionManager = [actionManager retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(CCActionManager*) actionManager
{
<<<<<<< HEAD
	return actionManager_;
=======
	return _actionManager;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCAction*) runAction:(CCAction*) action
{
	NSAssert( action != nil, @"Argument must be non-nil");

<<<<<<< HEAD
	[actionManager_ addAction:action target:self paused:!isRunning_];
=======
	[_actionManager addAction:action target:self paused:!_isRunning];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return action;
}

-(void) stopAllActions
{
<<<<<<< HEAD
	[actionManager_ removeAllActionsFromTarget:self];
=======
	[_actionManager removeAllActionsFromTarget:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stopAction: (CCAction*) action
{
<<<<<<< HEAD
	[actionManager_ removeAction:action];
=======
	[_actionManager removeAction:action];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) stopActionByTag:(NSInteger)aTag
{
	NSAssert( aTag != kCCActionTagInvalid, @"Invalid tag");
<<<<<<< HEAD
	[actionManager_ removeActionByTag:aTag target:self];
=======
	[_actionManager removeActionByTag:aTag target:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCAction*) getActionByTag:(NSInteger) aTag
{
	NSAssert( aTag != kCCActionTagInvalid, @"Invalid tag");
<<<<<<< HEAD
	return 	[actionManager_ getActionByTag:aTag target:self];
=======
	return 	[_actionManager getActionByTag:aTag target:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(NSUInteger) numberOfRunningActions
{
<<<<<<< HEAD
	return [actionManager_ numberOfRunningActionsInTarget:self];
=======
	return [_actionManager numberOfRunningActionsInTarget:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCNode - Scheduler

-(void) setScheduler:(CCScheduler *)scheduler
{
<<<<<<< HEAD
	if( scheduler != scheduler_ ) {
		[self unscheduleAllSelectors];
		[scheduler_ release];

		scheduler_ = [scheduler retain];
=======
	if( scheduler != _scheduler ) {
		[self unscheduleAllSelectors];
		[_scheduler release];

		_scheduler = [scheduler retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(CCScheduler*) scheduler
{
<<<<<<< HEAD
	return scheduler_;
=======
	return _scheduler;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) scheduleUpdate
{
	[self scheduleUpdateWithPriority:0];
}

-(void) scheduleUpdateWithPriority:(NSInteger)priority
{
<<<<<<< HEAD
	[scheduler_ scheduleUpdateForTarget:self priority:priority paused:!isRunning_];
=======
	[_scheduler scheduleUpdateForTarget:self priority:priority paused:!_isRunning];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) unscheduleUpdate
{
<<<<<<< HEAD
	[scheduler_ unscheduleUpdateForTarget:self];
=======
	[_scheduler unscheduleUpdateForTarget:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) schedule:(SEL)selector
{
	[self schedule:selector interval:0 repeat:kCCRepeatForever delay:0];
}

-(void) schedule:(SEL)selector interval:(ccTime)interval
{
	[self schedule:selector interval:interval repeat:kCCRepeatForever delay:0];
}

-(void) schedule:(SEL)selector interval:(ccTime)interval repeat: (uint) repeat delay:(ccTime) delay
{
	NSAssert( selector != nil, @"Argument must be non-nil");
	NSAssert( interval >=0, @"Arguemnt must be positive");

<<<<<<< HEAD
	[scheduler_ scheduleSelector:selector forTarget:self interval:interval paused:!isRunning_ repeat:repeat delay:delay];
=======
	[_scheduler scheduleSelector:selector forTarget:self interval:interval repeat:repeat delay:delay paused:!_isRunning];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) scheduleOnce:(SEL) selector delay:(ccTime) delay
{
	[self schedule:selector interval:0.f repeat:0 delay:delay];
}

-(void) unschedule:(SEL)selector
{
	// explicit nil handling
	if (selector == nil)
		return;

<<<<<<< HEAD
	[scheduler_ unscheduleSelector:selector forTarget:self];
=======
	[_scheduler unscheduleSelector:selector forTarget:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) unscheduleAllSelectors
{
<<<<<<< HEAD
	[scheduler_ unscheduleAllSelectorsForTarget:self];
}
- (void) resumeSchedulerAndActions
{
	[scheduler_ resumeTarget:self];
	[actionManager_ resumeTarget:self];
=======
	[_scheduler unscheduleAllForTarget:self];
}
- (void) resumeSchedulerAndActions
{
	[_scheduler resumeTarget:self];
	[_actionManager resumeTarget:self];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) pauseSchedulerAndActions
{
<<<<<<< HEAD
	[scheduler_ pauseTarget:self];
	[actionManager_ pauseTarget:self];
=======
	[_scheduler pauseTarget:self];
	[_actionManager pauseTarget:self];
}

/* override me */
-(void) update:(ccTime)delta
{
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCNode Transform

- (CGAffineTransform)nodeToParentTransform
{
<<<<<<< HEAD
	if ( isTransformDirty_ ) {

		// Translate values
		float x = position_.x;
		float y = position_.y;

		if ( !isRelativeAnchorPoint_ ) {
			x += anchorPointInPoints_.x;
			y += anchorPointInPoints_.y;
		}

		// Rotation values
		float c = 1, s = 0;
		if( rotation_ ) {
			float radians = -CC_DEGREES_TO_RADIANS(rotation_);
			c = cosf(radians);
			s = sinf(radians);
		}

		BOOL needsSkewMatrix = ( skewX_ || skewY_ );


		// optimization:
		// inline anchor point calculation if skew is not needed
		if( !needsSkewMatrix && !CGPointEqualToPoint(anchorPointInPoints_, CGPointZero) ) {
			x += c * -anchorPointInPoints_.x * scaleX_ + -s * -anchorPointInPoints_.y * scaleY_;
			y += s * -anchorPointInPoints_.x * scaleX_ +  c * -anchorPointInPoints_.y * scaleY_;
=======
	if ( _isTransformDirty ) {

		// Translate values
		float x = _position.x;
		float y = _position.y;

		if ( _ignoreAnchorPointForPosition ) {
			x += _anchorPointInPoints.x;
			y += _anchorPointInPoints.y;
		}
    
		// Rotation values
		// Change rotation code to handle X and Y
		// If we skew with the exact same value for both x and y then we're simply just rotating
		float cx = 1, sx = 0, cy = 1, sy = 0;
		if( _rotationX || _rotationY ) {
			float radiansX = -CC_DEGREES_TO_RADIANS(_rotationX);
			float radiansY = -CC_DEGREES_TO_RADIANS(_rotationY);
			cx = cosf(radiansX);
			sx = sinf(radiansX);
			cy = cosf(radiansY);
			sy = sinf(radiansY);
		}

		BOOL needsSkewMatrix = ( _skewX || _skewY );

		// optimization:
		// inline anchor point calculation if skew is not needed
		// Adjusted transform calculation for rotational skew
		if( !needsSkewMatrix && !CGPointEqualToPoint(_anchorPointInPoints, CGPointZero) ) {
			x += cy * -_anchorPointInPoints.x * _scaleX + -sx * -_anchorPointInPoints.y * _scaleY;
			y += sy * -_anchorPointInPoints.x * _scaleX +  cx * -_anchorPointInPoints.y * _scaleY;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}


		// Build Transform Matrix
<<<<<<< HEAD
		transform_ = CGAffineTransformMake( c * scaleX_,  s * scaleX_,
										   -s * scaleY_, c * scaleY_,
=======
		// Adjusted transfor m calculation for rotational skew
		_transform = CGAffineTransformMake( cy * _scaleX, sy * _scaleX,
										   -sx * _scaleY, cx * _scaleY,
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
										   x, y );

		// XXX: Try to inline skew
		// If skew is needed, apply skew and then anchor point
		if( needsSkewMatrix ) {
<<<<<<< HEAD
			CGAffineTransform skewMatrix = CGAffineTransformMake(1.0f, tanf(CC_DEGREES_TO_RADIANS(skewY_)),
																 tanf(CC_DEGREES_TO_RADIANS(skewX_)), 1.0f,
																 0.0f, 0.0f );
			transform_ = CGAffineTransformConcat(skewMatrix, transform_);

			// adjust anchor point
			if( ! CGPointEqualToPoint(anchorPointInPoints_, CGPointZero) )
				transform_ = CGAffineTransformTranslate(transform_, -anchorPointInPoints_.x, -anchorPointInPoints_.y);
		}

		isTransformDirty_ = NO;
	}

	return transform_;
=======
			CGAffineTransform skewMatrix = CGAffineTransformMake(1.0f, tanf(CC_DEGREES_TO_RADIANS(_skewY)),
																 tanf(CC_DEGREES_TO_RADIANS(_skewX)), 1.0f,
																 0.0f, 0.0f );
			_transform = CGAffineTransformConcat(skewMatrix, _transform);

			// adjust anchor point
			if( ! CGPointEqualToPoint(_anchorPointInPoints, CGPointZero) )
				_transform = CGAffineTransformTranslate(_transform, -_anchorPointInPoints.x, -_anchorPointInPoints.y);
		}

		_isTransformDirty = NO;
	}

	return _transform;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CGAffineTransform)parentToNodeTransform
{
<<<<<<< HEAD
	if ( isInverseDirty_ ) {
		inverse_ = CGAffineTransformInvert([self nodeToParentTransform]);
		isInverseDirty_ = NO;
	}

	return inverse_;
=======
	if ( _isInverseDirty ) {
		_inverse = CGAffineTransformInvert([self nodeToParentTransform]);
		_isInverseDirty = NO;
	}

	return _inverse;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CGAffineTransform)nodeToWorldTransform
{
	CGAffineTransform t = [self nodeToParentTransform];

<<<<<<< HEAD
	for (CCNode *p = parent_; p != nil; p = p.parent)
=======
	for (CCNode *p = _parent; p != nil; p = p.parent)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		t = CGAffineTransformConcat(t, [p nodeToParentTransform]);

	return t;
}

- (CGAffineTransform)worldToNodeTransform
{
	return CGAffineTransformInvert([self nodeToWorldTransform]);
}

- (CGPoint)convertToNodeSpace:(CGPoint)worldPoint
{
	CGPoint ret = CGPointApplyAffineTransform(worldPoint, [self worldToNodeTransform]);
	return ret;
}

- (CGPoint)convertToWorldSpace:(CGPoint)nodePoint
{
	CGPoint ret = CGPointApplyAffineTransform(nodePoint, [self nodeToWorldTransform]);
	return ret;
}

- (CGPoint)convertToNodeSpaceAR:(CGPoint)worldPoint
{
	CGPoint nodePoint = [self convertToNodeSpace:worldPoint];
<<<<<<< HEAD
	return ccpSub(nodePoint, anchorPointInPoints_);
=======
	return ccpSub(nodePoint, _anchorPointInPoints);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (CGPoint)convertToWorldSpaceAR:(CGPoint)nodePoint
{
<<<<<<< HEAD
	nodePoint = ccpAdd(nodePoint, anchorPointInPoints_);
=======
	nodePoint = ccpAdd(nodePoint, _anchorPointInPoints);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	return [self convertToWorldSpace:nodePoint];
}

- (CGPoint)convertToWindowSpace:(CGPoint)nodePoint
{
    CGPoint worldPoint = [self convertToWorldSpace:nodePoint];
	return [[CCDirector sharedDirector] convertToUI:worldPoint];
}

// convenience methods which take a UITouch instead of CGPoint

#ifdef __CC_PLATFORM_IOS

- (CGPoint)convertTouchToNodeSpace:(UITouch *)touch
{
	CGPoint point = [touch locationInView: [touch view]];
	point = [[CCDirector sharedDirector] convertToGL: point];
	return [self convertToNodeSpace:point];
}

- (CGPoint)convertTouchToNodeSpaceAR:(UITouch *)touch
{
	CGPoint point = [touch locationInView: [touch view]];
	point = [[CCDirector sharedDirector] convertToGL: point];
	return [self convertToNodeSpaceAR:point];
}

#endif // __CC_PLATFORM_IOS

<<<<<<< HEAD
=======
@end


#pragma mark - NodeRGBA

@implementation CCNodeRGBA

@synthesize cascadeColorEnabled=_cascadeColorEnabled;
@synthesize cascadeOpacityEnabled=_cascadeOpacityEnabled;

-(id) init
{
	if ((self=[super init]) ) {
        _displayedOpacity = _realOpacity = 255;
        _displayedColor = _realColor = ccWHITE;
        _cascadeOpacityEnabled = NO;
        _cascadeColorEnabled = NO;
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
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end
