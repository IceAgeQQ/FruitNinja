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

// cocos2d
#import "CCTextureAtlas.h"
#import "ccMacros.h"
#import "CCTexture2D.h"
#import "CCTextureCache.h"
#import "CCGLProgram.h"
#import "ccGLStateCache.h"
<<<<<<< HEAD
=======
#import "CCDirector.h"
#import "CCConfiguration.h"

#import "Support/NSThread+performBlock.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#import "Support/OpenGL_Internal.h"

@interface CCTextureAtlas ()
-(void) setupIndices;
-(void) mapBuffers;

<<<<<<< HEAD


=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#if CC_TEXTURE_ATLAS_USE_VAO
-(void) setupVBOandVAO;
#else
-(void) setupVBO;
#endif
@end

//According to some tests GL_TRIANGLE_STRIP is slower, MUCH slower. Probably I'm doing something very wrong

@implementation CCTextureAtlas

<<<<<<< HEAD
@synthesize totalQuads = totalQuads_, capacity = capacity_;
@synthesize texture = texture_;
@synthesize quads = quads_;
=======
@synthesize totalQuads = _totalQuads, capacity = _capacity;
@synthesize texture = _texture;
@synthesize quads = _quads;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#pragma mark TextureAtlas - alloc & init

+(id) textureAtlasWithFile:(NSString*) file capacity: (NSUInteger) n
{
	return [[[self alloc] initWithFile:file capacity:n] autorelease];
}

+(id) textureAtlasWithTexture:(CCTexture2D *)tex capacity:(NSUInteger)n
{
	return [[[self alloc] initWithTexture:tex capacity:n] autorelease];
}

-(id) initWithFile:(NSString*)file capacity:(NSUInteger)n
{
	// retained in property
	CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:file];
	if( tex )
		return [self initWithTexture:tex capacity:n];

	// else
	{
		CCLOG(@"cocos2d: Could not open file: %@", file);
		[self release];
		return nil;
	}
}

