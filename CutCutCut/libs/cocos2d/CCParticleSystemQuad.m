/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009 Leonardo Kasperavičius
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


// opengl
#import "Platforms/CCGL.h"

// cocos2d
#import "ccConfig.h"
#import "CCParticleSystemQuad.h"
#import "CCParticleBatchNode.h"
#import "CCTextureAtlas.h"
#import "CCTextureCache.h"
#import "ccMacros.h"
#import "CCSpriteFrame.h"
#import "CCDirector.h"
#import "CCShaderCache.h"
#import "ccGLStateCache.h"
#import "CCGLProgram.h"
<<<<<<< HEAD
=======
#import "CCConfiguration.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

// support
#import "Support/OpenGL_Internal.h"
#import "Support/CGPointExtension.h"
#import "Support/TransformUtils.h"
<<<<<<< HEAD
=======
#import "Support/NSThread+performBlock.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

// extern
#import "kazmath/GL/matrix.h"

@interface CCParticleSystemQuad ()
-(void) initVAO;
-(BOOL) allocMemory;
@end

@implementation CCParticleSystemQuad

// overriding the init method
-(id) initWithTotalParticles:(NSUInteger) numberOfParticles
{
	// base initialization
	if( (self=[super initWithTotalParticles:numberOfParticles]) ) {

		// allocating data space
		if( ! [self allocMemory] ) {
			[self release];
			return nil;
		}

		// Don't initialize the texCoords yet since there are not textures
<<<<<<< HEAD
//		[self initTexCoordsWithRect:CGRectMake(0, 0, [texture_ pixelsWide], [texture_ pixelsHigh])];
=======
//		[self initTexCoordsWithRect:CGRectMake(0, 0, [_texture pixelsWide], [_texture pixelsHigh])];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[self initIndices];
		[self initVAO];

		self.shaderProgram = [[CCShaderCache sharedShaderCache] programForKey:kCCShader_PositionTextureColor];
	}

	return self;
}

