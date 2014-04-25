/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (C) 2009 Matt Oswald
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


#import "ccConfig.h"
#import "CCSprite.h"
#import "CCSpriteBatchNode.h"
#import "CCGrid.h"
#import "CCDrawingPrimitives.h"
#import "CCTextureCache.h"
#import "CCShaderCache.h"
#import "CCGLProgram.h"
#import "ccGLStateCache.h"
#import "CCDirector.h"
#import "Support/CGPointExtension.h"
#import "Support/TransformUtils.h"
#import "Support/CCProfiling.h"

// external
#import "kazmath/GL/matrix.h"

const NSUInteger defaultCapacity = 29;

#pragma mark -
#pragma mark CCSpriteBatchNode

@interface CCSpriteBatchNode (private)
-(void) updateAtlasIndex:(CCSprite*) sprite currentIndex:(NSInteger*) curIndex;
-(void) swap:(NSInteger) oldIndex withNewIndex:(NSInteger) newIndex;
-(void) updateBlendFunc;
@end

@implementation CCSpriteBatchNode

<<<<<<< HEAD
@synthesize textureAtlas = textureAtlas_;
@synthesize blendFunc = blendFunc_;
@synthesize descendants = descendants_;
=======
@synthesize textureAtlas = _textureAtlas;
@synthesize blendFunc = _blendFunc;
@synthesize descendants = _descendants;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


/*
 * creation with CCTexture2D
 */
+(id)batchNodeWithTexture:(CCTexture2D *)tex
{
	return [[[self alloc] initWithTexture:tex capacity:defaultCapacity] autorelease];
}

+(id)batchNodeWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity
{
	return [[[self alloc] initWithTexture:tex capacity:capacity] autorelease];
}

/*
 * creation with File Image
 */
+(id)batchNodeWithFile:(NSString*)fileImage capacity:(NSUInteger)capacity
{
	return [[[self alloc] initWithFile:fileImage capacity:capacity] autorelease];
}

+(id)batchNodeWithFile:(NSString*) imageFile
{
	return [[[self alloc] initWithFile:imageFile capacity:defaultCapacity] autorelease];
}

<<<<<<< HEAD
/*
 * init with CCTexture2D
 */
=======
-(id)init
{
    return [self initWithTexture:[[[CCTexture2D alloc] init] autorelease] capacity:0];
}

-(id)initWithFile:(NSString *)fileImage capacity:(NSUInteger)capacity
{
	CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:fileImage];
	return [self initWithTexture:tex capacity:capacity];
}

// Designated initializer
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id)initWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)capacity
{
	if( (self=[super init])) {

<<<<<<< HEAD
		blendFunc_.src = CC_BLEND_SRC;
		blendFunc_.dst = CC_BLEND_DST;
		textureAtlas_ = [[CCTextureAtlas alloc] initWithTexture:tex capacity:capacity];
=======
		_blendFunc.src = CC_BLEND_SRC;
		_blendFunc.dst = CC_BLEND_DST;
		_textureAtlas = [[CCTextureAtlas alloc] initWithTexture:tex capacity:capacity];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[self updateBlendFunc];

		// no lazy alloc in this node
<<<<<<< HEAD
		children_ = [[CCArray alloc] initWithCapacity:capacity];
		descendants_ = [[CCArray alloc] initWithCapacity:capacity];
=======
		_children = [[CCArray alloc] initWithCapacity:capacity];
		_descendants = [[CCArray alloc] initWithCapacity:capacity];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		self.shaderProgram = [[CCShaderCache sharedShaderCache] programForKey:kCCShader_PositionTextureColor];
	}

	return self;
}

<<<<<<< HEAD
/*
 * init with FileImage
 */
-(id)initWithFile:(NSString *)fileImage capacity:(NSUInteger)capacity
{
	CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:fileImage];
	return [self initWithTexture:tex capacity:capacity];
}