-(id) initWithTexture:(CCTexture2D*)tex capacity:(NSUInteger)n
{
	if( (self=[super init]) ) {

<<<<<<< HEAD
		capacity_ = n;
		totalQuads_ = 0;
=======
		_capacity = n;
		_totalQuads = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		// retained in property
		self.texture = tex;

		// Re-initialization is not allowed
<<<<<<< HEAD
		NSAssert(quads_==nil && indices_==nil, @"CCTextureAtlas re-initialization is not allowed");

		quads_ = calloc( sizeof(quads_[0]) * capacity_, 1 );
		indices_ = calloc( sizeof(indices_[0]) * capacity_ * 6, 1 );

		if( ! ( quads_ && indices_) ) {
			CCLOG(@"cocos2d: CCTextureAtlas: not enough memory");
			if( quads_ )
				free(quads_);
			if( indices_ )
				free(indices_);
=======
		NSAssert(_quads==nil && _indices==nil, @"CCTextureAtlas re-initialization is not allowed");

		_quads = calloc( sizeof(_quads[0]) * _capacity, 1 );
		_indices = calloc( sizeof(_indices[0]) * _capacity * 6, 1 );

		if( ! ( _quads && _indices) ) {
			CCLOG(@"cocos2d: CCTextureAtlas: not enough memory");
			if( _quads )
				free(_quads);
			if( _indices )
				free(_indices);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

			[self release];
			return nil;
		}

		[self setupIndices];

#if CC_TEXTURE_ATLAS_USE_VAO
		[self setupVBOandVAO];	
#else	
		[self setupVBO];
#endif

<<<<<<< HEAD
		dirty_ = YES;
=======
		_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(NSString*) description
{
<<<<<<< HEAD
	return [NSString stringWithFormat:@"<%@ = %08X | totalQuads =  %i>", [self class], self, totalQuads_];
=======
	return [NSString stringWithFormat:@"<%@ = %p | totalQuads =  %lu>", [self class], self, (unsigned long)_totalQuads];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) dealloc
{
	CCLOGINFO(@"cocos2d: deallocing %@",self);

<<<<<<< HEAD
	free(quads_);
	free(indices_);

	glDeleteBuffers(2, buffersVBO_);

#if CC_TEXTURE_ATLAS_USE_VAO
	glDeleteVertexArrays(1, &VAOname_);
#endif

	[texture_ release];
=======
	free(_quads);
	free(_indices);

	glDeleteBuffers(2, _buffersVBO);

#if CC_TEXTURE_ATLAS_USE_VAO
	glDeleteVertexArrays(1, &_VAOname);
#endif

	[_texture release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

-(void) setupIndices
{
<<<<<<< HEAD
	for( NSUInteger i = 0; i < capacity_;i++)
    {
#if CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
		indices_[i*6+0] = i*4+0;
		indices_[i*6+1] = i*4+0;
		indices_[i*6+2] = i*4+2;
		indices_[i*6+3] = i*4+1;
		indices_[i*6+4] = i*4+3;
		indices_[i*6+5] = i*4+3;
#else
		indices_[i*6+0] = i*4+0;
		indices_[i*6+1] = i*4+1;
		indices_[i*6+2] = i*4+2;
		
		// inverted index. issue #179
		indices_[i*6+3] = i*4+3;
		indices_[i*6+4] = i*4+2;
		indices_[i*6+5] = i*4+1;
=======
	for( NSUInteger i = 0; i < _capacity;i++)
    {
#if CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
		_indices[i*6+0] = i*4+0;
		_indices[i*6+1] = i*4+0;
		_indices[i*6+2] = i*4+2;
		_indices[i*6+3] = i*4+1;
		_indices[i*6+4] = i*4+3;
		_indices[i*6+5] = i*4+3;
#else
		_indices[i*6+0] = i*4+0;
		_indices[i*6+1] = i*4+1;
		_indices[i*6+2] = i*4+2;
		
		// inverted index. issue #179
		_indices[i*6+3] = i*4+3;
		_indices[i*6+4] = i*4+2;
		_indices[i*6+5] = i*4+1;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif
	}
}

#pragma mark TextureAtlas - VAO / VBO specific

#if CC_TEXTURE_ATLAS_USE_VAO
-(void) setupVBOandVAO
{
<<<<<<< HEAD
	glGenVertexArrays(1, &VAOname_);
	glBindVertexArray(VAOname_);

#define kQuadSize sizeof(quads_[0].bl)

	glGenBuffers(2, &buffersVBO_[0]);

	glBindBuffer(GL_ARRAY_BUFFER, buffersVBO_[0]);
	glBufferData(GL_ARRAY_BUFFER, sizeof(quads_[0]) * capacity_, quads_, GL_DYNAMIC_DRAW);

	// vertices
	glEnableVertexAttribArray(kCCVertexAttrib_Position);
	glVertexAttribPointer(kCCVertexAttrib_Position, 3, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, vertices));

	// colors
	glEnableVertexAttribArray(kCCVertexAttrib_Color);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, colors));

	// tex coords
	glEnableVertexAttribArray(kCCVertexAttrib_TexCoords);
	glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, texCoords));

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffersVBO_[1]);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices_[0]) * capacity_ * 6, indices_, GL_STATIC_DRAW);

	glBindVertexArray(0);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
	glBindBuffer(GL_ARRAY_BUFFER, 0);

	CHECK_GL_ERROR_DEBUG();