-(BOOL) allocMemory
{
<<<<<<< HEAD
	NSAssert( ( !quads_ && !indices_), @"Memory already alloced");
	NSAssert( !batchNode_, @"Memory should not be alloced when not using batchNode");

	quads_ = calloc( sizeof(quads_[0]) * totalParticles, 1 );
	indices_ = calloc( sizeof(indices_[0]) * totalParticles * 6, 1 );

	if( !quads_ || !indices_) {
		CCLOG(@"cocos2d: Particle system: not enough memory");
		if( quads_ )
			free( quads_ );
		if(indices_)
			free(indices_);
=======
	NSAssert( ( !_quads && !_indices), @"Memory already alloced");
	NSAssert( !_batchNode, @"Memory should not be alloced when not using batchNode");

	_quads = calloc( sizeof(_quads[0]) * _totalParticles, 1 );
	_indices = calloc( sizeof(_indices[0]) * _totalParticles * 6, 1 );

	if( !_quads || !_indices) {
		CCLOG(@"cocos2d: Particle system: not enough memory");
		if( _quads )
			free( _quads );
		if(_indices)
			free(_indices);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		return NO;
	}

	return YES;
}

- (void) setTotalParticles:(NSUInteger)tp
{
    // If we are setting the total numer of particles to a number higher
    // than what is allocated, we need to allocate new arrays
<<<<<<< HEAD
    if( tp > allocatedParticles )
    {
        // Allocate new memory
        size_t particlesSize = tp * sizeof(tCCParticle);
        size_t quadsSize = sizeof(quads_[0]) * tp * 1;
        size_t indicesSize = sizeof(indices_[0]) * tp * 6 * 1;
        
        tCCParticle* particlesNew = realloc(particles, particlesSize);
        ccV3F_C4B_T2F_Quad *quadsNew = realloc(quads_, quadsSize);
        GLushort* indicesNew = realloc(indices_, indicesSize);
=======
    if( tp > _allocatedParticles )
    {
        // Allocate new memory
        size_t particlesSize = tp * sizeof(tCCParticle);
        size_t quadsSize = sizeof(_quads[0]) * tp * 1;
        size_t indicesSize = sizeof(_indices[0]) * tp * 6 * 1;
        
        tCCParticle* particlesNew = realloc(_particles, particlesSize);
        ccV3F_C4B_T2F_Quad *quadsNew = realloc(_quads, quadsSize);
        GLushort* indicesNew = realloc(_indices, indicesSize);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        
        if (particlesNew && quadsNew && indicesNew)
        {
            // Assign pointers
<<<<<<< HEAD
            particles = particlesNew;
            quads_ = quadsNew;
            indices_ = indicesNew;
            
            // Clear the memory
            memset(particles, 0, particlesSize);
            memset(quads_, 0, quadsSize);
            memset(indices_, 0, indicesSize);
            
            allocatedParticles = tp;
=======
            _particles = particlesNew;
            _quads = quadsNew;
            _indices = indicesNew;
            
            // Clear the memory
			// XXX: Bug? If the quads are cleared, then drawing doesn't work... WHY??? XXX
//            memset(_quads, 0, quadsSize);
            memset(_particles, 0, particlesSize);
            memset(_indices, 0, indicesSize);
            
            _allocatedParticles = tp;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        }
        else
        {
            // Out of memory, failed to resize some array
<<<<<<< HEAD
            if (particlesNew) particles = particlesNew;
            if (quadsNew) quads_ = quadsNew;
            if (indicesNew) indices_ = indicesNew;
=======
            if (particlesNew) _particles = particlesNew;
            if (quadsNew) _quads = quadsNew;
            if (indicesNew) _indices = indicesNew;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
            
            CCLOG(@"Particle system: out of memory");
            return;
        }
        
<<<<<<< HEAD
        totalParticles = tp;
        
        // Init particles
        if (batchNode_)
		{
			for (int i = 0; i < totalParticles; i++)
			{
				particles[i].atlasIndex=i;
=======
        _totalParticles = tp;
        
        // Init particles
        if (_batchNode)
		{
			for (int i = 0; i < _totalParticles; i++)
			{
				_particles[i].atlasIndex=i;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			}
		}
        
        [self initIndices];
<<<<<<< HEAD
=======
		
		// clean VAO
		glDeleteBuffers(2, &_buffersVBO[0]);
		glDeleteVertexArrays(1, &_VAOname);

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        [self initVAO];
    }
    else
    {
<<<<<<< HEAD
        totalParticles = tp;
    }
=======
        _totalParticles = tp;
    }

	[self resetSystem];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) initVAO
{
<<<<<<< HEAD
	glGenVertexArrays(1, &VAOname_);
	glBindVertexArray(VAOname_);

#define kQuadSize sizeof(quads_[0].bl)

	glGenBuffers(2, &buffersVBO_[0]);

	glBindBuffer(GL_ARRAY_BUFFER, buffersVBO_[0]);
	glBufferData(GL_ARRAY_BUFFER, sizeof(quads_[0]) * totalParticles, quads_, GL_DYNAMIC_DRAW);

	// vertices
	glEnableVertexAttribArray(kCCVertexAttrib_Position);
	glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, vertices));

	// colors
	glEnableVertexAttribArray(kCCVertexAttrib_Color);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, colors));

	// tex coords
	glEnableVertexAttribArray(kCCVertexAttrib_TexCoords);
	glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, texCoords));

	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffersVBO_[1]);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices_[0]) * totalParticles * 6, indices_, GL_STATIC_DRAW);

	glBindVertexArray(0);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
	glBindBuffer(GL_ARRAY_BUFFER, 0);

	CHECK_GL_ERROR_DEBUG();