- (NSString*) description
{
	return [NSString stringWithFormat:@"<%@ = %08X | Tag = %i>", [self class], self, tag_ ];
=======

- (NSString*) description
{
	return [NSString stringWithFormat:@"<%@ = %p | Tag = %ld>", [self class], self, (long)_tag ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)dealloc
{
<<<<<<< HEAD
	[textureAtlas_ release];
	[descendants_ release];
=======
	[_textureAtlas release];
	[_descendants release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

#pragma mark CCSpriteBatchNode - composition

// override visit.
// Don't call visit on its children
-(void) visit
{
	CC_PROFILER_START_CATEGORY(kCCProfilerCategoryBatchSprite, @"CCSpriteBatchNode - visit");

<<<<<<< HEAD
	NSAssert(parent_ != nil, @"CCSpriteBatchNode should NOT be root node");
=======
	NSAssert(_parent != nil, @"CCSpriteBatchNode should NOT be root node");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// CAREFUL:
	// This visit is almost identical to CCNode#visit
	// with the exception that it doesn't call visit on its children
	//
	// The alternative is to have a void CCSprite#visit, but
	// although this is less mantainable, is faster
	//
<<<<<<< HEAD
	if (!visible_)
=======
	if (!_visible)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		return;

	kmGLPushMatrix();

<<<<<<< HEAD
	if ( grid_ && grid_.active) {
		[grid_ beforeDraw];
=======
	if ( _grid && _grid.active) {
		[_grid beforeDraw];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self transformAncestors];
	}

	[self sortAllChildren];
	[self transform];
	[self draw];

<<<<<<< HEAD
	if ( grid_ && grid_.active)
		[grid_ afterDraw:self];

	kmGLPopMatrix();

	orderOfArrival_ = 0;
=======
	if ( _grid && _grid.active)
		[_grid afterDraw:self];

	kmGLPopMatrix();

	_orderOfArrival = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CC_PROFILER_STOP_CATEGORY(kCCProfilerCategoryBatchSprite, @"CCSpriteBatchNode - visit");
}

// override addChild:
-(void) addChild:(CCSprite*)child z:(NSInteger)z tag:(NSInteger) aTag
{
	NSAssert( child != nil, @"Argument must be non-nil");
	NSAssert( [child isKindOfClass:[CCSprite class]], @"CCSpriteBatchNode only supports CCSprites as children");
<<<<<<< HEAD
	NSAssert( child.texture.name == textureAtlas_.texture.name, @"CCSprite is not using the same texture id");
=======
	NSAssert( child.texture.name == _textureAtlas.texture.name, @"CCSprite is not using the same texture id");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super addChild:child z:z tag:aTag];

	[self appendChild:child];
}

// override reorderChild
-(void) reorderChild:(CCSprite*)child z:(NSInteger)z
{
	NSAssert( child != nil, @"Child must be non-nil");
<<<<<<< HEAD
	NSAssert( [children_ containsObject:child], @"Child doesn't belong to Sprite" );
=======
	NSAssert( [_children containsObject:child], @"Child doesn't belong to Sprite" );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if( z == child.zOrder )
		return;

	//set the z-order and sort later
	[super reorderChild:child z:z];
}

// override removeChild:
-(void)removeChild: (CCSprite *)sprite cleanup:(BOOL)doCleanup
{
	// explicit nil handling
	if (sprite == nil)
		return;

<<<<<<< HEAD
	NSAssert([children_ containsObject:sprite], @"CCSpriteBatchNode doesn't contain the sprite. Can't remove it");
=======
	NSAssert([_children containsObject:sprite], @"CCSpriteBatchNode doesn't contain the sprite. Can't remove it");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// cleanup before removing
	[self removeSpriteFromAtlas:sprite];

	[super removeChild:sprite cleanup:doCleanup];
}

-(void)removeChildAtIndex:(NSUInteger)index cleanup:(BOOL)doCleanup
{
<<<<<<< HEAD
	[self removeChild:(CCSprite *)[children_ objectAtIndex:index] cleanup:doCleanup];
=======
	[self removeChild:(CCSprite *)[_children objectAtIndex:index] cleanup:doCleanup];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void)removeAllChildrenWithCleanup:(BOOL)doCleanup
{
	// Invalidate atlas index. issue #569
	// useSelfRender should be performed on all descendants. issue #1216
<<<<<<< HEAD
	[descendants_ makeObjectsPerformSelector:@selector(setBatchNode:) withObject:nil];

	[super removeAllChildrenWithCleanup:doCleanup];

	[descendants_ removeAllObjects];
	[textureAtlas_ removeAllQuads];
=======
	[_descendants makeObjectsPerformSelector:@selector(setBatchNode:) withObject:nil];

	[super removeAllChildrenWithCleanup:doCleanup];

	[_descendants removeAllObjects];
	[_textureAtlas removeAllQuads];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

//override sortAllChildren
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
		CCSprite *child;

		//insertion sort
		for(i=1; i<length; i++)
		{
			tempItem = x[i];
			j = i-1;

			//continue moving element downwards while zOrder is smaller or when zOrder is the same but orderOfArrival is smaller
			while(j>=0 && ( tempItem.zOrder < x[j].zOrder || ( tempItem.zOrder == x[j].zOrder && tempItem.orderOfArrival < x[j].orderOfArrival ) ) )
			{
				x[j+1] = x[j];
				j--;
			}

			x[j+1] = tempItem;
		}

		//sorted now check all children
<<<<<<< HEAD
		if ([children_ count] > 0)
		{
			//first sort all children recursively based on zOrder
			[children_ makeObjectsPerformSelector:@selector(sortAllChildren)];
=======
		if ([_children count] > 0)
		{
			//first sort all children recursively based on zOrder
			[_children makeObjectsPerformSelector:@selector(sortAllChildren)];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

			NSInteger index=0;

			//fast dispatch, give every child a new atlasIndex based on their relative zOrder (keep parent -> child relations intact)
			// and at the same time reorder descedants and the quads to the right index
<<<<<<< HEAD
			CCARRAY_FOREACH(children_, child)
				[self updateAtlasIndex:child currentIndex:&index];
		}

		isReorderChildDirty_=NO;
=======
			CCARRAY_FOREACH(_children, child)
				[self updateAtlasIndex:child currentIndex:&index];
		}

		_isReorderChildDirty=NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) updateAtlasIndex:(CCSprite*) sprite currentIndex:(NSInteger*) curIndex
{
	CCArray *array = [sprite children];
	NSUInteger count = [array count];
	NSInteger oldIndex;

	if( count == 0 )
	{
		oldIndex = sprite.atlasIndex;
		sprite.atlasIndex = *curIndex;
		sprite.orderOfArrival = 0;
		if (oldIndex != *curIndex)
			[self swap:oldIndex withNewIndex:*curIndex];
		(*curIndex)++;
	}
	else
	{
		BOOL needNewIndex=YES;

		if (((CCSprite*) (array->data->arr[0])).zOrder >= 0)
		{
			//all children are in front of the parent
			oldIndex = sprite.atlasIndex;
			sprite.atlasIndex = *curIndex;
			sprite.orderOfArrival = 0;
			if (oldIndex != *curIndex)
				[self swap:oldIndex withNewIndex:*curIndex];
			(*curIndex)++;

			needNewIndex = NO;
		}

		CCSprite* child;
		CCARRAY_FOREACH(array,child)
		{
			if (needNewIndex && child.zOrder >= 0)
			{
				oldIndex = sprite.atlasIndex;
				sprite.atlasIndex = *curIndex;
				sprite.orderOfArrival = 0;
				if (oldIndex != *curIndex)
					[self swap:oldIndex withNewIndex:*curIndex];
				(*curIndex)++;
				needNewIndex = NO;

			}

			[self updateAtlasIndex:child currentIndex:curIndex];
		}

		if (needNewIndex)
		{//all children have a zOrder < 0)
			oldIndex=sprite.atlasIndex;
			sprite.atlasIndex=*curIndex;
			sprite.orderOfArrival=0;
			if (oldIndex!=*curIndex)
				[self swap:oldIndex withNewIndex:*curIndex];
			(*curIndex)++;
		}
	}
}

- (void) swap:(NSInteger) oldIndex withNewIndex:(NSInteger) newIndex
{
<<<<<<< HEAD
	id* x = descendants_->data->arr;
	ccV3F_C4B_T2F_Quad* quads = textureAtlas_.quads;
=======
	id* x = _descendants->data->arr;
	ccV3F_C4B_T2F_Quad* quads = _textureAtlas.quads;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	id tempItem = x[oldIndex];
	ccV3F_C4B_T2F_Quad tempItemQuad=quads[oldIndex];

	//update the index of other swapped item
	((CCSprite*) x[newIndex]).atlasIndex=oldIndex;

	x[oldIndex]=x[newIndex];
	quads[oldIndex]=quads[newIndex];
	x[newIndex]=tempItem;
	quads[newIndex]=tempItemQuad;
}

- (void) reorderBatch:(BOOL) reorder
{
<<<<<<< HEAD
	isReorderChildDirty_=reorder;
=======
	_isReorderChildDirty=reorder;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCSpriteBatchNode - draw
-(void) draw
{
	CC_PROFILER_START(@"CCSpriteBatchNode - draw");

	// Optimization: Fast Dispatch
<<<<<<< HEAD
	if( textureAtlas_.totalQuads == 0 )
=======
	if( _textureAtlas.totalQuads == 0 )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		return;

	CC_NODE_DRAW_SETUP();

<<<<<<< HEAD
	[children_ makeObjectsPerformSelector:@selector(updateTransform)];

	ccGLBlendFunc( blendFunc_.src, blendFunc_.dst );

	[textureAtlas_ drawQuads];
=======
	[_children makeObjectsPerformSelector:@selector(updateTransform)];

	ccGLBlendFunc( _blendFunc.src, _blendFunc.dst );

	[_textureAtlas drawQuads];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	CC_PROFILER_STOP(@"CCSpriteBatchNode - draw");
}

#pragma mark CCSpriteBatchNode - private
-(void) increaseAtlasCapacity
{
	// if we're going beyond the current CCTextureAtlas's capacity,
	// all the previously initialized sprites will need to redo their texture coords
	// this is likely computationally expensive
<<<<<<< HEAD
	NSUInteger quantity = (textureAtlas_.capacity + 1) * 4 / 3;

	CCLOG(@"cocos2d: CCSpriteBatchNode: resizing TextureAtlas capacity from [%lu] to [%lu].",
		  (long)textureAtlas_.capacity,
		  (long)quantity);


	if( ! [textureAtlas_ resizeCapacity:quantity] ) {
		// serious problems
		CCLOG(@"cocos2d: WARNING: Not enough memory to resize the atlas");
=======
	NSUInteger quantity = (_textureAtlas.capacity + 1) * 4 / 3;

	CCLOG(@"cocos2d: CCSpriteBatchNode: resizing TextureAtlas capacity from [%lu] to [%lu].",
		  (long)_textureAtlas.capacity,
		  (long)quantity);


	if( ! [_textureAtlas resizeCapacity:quantity] ) {
		// serious problems
		CCLOGWARN(@"cocos2d: WARNING: Not enough memory to resize the atlas");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		NSAssert(NO,@"XXX: CCSpriteBatchNode#increaseAtlasCapacity SHALL handle this assert");
	}
}


#pragma mark CCSpriteBatchNode - Atlas Index Stuff

-(NSUInteger) rebuildIndexInOrder:(CCSprite*)node atlasIndex:(NSUInteger)index
{
	CCSprite *sprite;
	CCARRAY_FOREACH(node.children, sprite){
		if( sprite.zOrder < 0 )
			index = [self rebuildIndexInOrder:sprite atlasIndex:index];
	}

	// ignore self (batch node)
	if( ! [node isEqual:self]) {
		node.atlasIndex = index;
		index++;
	}

	CCARRAY_FOREACH(node.children, sprite){
		if( sprite.zOrder >= 0 )
			index = [self rebuildIndexInOrder:sprite atlasIndex:index];
	}

	return index;
}

-(NSUInteger) highestAtlasIndexInChild:(CCSprite*)sprite
{
	CCArray *array = [sprite children];
	NSUInteger count = [array count];
	if( count == 0 )
		return sprite.atlasIndex;
	else
		return [self highestAtlasIndexInChild:[array lastObject]];
}

-(NSUInteger) lowestAtlasIndexInChild:(CCSprite*)sprite
{
	CCArray *array = [sprite children];
	NSUInteger count = [array count];
	if( count == 0 )
		return sprite.atlasIndex;
	else
		return [self lowestAtlasIndexInChild:[array objectAtIndex:0] ];
}


-(NSUInteger)atlasIndexForChild:(CCSprite*)sprite atZ:(NSInteger)z
{
	CCArray *brothers = [[sprite parent] children];
	NSUInteger childIndex = [brothers indexOfObject:sprite];

	// ignore parent Z if parent is batchnode
	BOOL ignoreParent = ( sprite.parent == self );
	CCSprite *previous = nil;
	if( childIndex > 0 )
		previous = [brothers objectAtIndex:childIndex-1];

	// first child of the sprite sheet
	if( ignoreParent ) {
		if( childIndex == 0 )
			return 0;
		// else
		return [self highestAtlasIndexInChild: previous] + 1;
	}

	// parent is a CCSprite, so, it must be taken into account

	// first child of an CCSprite ?
	if( childIndex == 0 )
	{
		CCSprite *p = (CCSprite*) sprite.parent;

		// less than parent and brothers
		if( z < 0 )
			return p.atlasIndex;
		else
			return p.atlasIndex+1;

	} else {
		// previous & sprite belong to the same branch
		if( ( previous.zOrder < 0 && z < 0 )|| (previous.zOrder >= 0 && z >= 0) )
			return [self highestAtlasIndexInChild:previous] + 1;

		// else (previous < 0 and sprite >= 0 )
		CCSprite *p = (CCSprite*) sprite.parent;
		return p.atlasIndex + 1;
	}

	NSAssert( NO, @"Should not happen. Error calculating Z on Batch Node");
	return 0;
}

#pragma mark CCSpriteBatchNode - add / remove / reorder helper methods
// add child helper
-(void) insertChild:(CCSprite*)sprite inAtlasAtIndex:(NSUInteger)index
{
	[sprite setBatchNode:self];
	[sprite setAtlasIndex:index];
	[sprite setDirty: YES];

<<<<<<< HEAD
	if(textureAtlas_.totalQuads == textureAtlas_.capacity)
		[self increaseAtlasCapacity];

	ccV3F_C4B_T2F_Quad quad = [sprite quad];
	[textureAtlas_ insertQuad:&quad atIndex:index];

	ccArray *descendantsData = descendants_->data;
=======
	if(_textureAtlas.totalQuads == _textureAtlas.capacity)
		[self increaseAtlasCapacity];

	ccV3F_C4B_T2F_Quad quad = [sprite quad];
	[_textureAtlas insertQuad:&quad atIndex:index];

	ccArray *descendantsData = _descendants->data;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	ccArrayInsertObjectAtIndex(descendantsData, sprite, index);

	// update indices
	NSUInteger i = index+1;
	CCSprite *child;
	for(; i<descendantsData->num; i++){
		child = descendantsData->arr[i];
		child.atlasIndex = child.atlasIndex + 1;
	}

	// add children recursively
	CCARRAY_FOREACH(sprite.children, child){
		NSUInteger idx = [self atlasIndexForChild:child atZ: child.zOrder];
		[self insertChild:child inAtlasAtIndex:idx];
	}
}

// addChild helper, faster than insertChild
-(void) appendChild:(CCSprite*)sprite
{
<<<<<<< HEAD
	isReorderChildDirty_=YES;
	[sprite setBatchNode:self];
	[sprite setDirty: YES];

	if(textureAtlas_.totalQuads == textureAtlas_.capacity)
		[self increaseAtlasCapacity];

	ccArray *descendantsData = descendants_->data;
=======
	_isReorderChildDirty=YES;
	[sprite setBatchNode:self];
	[sprite setDirty: YES];

	if(_textureAtlas.totalQuads == _textureAtlas.capacity)
		[self increaseAtlasCapacity];

	ccArray *descendantsData = _descendants->data;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	ccArrayAppendObjectWithResize(descendantsData, sprite);

	NSUInteger index=descendantsData->num-1;

	sprite.atlasIndex=index;

	ccV3F_C4B_T2F_Quad quad = [sprite quad];
<<<<<<< HEAD
	[textureAtlas_ insertQuad:&quad atIndex:index];
=======
	[_textureAtlas insertQuad:&quad atIndex:index];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// add children recursively
	CCSprite* child;
	CCARRAY_FOREACH(sprite.children, child)
		[self appendChild:child];
}


// remove child helper
-(void) removeSpriteFromAtlas:(CCSprite*)sprite
{
	// remove from TextureAtlas
<<<<<<< HEAD
	[textureAtlas_ removeQuadAtIndex:sprite.atlasIndex];
=======
	[_textureAtlas removeQuadAtIndex:sprite.atlasIndex];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// Cleanup sprite. It might be reused (issue #569)
	[sprite setBatchNode:nil];

<<<<<<< HEAD
	ccArray *descendantsData = descendants_->data;
=======
	ccArray *descendantsData = _descendants->data;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	NSUInteger index = ccArrayGetIndexOfObject(descendantsData, sprite);
	if( index != NSNotFound ) {
		ccArrayRemoveObjectAtIndex(descendantsData, index);

		// update all sprites beyond this one
		NSUInteger count = descendantsData->num;

		for(; index < count; index++)
		{
			CCSprite *s = descendantsData->arr[index];
			s.atlasIndex = s.atlasIndex - 1;
		}
	}

	// remove children recursively
	CCSprite *child;
	CCARRAY_FOREACH(sprite.children, child)
		[self removeSpriteFromAtlas:child];
}

#pragma mark CCSpriteBatchNode - CocosNodeTexture protocol

-(void) updateBlendFunc
{
<<<<<<< HEAD
	if( ! [textureAtlas_.texture hasPremultipliedAlpha] ) {
		blendFunc_.src = GL_SRC_ALPHA;
		blendFunc_.dst = GL_ONE_MINUS_SRC_ALPHA;
=======
	if( ! [_textureAtlas.texture hasPremultipliedAlpha] ) {
		_blendFunc.src = GL_SRC_ALPHA;
		_blendFunc.dst = GL_ONE_MINUS_SRC_ALPHA;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) setTexture:(CCTexture2D*)texture
{
<<<<<<< HEAD
	textureAtlas_.texture = texture;
=======
	_textureAtlas.texture = texture;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self updateBlendFunc];
}

-(CCTexture2D*) texture
{
<<<<<<< HEAD
	return textureAtlas_.texture;
=======
	return _textureAtlas.texture;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

#pragma mark - CCSpriteBatchNode Extension


@implementation CCSpriteBatchNode (QuadExtension)

<<<<<<< HEAD
-(void) addQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
=======
-(void) insertQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
{
	NSAssert( sprite != nil, @"Argument must be non-nil");
	NSAssert( [sprite isKindOfClass:[CCSprite class]], @"CCSpriteBatchNode only supports CCSprites as children");
	
<<<<<<< HEAD
	
	while(index >= textureAtlas_.capacity || textureAtlas_.capacity == textureAtlas_.totalQuads )
=======
	// make needed room
	while(index >= _textureAtlas.capacity || _textureAtlas.capacity == _textureAtlas.totalQuads )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self increaseAtlasCapacity];
	
	//
	// update the quad directly. Don't add the sprite to the scene graph
	//
	
	[sprite setBatchNode:self];
	[sprite setAtlasIndex:index];
	
	ccV3F_C4B_T2F_Quad quad = [sprite quad];
<<<<<<< HEAD
	[textureAtlas_ insertQuad:&quad atIndex:index];
	
	// XXX: updateTransform will update the textureAtlas too using updateQuad.
=======
	[_textureAtlas insertQuad:&quad atIndex:index];
	
	// XXX: updateTransform will update the textureAtlas too, using updateQuad.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	// XXX: so, it should be AFTER the insertQuad
	[sprite setDirty:YES];
	[sprite updateTransform];
}

<<<<<<< HEAD
=======
-(void) updateQuadFromSprite:(CCSprite*)sprite quadIndex:(NSUInteger)index
{
	NSAssert( sprite != nil, @"Argument must be non-nil");
	NSAssert( [sprite isKindOfClass:[CCSprite class]], @"CCSpriteBatchNode only supports CCSprites as children");

	// make needed room
	while(index >= _textureAtlas.capacity || _textureAtlas.capacity == _textureAtlas.totalQuads )
		[self increaseAtlasCapacity];

	//
	// update the quad directly. Don't add the sprite to the scene graph
	//	
	[sprite setBatchNode:self];
	[sprite setAtlasIndex:index];

	[sprite setDirty:YES];
	
	// UpdateTransform updates the textureAtlas quad
	[sprite updateTransform];
}


>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(id) addSpriteWithoutQuad:(CCSprite*)child z:(NSUInteger)z tag:(NSInteger)aTag
{
	NSAssert( child != nil, @"Argument must be non-nil");
	NSAssert( [child isKindOfClass:[CCSprite class]], @"CCSpriteBatchNode only supports CCSprites as children");
	
	// quad index is Z
	[child setAtlasIndex:z];
	
	// XXX: optimize with a binary search
	int i=0;
<<<<<<< HEAD
	for( CCSprite *c in descendants_ ) {
=======
	for( CCSprite *c in _descendants ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		if( c.atlasIndex >= z )
			break;
		i++;
	}
<<<<<<< HEAD
	[descendants_ insertObject:child atIndex:i];
=======
	[_descendants insertObject:child atIndex:i];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	
	
	// IMPORTANT: Call super, and not self. Avoid adding it to the texture atlas array
	[super addChild:child z:z tag:aTag];
	
	//#issue 1262 don't use lazy sorting, tiles are added as quads not as sprites, so sprites need to be added in order
	[self reorderBatch:NO];
	return self;
}
@end