=======
	// VAO requires GL_APPLE_vertex_array_object in order to be created on a different thread
	// https://devforums.apple.com/thread/145566?tstart=0

	void (^createVAO)(void) = ^{
		glGenVertexArrays(1, &_VAOname);
		ccGLBindVAO(_VAOname);

	#define kQuadSize sizeof(_quads[0].bl)

		glGenBuffers(2, &_buffersVBO[0]);

		glBindBuffer(GL_ARRAY_BUFFER, _buffersVBO[0]);
		glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * _capacity, _quads, GL_DYNAMIC_DRAW);

		// vertices
		glEnableVertexAttribArray(kCCVertexAttrib_Position);
		glVertexAttribPointer(kCCVertexAttrib_Position, 3, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, vertices));

		// colors
		glEnableVertexAttribArray(kCCVertexAttrib_Color);
		glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, colors));

		// tex coords
		glEnableVertexAttribArray(kCCVertexAttrib_TexCoords);
		glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, texCoords));

		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _buffersVBO[1]);
		glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(_indices[0]) * _capacity * 6, _indices, GL_STATIC_DRAW);

		// Must unbind the VAO before changing the element buffer.
		ccGLBindVAO(0);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
		glBindBuffer(GL_ARRAY_BUFFER, 0);

		CHECK_GL_ERROR_DEBUG();
	};
	
	NSThread *cocos2dThread = [[CCDirector sharedDirector] runningThread];
	if( cocos2dThread == [NSThread currentThread] || [[CCConfiguration sharedConfiguration] supportsShareableVAO] )
		createVAO();
	else 
		[cocos2dThread performBlock:createVAO waitUntilDone:YES];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
#else // CC_TEXTURE_ATLAS_USE_VAO
-(void) setupVBO
{
<<<<<<< HEAD
	glGenBuffers(2, &buffersVBO_[0]);
=======
	glGenBuffers(2, &_buffersVBO[0]);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	
	[self mapBuffers];
}
#endif // ! // CC_TEXTURE_ATLAS_USE_VAO


-(void) mapBuffers
{
<<<<<<< HEAD
	glBindBuffer(GL_ARRAY_BUFFER, buffersVBO_[0]);
	glBufferData(GL_ARRAY_BUFFER, sizeof(quads_[0]) * capacity_, quads_, GL_DYNAMIC_DRAW);
	glBindBuffer(GL_ARRAY_BUFFER, 0);

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffersVBO_[1]);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices_[0]) * capacity_ * 6, indices_, GL_STATIC_DRAW);
=======
	// Avoid changing the element buffer for whatever VAO might be bound.
	ccGLBindVAO(0);
	
	glBindBuffer(GL_ARRAY_BUFFER, _buffersVBO[0]);
	glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * _capacity, _quads, GL_DYNAMIC_DRAW);
	glBindBuffer(GL_ARRAY_BUFFER, 0);

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _buffersVBO[1]);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(_indices[0]) * _capacity * 6, _indices, GL_STATIC_DRAW);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

	CHECK_GL_ERROR_DEBUG();
}

#pragma mark TextureAtlas - Update, Insert, Move & Remove