=======
	// VAO requires GL_APPLE_vertex_array_object in order to be created on a different thread
	// https://devforums.apple.com/thread/145566?tstart=0
	
	void (^createVAO)(void) = ^ {
		glGenVertexArrays(1, &_VAOname);
		ccGLBindVAO(_VAOname);

	#define kQuadSize sizeof(_quads[0].bl)

		glGenBuffers(2, &_buffersVBO[0]);

		glBindBuffer(GL_ARRAY_BUFFER, _buffersVBO[0]);
		glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * _totalParticles, _quads, GL_DYNAMIC_DRAW);

		// vertices
		glEnableVertexAttribArray(kCCVertexAttrib_Position);
		glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, vertices));

		// colors
		glEnableVertexAttribArray(kCCVertexAttrib_Color);
		glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, colors));

		// tex coords
		glEnableVertexAttribArray(kCCVertexAttrib_TexCoords);
		glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, kQuadSize, (GLvoid*) offsetof( ccV3F_C4B_T2F, texCoords));

		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _buffersVBO[1]);
		glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(_indices[0]) * _totalParticles * 6, _indices, GL_STATIC_DRAW);

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

-(void) dealloc
{
<<<<<<< HEAD
	if( ! batchNode_ ) {
		free(quads_);
		free(indices_);

		glDeleteBuffers(2, &buffersVBO_[0]);
		glDeleteVertexArrays(1, &VAOname_);
=======
	if( ! _batchNode ) {
		free(_quads);
		free(_indices);

		glDeleteBuffers(2, &_buffersVBO[0]);
		glDeleteVertexArrays(1, &_VAOname);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	[super dealloc];
}

// pointRect is in Points coordinates.
-(void) initTexCoordsWithRect:(CGRect)pointRect
{
    // convert to Tex coords

	CGRect rect = CGRectMake(
							 pointRect.origin.x * CC_CONTENT_SCALE_FACTOR(),
							 pointRect.origin.y * CC_CONTENT_SCALE_FACTOR(),
							 pointRect.size.width * CC_CONTENT_SCALE_FACTOR(),
							 pointRect.size.height * CC_CONTENT_SCALE_FACTOR() );

<<<<<<< HEAD
	GLfloat wide = [texture_ pixelsWide];
	GLfloat high = [texture_ pixelsHigh];
=======
	GLfloat wide = [_texture pixelsWide];
	GLfloat high = [_texture pixelsHigh];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#if CC_FIX_ARTIFACTS_BY_STRECHING_TEXEL
	GLfloat left = (rect.origin.x*2+1) / (wide*2);
	GLfloat bottom = (rect.origin.y*2+1) / (high*2);
	GLfloat right = left + (rect.size.width*2-2) / (wide*2);
	GLfloat top = bottom + (rect.size.height*2-2) / (high*2);
#else
	GLfloat left = rect.origin.x / wide;
	GLfloat bottom = rect.origin.y / high;
	GLfloat right = left + rect.size.width / wide;
	GLfloat top = bottom + rect.size.height / high;
#endif // ! CC_FIX_ARTIFACTS_BY_STRECHING_TEXEL

	// Important. Texture in cocos2d are inverted, so the Y component should be inverted
<<<<<<< HEAD
//<<<<<<< HEAD
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	CC_SWAP( top, bottom);

	ccV3F_C4B_T2F_Quad *quads;
	NSUInteger start, end;
<<<<<<< HEAD
	if (batchNode_)
	{
		quads = [[batchNode_ textureAtlas] quads];
		start = atlasIndex_;
		end = atlasIndex_ + totalParticles;
	}
	else
	{
		quads = quads_;
		start = 0;
		end = totalParticles;
=======
	if (_batchNode)
	{
		quads = [[_batchNode textureAtlas] quads];
		start = _atlasIndex;
		end = _atlasIndex + _totalParticles;
	}
	else
	{
		quads = _quads;
		start = 0;
		end = _totalParticles;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	for(NSUInteger i=start; i<end; i++) {

		// bottom-left vertex:
		quads[i].bl.texCoords.u = left;
		quads[i].bl.texCoords.v = bottom;
		// bottom-right vertex:
		quads[i].br.texCoords.u = right;
		quads[i].br.texCoords.v = bottom;
		// top-left vertex:
		quads[i].tl.texCoords.u = left;
		quads[i].tl.texCoords.v = top;
		// top-right vertex:
		quads[i].tr.texCoords.u = right;
		quads[i].tr.texCoords.v = top;
<<<<<<< HEAD
//=======
//		CC_SWAP( top, bottom);
//		
//		ccV3F_C4B_T2F_Quad *quadCollection; 
//		NSUInteger start, end; 
//		if (useBatchNode_)
//		{
//			quadCollection = [[batchNode_ textureAtlas] quads]; 
//			start = atlasIndex_; 
//			end = atlasIndex_ + totalParticles; 
//		}
//		else 
//		{
//			quadCollection = quads_; 
//			start = 0; 
//			end = totalParticles; 
//		}
//		
//		ccV3F_C4B_T2F_Quad quad;
//		bzero( &quad, sizeof(quad) );
//
//		for(NSInteger i=start; i<end; i++) {
//			// bottom-left vertex:
//			quad.bl.texCoords.u = left;
//			quad.bl.texCoords.v = bottom;
//			// bottom-right vertex:
//			quad.br.texCoords.u = right;
//			quad.br.texCoords.v = bottom;
//			// top-left vertex:
//			quad.tl.texCoords.u = left;
//			quad.tl.texCoords.v = top;
//			// top-right vertex:
//			quad.tr.texCoords.u = right;
//			quad.tr.texCoords.v = top;
//			
//			quad.bl.texCoords.u = left;
//			quad.bl.texCoords.v = bottom;
//			
//			quadCollection[i] = quad;
//		
//		}
//>>>>>>> develop
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) setTexture:(CCTexture2D *)texture withRect:(CGRect)rect
{
	// Only update the texture if is different from the current one
<<<<<<< HEAD
	if( [texture name] != [texture_ name] )
=======
	if( [texture name] != [_texture name] )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[super setTexture:texture];

	[self initTexCoordsWithRect:rect];
}

-(void) setTexture:(CCTexture2D *)texture
{
	CGSize s = [texture contentSize];
	[self setTexture:texture withRect:CGRectMake(0,0, s.width, s.height)];
}

-(void) setDisplayFrame:(CCSpriteFrame *)spriteFrame
{

	NSAssert( CGPointEqualToPoint( spriteFrame.offsetInPixels , CGPointZero ), @"QuadParticle only supports SpriteFrames with no offsets");
<<<<<<< HEAD

	// update texture before updating texture rect
	if ( spriteFrame.texture.name != texture_.name )
=======
    
	// update texture before updating texture rect
	if ( spriteFrame.texture.name != _texture.name )
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self setTexture: spriteFrame.texture];
}

-(void) initIndices
{
<<<<<<< HEAD
	for( NSUInteger i = 0; i < totalParticles; i++) {
		const NSUInteger i6 = i*6;
		const NSUInteger i4 = i*4;
		indices_[i6+0] = (GLushort) i4+0;
		indices_[i6+1] = (GLushort) i4+1;
		indices_[i6+2] = (GLushort) i4+2;

		indices_[i6+5] = (GLushort) i4+1;
		indices_[i6+4] = (GLushort) i4+2;
		indices_[i6+3] = (GLushort) i4+3;
=======
	for( NSUInteger i = 0; i < _totalParticles; i++) {
		const NSUInteger i6 = i*6;
		const NSUInteger i4 = i*4;
		_indices[i6+0] = (GLushort) i4+0;
		_indices[i6+1] = (GLushort) i4+1;
		_indices[i6+2] = (GLushort) i4+2;

		_indices[i6+5] = (GLushort) i4+1;
		_indices[i6+4] = (GLushort) i4+2;
		_indices[i6+3] = (GLushort) i4+3;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) updateQuadWithParticle:(tCCParticle*)p newPosition:(CGPoint)newPos
{
	ccV3F_C4B_T2F_Quad *quad;

<<<<<<< HEAD
	if (batchNode_)
	{
		ccV3F_C4B_T2F_Quad *batchQuads = [[batchNode_ textureAtlas] quads];
		quad = &(batchQuads[atlasIndex_+p->atlasIndex]);
	}
	else
		quad = &(quads_[particleIdx]);

	ccColor4B color = { p->color.r*255, p->color.g*255, p->color.b*255, p->color.a*255};
=======
	if (_batchNode)
	{
		ccV3F_C4B_T2F_Quad *batchQuads = [[_batchNode textureAtlas] quads];
		quad = &(batchQuads[_atlasIndex+p->atlasIndex]);
	}
	else
		quad = &(_quads[_particleIdx]);

	ccColor4B color = (_opacityModifyRGB)
		? (ccColor4B){ p->color.r*p->color.a*255, p->color.g*p->color.a*255, p->color.b*p->color.a*255, p->color.a*255}
		: (ccColor4B){ p->color.r*255, p->color.g*255, p->color.b*255, p->color.a*255};

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	quad->bl.colors = color;
	quad->br.colors = color;
	quad->tl.colors = color;
	quad->tr.colors = color;

	// vertices
	GLfloat size_2 = p->size/2;
	if( p->rotation ) {
		GLfloat x1 = -size_2;
		GLfloat y1 = -size_2;

		GLfloat x2 = size_2;
		GLfloat y2 = size_2;
		GLfloat x = newPos.x;
		GLfloat y = newPos.y;

		GLfloat r = (GLfloat)-CC_DEGREES_TO_RADIANS(p->rotation);
		GLfloat cr = cosf(r);
		GLfloat sr = sinf(r);
		GLfloat ax = x1 * cr - y1 * sr + x;
		GLfloat ay = x1 * sr + y1 * cr + y;
		GLfloat bx = x2 * cr - y1 * sr + x;
		GLfloat by = x2 * sr + y1 * cr + y;
		GLfloat cx = x2 * cr - y2 * sr + x;
		GLfloat cy = x2 * sr + y2 * cr + y;
		GLfloat dx = x1 * cr - y2 * sr + x;
		GLfloat dy = x1 * sr + y2 * cr + y;

		// bottom-left
		quad->bl.vertices.x = ax;
		quad->bl.vertices.y = ay;

		// bottom-right vertex:
		quad->br.vertices.x = bx;
		quad->br.vertices.y = by;

		// top-left vertex:
		quad->tl.vertices.x = dx;
		quad->tl.vertices.y = dy;

		// top-right vertex:
		quad->tr.vertices.x = cx;
		quad->tr.vertices.y = cy;
	} else {
		// bottom-left vertex:
		quad->bl.vertices.x = newPos.x - size_2;
		quad->bl.vertices.y = newPos.y - size_2;

		// bottom-right vertex:
		quad->br.vertices.x = newPos.x + size_2;
		quad->br.vertices.y = newPos.y - size_2;

		// top-left vertex:
		quad->tl.vertices.x = newPos.x - size_2;
		quad->tl.vertices.y = newPos.y + size_2;

		// top-right vertex:
		quad->tr.vertices.x = newPos.x + size_2;
		quad->tr.vertices.y = newPos.y + size_2;
	}
}

-(void) postStep
{
<<<<<<< HEAD
	glBindBuffer(GL_ARRAY_BUFFER, buffersVBO_[0] );
	glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(quads_[0])*particleCount, quads_);
=======
	glBindBuffer(GL_ARRAY_BUFFER, _buffersVBO[0] );

	// Option 1: Sub Data
#if __CC_PLATFORM_MAC
	glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(_quads[0])*_particleCount, _quads);

	// Option 2: Data
//	glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0]) * _particleCount, _quads, GL_STREAM_DRAW);

#elif __CC_PLATFORM_IOS
	// Option 3: Orphaning + glMapBuffer
	glBufferData(GL_ARRAY_BUFFER, sizeof(_quads[0])*_totalParticles, nil, GL_STREAM_DRAW);
	void *buf = glMapBuffer(GL_ARRAY_BUFFER, GL_WRITE_ONLY);
	memcpy(buf, _quads, sizeof(_quads[0])*_particleCount);
	glUnmapBuffer(GL_ARRAY_BUFFER);
#endif

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	glBindBuffer(GL_ARRAY_BUFFER, 0);

	CHECK_GL_ERROR_DEBUG();
}

// overriding draw method
-(void) draw
{
<<<<<<< HEAD
	NSAssert(!batchNode_,@"draw should not be called when added to a particleBatchNode");

	CC_NODE_DRAW_SETUP();

	ccGLBindTexture2D( [texture_ name] );
	ccGLBlendFunc( blendFunc_.src, blendFunc_.dst );

	NSAssert( particleIdx == particleCount, @"Abnormal error in particle quad");

	glBindVertexArray( VAOname_ );

	glDrawElements(GL_TRIANGLES, (GLsizei) particleIdx*6, GL_UNSIGNED_SHORT, 0);

	glBindVertexArray( 0 );

=======
	NSAssert(!_batchNode,@"draw should not be called when added to a particleBatchNode");

	CC_NODE_DRAW_SETUP();

	ccGLBindTexture2D( [_texture name] );
	ccGLBlendFunc( _blendFunc.src, _blendFunc.dst );

	NSAssert( _particleIdx == _particleCount, @"Abnormal error in particle quad");

	ccGLBindVAO( _VAOname );
	glDrawElements(GL_TRIANGLES, (GLsizei) _particleIdx*6, GL_UNSIGNED_SHORT, 0);
	
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	CC_INCREMENT_GL_DRAWS(1);

	CHECK_GL_ERROR_DEBUG();
}

-(void) setBatchNode:(CCParticleBatchNode *)batchNode
{
<<<<<<< HEAD
	if( batchNode_ != batchNode ) {

		CCParticleBatchNode *oldBatch = batchNode_;
=======
	if( _batchNode != batchNode ) {

		CCParticleBatchNode *oldBatch = _batchNode;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[super setBatchNode:batchNode];

		// NEW: is self render ?
		if( ! batchNode ) {
			[self allocMemory];
			[self initIndices];
			[self setTexture:[oldBatch texture]];
			[self initVAO];
		}

		// OLD: was it self render ? cleanup
		else if( ! oldBatch )
		{
			// copy current state to batch
<<<<<<< HEAD
			ccV3F_C4B_T2F_Quad *batchQuads = [[batchNode_ textureAtlas] quads];
			ccV3F_C4B_T2F_Quad *quad = &(batchQuads[atlasIndex_] );
			memcpy( quad, quads_, totalParticles * sizeof(quads_[0]) );

			if (quads_)
				free(quads_);
			quads_ = NULL;

			if (indices_)
				free(indices_);
			indices_ = NULL;

			glDeleteBuffers(2, &buffersVBO_[0]);
			glDeleteVertexArrays(1, &VAOname_);
=======
			ccV3F_C4B_T2F_Quad *batchQuads = [[_batchNode textureAtlas] quads];
			ccV3F_C4B_T2F_Quad *quad = &(batchQuads[_atlasIndex] );
			memcpy( quad, _quads, _totalParticles * sizeof(_quads[0]) );

			if (_quads)
				free(_quads);
			_quads = NULL;

			if (_indices)
				free(_indices);
			_indices = NULL;

			glDeleteBuffers(2, &_buffersVBO[0]);
			glDeleteVertexArrays(1, &_VAOname);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

@end