-(ccV3F_C4B_T2F_Quad *) quads
{
	//if someone accesses the quads directly, presume that changes will be made
<<<<<<< HEAD
	dirty_ = YES;
	return quads_;
=======
	_dirty = YES;
	return _quads;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) updateQuad:(ccV3F_C4B_T2F_Quad*)quad atIndex:(NSUInteger) n
{
<<<<<<< HEAD
	NSAssert(n < capacity_, @"updateQuadWithTexture: Invalid index");

	totalQuads_ =  MAX( n+1, totalQuads_);

	quads_[n] = *quad;

	dirty_ = YES;
=======
	NSAssert(n < _capacity, @"updateQuadWithTexture: Invalid index");

	_totalQuads =  MAX( n+1, _totalQuads);

	_quads[n] = *quad;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) insertQuad:(ccV3F_C4B_T2F_Quad*)quad atIndex:(NSUInteger)index
{
<<<<<<< HEAD
	NSAssert(index < capacity_, @"insertQuadWithTexture: Invalid index");

	totalQuads_++;
	NSAssert( totalQuads_ <= capacity_, @"invalid totalQuads");

	// issue #575. index can be > totalQuads
	NSInteger remaining = (totalQuads_-1) - index;
=======
	NSAssert(index < _capacity, @"insertQuadWithTexture: Invalid index");

	_totalQuads++;
	NSAssert( _totalQuads <= _capacity, @"invalid totalQuads");

	// issue #575. index can be > totalQuads
	NSInteger remaining = (_totalQuads-1) - index;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// last object doesn't need to be moved
	if( remaining > 0)
		// tex coordinates
<<<<<<< HEAD
		memmove( &quads_[index+1],&quads_[index], sizeof(quads_[0]) * remaining );

	quads_[index] = *quad;

	dirty_ = YES;
=======
		memmove( &_quads[index+1],&_quads[index], sizeof(_quads[0]) * remaining );

	_quads[index] = *quad;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) insertQuads:(ccV3F_C4B_T2F_Quad*)quads atIndex:(NSUInteger)index amount:(NSUInteger) amount
{
<<<<<<< HEAD
	NSAssert(index + amount <= capacity_, @"insertQuadWithTexture: Invalid index + amount");

	totalQuads_+= amount;

	NSAssert( totalQuads_ <= capacity_, @"invalid totalQuads");

	// issue #575. index can be > totalQuads
	NSInteger remaining = (totalQuads_-1) - index - amount;
=======
	NSAssert(index + amount <= _capacity, @"insertQuadWithTexture: Invalid index + amount");

	_totalQuads+= amount;

	NSAssert( _totalQuads <= _capacity, @"invalid totalQuads");

	// issue #575. index can be > totalQuads
	NSInteger remaining = (_totalQuads-1) - index - amount;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// last object doesn't need to be moved
	if( remaining > 0)
		// tex coordinates
<<<<<<< HEAD
		memmove( &quads_[index+amount],&quads_[index], sizeof(quads_[0]) * remaining );
=======
		memmove( &_quads[index+amount],&_quads[index], sizeof(_quads[0]) * remaining );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c



	NSUInteger max = index + amount;
	NSUInteger j = 0;
	for (NSUInteger i = index; i < max ; i++)
	{
<<<<<<< HEAD
		quads_[index] = quads[j];
=======
		_quads[index] = quads[j];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		index++;
		j++;
	}

<<<<<<< HEAD
	dirty_ = YES;
=======
	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) insertQuadFromIndex:(NSUInteger)oldIndex atIndex:(NSUInteger)newIndex
{
<<<<<<< HEAD
	NSAssert(newIndex < totalQuads_, @"insertQuadFromIndex:atIndex: Invalid index");
	NSAssert(oldIndex < totalQuads_, @"insertQuadFromIndex:atIndex: Invalid index");
=======
	NSAssert(newIndex < _totalQuads, @"insertQuadFromIndex:atIndex: Invalid index");
	NSAssert(oldIndex < _totalQuads, @"insertQuadFromIndex:atIndex: Invalid index");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if( oldIndex == newIndex )
		return;

	NSUInteger howMany = labs( oldIndex - newIndex);
	NSUInteger dst = oldIndex;
	NSUInteger src = oldIndex + 1;
	if( oldIndex > newIndex) {
		dst = newIndex+1;
		src = newIndex;
	}

	// tex coordinates
<<<<<<< HEAD
	ccV3F_C4B_T2F_Quad quadsBackup = quads_[oldIndex];
	memmove( &quads_[dst],&quads_[src], sizeof(quads_[0]) * howMany );
	quads_[newIndex] = quadsBackup;

	dirty_ = YES;
=======
	ccV3F_C4B_T2F_Quad quadsBackup = _quads[oldIndex];
	memmove( &_quads[dst],&_quads[src], sizeof(_quads[0]) * howMany );
	_quads[newIndex] = quadsBackup;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) moveQuadsFromIndex:(NSUInteger)oldIndex amount:(NSUInteger) amount atIndex:(NSUInteger)newIndex
{
<<<<<<< HEAD
	NSAssert(newIndex + amount <= totalQuads_, @"insertQuadFromIndex:atIndex: Invalid index");
	NSAssert(oldIndex < totalQuads_, @"insertQuadFromIndex:atIndex: Invalid index");
=======
	NSAssert(newIndex + amount <= _totalQuads, @"insertQuadFromIndex:atIndex: Invalid index");
	NSAssert(oldIndex < _totalQuads, @"insertQuadFromIndex:atIndex: Invalid index");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if( oldIndex == newIndex )
		return;

	//create buffer
	size_t quadSize = sizeof(ccV3F_C4B_T2F_Quad);
	ccV3F_C4B_T2F_Quad *tempQuads = malloc( quadSize * amount);
<<<<<<< HEAD
	memcpy( tempQuads, &quads_[oldIndex], quadSize * amount );
=======
	memcpy( tempQuads, &_quads[oldIndex], quadSize * amount );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if (newIndex < oldIndex)
	{
		// move quads from newIndex to newIndex + amount to make room for buffer
<<<<<<< HEAD
		memmove( &quads_[newIndex], &quads_[newIndex+amount], (oldIndex-newIndex)*quadSize);
=======
		memmove( &_quads[newIndex], &_quads[newIndex+amount], (oldIndex-newIndex)*quadSize);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	else
	{
		// move quads above back
<<<<<<< HEAD
		memmove( &quads_[oldIndex], &quads_[oldIndex+amount], (newIndex-oldIndex)*quadSize);
	}
	memcpy( &quads_[newIndex], tempQuads, amount*quadSize);

	free(tempQuads);

	dirty_ = YES;
=======
		memmove( &_quads[oldIndex], &_quads[oldIndex+amount], (newIndex-oldIndex)*quadSize);
	}
	memcpy( &_quads[newIndex], tempQuads, amount*quadSize);

	free(tempQuads);

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) removeQuadAtIndex:(NSUInteger) index
{
<<<<<<< HEAD
	NSAssert(index < totalQuads_, @"removeQuadAtIndex: Invalid index");

	NSUInteger remaining = (totalQuads_-1) - index;

	// last object doesn't need to be moved
	if( remaining )
		memmove( &quads_[index],&quads_[index+1], sizeof(quads_[0]) * remaining );

	totalQuads_--;

	dirty_ = YES;
=======
	NSAssert(index < _totalQuads, @"removeQuadAtIndex: Invalid index");

	NSUInteger remaining = (_totalQuads-1) - index;

	// last object doesn't need to be moved
	if( remaining )
		memmove( &_quads[index],&_quads[index+1], sizeof(_quads[0]) * remaining );

	_totalQuads--;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) removeQuadsAtIndex:(NSUInteger) index amount:(NSUInteger) amount
{
<<<<<<< HEAD
	NSAssert(index + amount <= totalQuads_, @"removeQuadAtIndex: index + amount out of bounds");

	NSUInteger remaining = (totalQuads_) - (index + amount);

	totalQuads_ -= amount;

	if ( remaining )
		memmove( &quads_[index], &quads_[index+amount], sizeof(quads_[0]) * remaining );

	dirty_ = YES;
=======
	NSAssert(index + amount <= _totalQuads, @"removeQuadAtIndex: index + amount out of bounds");

	NSUInteger remaining = (_totalQuads) - (index + amount);

	_totalQuads -= amount;

	if ( remaining )
		memmove( &_quads[index], &_quads[index+amount], sizeof(_quads[0]) * remaining );

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) removeAllQuads
{
<<<<<<< HEAD
	totalQuads_ = 0;
=======
	_totalQuads = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark TextureAtlas - Resize

-(BOOL) resizeCapacity: (NSUInteger) newCapacity
{
<<<<<<< HEAD
	if( newCapacity == capacity_ )
		return YES;

	// update capacity and totolQuads
	totalQuads_ = MIN(totalQuads_,newCapacity);
	capacity_ = newCapacity;

	void * tmpQuads = realloc( quads_, sizeof(quads_[0]) * capacity_ );
	void * tmpIndices = realloc( indices_, sizeof(indices_[0]) * capacity_ * 6 );
=======
	if( newCapacity == _capacity )
		return YES;

	// update capacity and totolQuads
	_totalQuads = MIN(_totalQuads,newCapacity);
	_capacity = newCapacity;

	void * tmpQuads = realloc( _quads, sizeof(_quads[0]) * _capacity );
	void * tmpIndices = realloc( _indices, sizeof(_indices[0]) * _capacity * 6 );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if( ! ( tmpQuads && tmpIndices) ) {
		CCLOG(@"cocos2d: CCTextureAtlas: not enough memory");
		if( tmpQuads )
			free(tmpQuads);
		else
<<<<<<< HEAD
			free(quads_);
=======
			free(_quads);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		if( tmpIndices )
			free(tmpIndices);
		else
<<<<<<< HEAD
			free(indices_);

		indices_ = nil;
		quads_ = nil;
		capacity_ = totalQuads_ = 0;
		return NO;
	}

	quads_ = tmpQuads;
	indices_ = tmpIndices;
=======
			free(_indices);

		_indices = nil;
		_quads = nil;
		_capacity = _totalQuads = 0;
		return NO;
	}

	_quads = tmpQuads;
	_indices = tmpIndices;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	// Update Indices
	[self setupIndices];
	[self mapBuffers];

<<<<<<< HEAD
	dirty_ = YES;
=======
	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	return YES;
}

#pragma mark TextureAtlas - CCParticleBatchNode Specific

-(void) fillWithEmptyQuadsFromIndex:(NSUInteger) index amount:(NSUInteger) amount
{
	ccV3F_C4B_T2F_Quad quad;
	bzero( &quad, sizeof(quad) );

	NSUInteger to = index + amount;
	for (NSInteger i = index ; i < to ; i++)
	{
<<<<<<< HEAD
		quads_[i] = quad;
=======
		_quads[i] = quad;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

}
-(void) increaseTotalQuadsWith:(NSUInteger) amount
{
<<<<<<< HEAD
	totalQuads_ += amount;
=======
	_totalQuads += amount;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) moveQuadsFromIndex:(NSUInteger) index to:(NSUInteger) newIndex
{
<<<<<<< HEAD
	NSAssert(newIndex + (totalQuads_ - index) <= capacity_, @"moveQuadsFromIndex move is out of bounds");

	memmove(quads_ + newIndex,quads_ + index, (totalQuads_ - index) * sizeof(quads_[0]));
=======
	NSAssert(newIndex + (_totalQuads - index) <= _capacity, @"moveQuadsFromIndex move is out of bounds");

	memmove(_quads + newIndex,_quads + index, (_totalQuads - index) * sizeof(_quads[0]));
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark TextureAtlas - Drawing

-(void) drawQuads
{
<<<<<<< HEAD
	[self drawNumberOfQuads: totalQuads_ fromIndex:0];
=======
	[self drawNumberOfQuads: _totalQuads fromIndex:0];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) drawNumberOfQuads: (NSUInteger) n
{
	[self drawNumberOfQuads:n fromIndex:0];
}

-(void) drawNumberOfQuads: (NSUInteger) n fromIndex: (NSUInteger) start
{
<<<<<<< HEAD
	ccGLBindTexture2D( [texture_ name] );
=======
	ccGLBindTexture2D( [_texture name] );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#if CC_TEXTURE_ATLAS_USE_VAO

	//
	// Using VBO and VAO
	//
<<<<<<< HEAD

	// XXX: update is done in draw... perhaps it should be done in a timer
	if (dirty_) {
		glBindBuffer(GL_ARRAY_BUFFER, buffersVBO_[0]);
		glBufferSubData(GL_ARRAY_BUFFER, sizeof(quads_[0])*start, sizeof(quads_[0]) * n , &quads_[start] );
		glBindBuffer(GL_ARRAY_BUFFER, 0);

		dirty_ = NO;
	}

	glBindVertexArray( VAOname_ );

#if CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
	glDrawElements(GL_TRIANGLE_STRIP, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(indices_[0])) );
#else
	glDrawElements(GL_TRIANGLES, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(indices_[0])) );
#endif // CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP

	glBindVertexArray(0);
=======
	// XXX: update is done in draw... perhaps it should be done in a timer
	if (_dirty) {
		glBindBuffer(GL_ARRAY_BUFFER, _buffersVBO[0]);
		// option 1: subdata
//		glBufferSubData(GL_ARRAY_BUFFER, sizeof(_quads[0])*start, sizeof(_quads[0]) * n , &_quads[start] );
		
		// option 2: data
//		glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * (n-start), &_quads[start], GL_DYNAMIC_DRAW);
		
		// option 3: orphaning + glMapBuffer
		glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * (n-start), nil, GL_DYNAMIC_DRAW);
		void *buf = glMapBuffer(GL_ARRAY_BUFFER, GL_WRITE_ONLY);
		memcpy(buf, _quads, sizeof(_quads[0])* (n-start));
		glUnmapBuffer(GL_ARRAY_BUFFER);		
		
		glBindBuffer(GL_ARRAY_BUFFER, 0);

		_dirty = NO;
	}

	ccGLBindVAO( _VAOname );

#if CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
	glDrawElements(GL_TRIANGLE_STRIP, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(_indices[0])) );
#else
	glDrawElements(GL_TRIANGLES, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(_indices[0])) );
#endif // CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
	
//	glBindVertexArray(0);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	

#else // ! CC_TEXTURE_ATLAS_USE_VAO
	
	//
	// Using VBO without VAO
	//

<<<<<<< HEAD
#define kQuadSize sizeof(quads_[0].bl)
	glBindBuffer(GL_ARRAY_BUFFER, buffersVBO_[0]);
    
	// XXX: update is done in draw... perhaps it should be done in a timer
	if (dirty_) {
		glBufferSubData(GL_ARRAY_BUFFER, sizeof(quads_[0])*start, sizeof(quads_[0]) * n , &quads_[start] );
		dirty_ = NO;
=======
#define kQuadSize sizeof(_quads[0].bl)
	glBindBuffer(GL_ARRAY_BUFFER, _buffersVBO[0]);
    
	// XXX: update is done in draw... perhaps it should be done in a timer
	if (_dirty) {
//		glBufferSubData(GL_ARRAY_BUFFER, sizeof(_quads[0])*start, sizeof(_quads[0]) * n , &_quads[start] );

		// Apparently this is faster... need to do performance tests
		glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * n, _quads, GL_DYNAMIC_DRAW);
		_dirty = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	ccGLEnableVertexAttribs( kCCVertexAttribFlag_PosColorTex );

	// vertices
	glVertexAttribPointer(kCCVertexAttrib_Position, 3, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, vertices));
	
	// colors
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, colors));
	
	// tex coords
	glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, texCoords));

	glBindBuffer(GL_ARRAY_BUFFER, 0);

<<<<<<< HEAD
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffersVBO_[1]);

#if CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
	glDrawElements(GL_TRIANGLE_STRIP, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(indices_[0])) );
#else
	glDrawElements(GL_TRIANGLES, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(indices_[0])) );
=======
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _buffersVBO[1]);

#if CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP
	glDrawElements(GL_TRIANGLE_STRIP, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(_indices[0])) );
#else
	glDrawElements(GL_TRIANGLES, (GLsizei) n*6, GL_UNSIGNED_SHORT, (GLvoid*) (start*6*sizeof(_indices[0])) );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#endif // CC_TEXTURE_ATLAS_USE_TRIANGLE_STRIP

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

#endif // CC_TEXTURE_ATLAS_USE_VAO

	CC_INCREMENT_GL_DRAWS(1);

	CHECK_GL_ERROR_DEBUG();
}
@end
