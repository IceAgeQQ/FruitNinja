/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2011 Ricardo Quesada
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

#import "CCShaderCache.h"
#import "ccShaders.h"
#import "CCGLProgram.h"
#import "ccMacros.h"
#import "Support/OpenGL_Internal.h"

static CCShaderCache *_sharedShaderCache;

@implementation CCShaderCache

#pragma mark CCShaderCache - Alloc, Init & Dealloc

+ (CCShaderCache *)sharedShaderCache
{
	if (!_sharedShaderCache)
		_sharedShaderCache = [[CCShaderCache alloc] init];

	return _sharedShaderCache;
}

+(void)purgeSharedShaderCache
{
	[_sharedShaderCache release];
	_sharedShaderCache = nil;
}


+(id)alloc
{
	NSAssert(_sharedShaderCache == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}

- (void)dealloc
{
	CCLOGINFO(@"cocos2d deallocing %@", self);

<<<<<<< HEAD
	[programs_ release];
=======
	[_programs release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    [super dealloc];
}

+(void)purgeSharedTextureCache
{
	[_sharedShaderCache release];
	_sharedShaderCache = nil;
}

-(id) init
{
	if( (self=[super init]) ) {
<<<<<<< HEAD
		programs_ = [[NSMutableDictionary alloc ] initWithCapacity: 10];
=======
		_programs = [[NSMutableDictionary alloc ] initWithCapacity: 10];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[self loadDefaultShaders];
	}

	return self;
}

-(void) loadDefaultShaders
{
	// Position Texture Color shader
	CCGLProgram *p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureColor_vert
												fragmentShaderByteArray:ccPositionTextureColor_frag];

	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];
	[p addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];

	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_PositionTextureColor];
=======
	[_programs setObject:p forKey:kCCShader_PositionTextureColor];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[p release];

	CHECK_GL_ERROR_DEBUG();

	// Position Texture Color alpha test
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureColor_vert
								   fragmentShaderByteArray:ccPositionTextureColorAlphaTest_frag];

	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];
	[p addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];

	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_PositionTextureColorAlphaTest];
=======
	[_programs setObject:p forKey:kCCShader_PositionTextureColorAlphaTest];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[p release];

	CHECK_GL_ERROR_DEBUG();

	//
	// Position, Color shader
	//
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionColor_vert
								   fragmentShaderByteArray:ccPositionColor_frag];

	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];

	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_PositionColor];
=======
	[_programs setObject:p forKey:kCCShader_PositionColor];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[p release];

	CHECK_GL_ERROR_DEBUG();

	//
	// Position Texture shader
	//
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTexture_vert
								   fragmentShaderByteArray:ccPositionTexture_frag];

	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];

	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_PositionTexture];
=======
	[_programs setObject:p forKey:kCCShader_PositionTexture];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[p release];

	CHECK_GL_ERROR_DEBUG();

	//
	// Position, Texture attribs, 1 Color as uniform shader
	//
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTexture_uColor_vert
								   fragmentShaderByteArray:ccPositionTexture_uColor_frag];

	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];

	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_PositionTexture_uColor];
=======
	[_programs setObject:p forKey:kCCShader_PositionTexture_uColor];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[p release];
	
	CHECK_GL_ERROR_DEBUG();

	//
	// Position Texture A8 Color shader
	//
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionTextureA8Color_vert
								   fragmentShaderByteArray:ccPositionTextureA8Color_frag];

	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];
	[p addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];

	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_PositionTextureA8Color];
=======
	[_programs setObject:p forKey:kCCShader_PositionTextureA8Color];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[p release];

	CHECK_GL_ERROR_DEBUG();
	
	//
	// Position and 1 color passed as a uniform (to similate glColor4ub )
	//
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPosition_uColor_vert
								   fragmentShaderByteArray:ccPosition_uColor_frag];	
	
	[p addAttribute:@"aVertex" index:kCCVertexAttrib_Position];
	
	[p link];
	[p updateUniforms];

<<<<<<< HEAD
	[programs_ setObject:p forKey:kCCShader_Position_uColor];
	[p release];

	CHECK_GL_ERROR_DEBUG();
=======
	[_programs setObject:p forKey:kCCShader_Position_uColor];
	[p release];

	CHECK_GL_ERROR_DEBUG();
	
	//
	// Position, Legth(TexCoords, Color (used by Draw Node basically )
	//
	p = [[CCGLProgram alloc] initWithVertexShaderByteArray:ccPositionColorLengthTexture_vert
								   fragmentShaderByteArray:ccPositionColorLengthTexture_frag];	
	
	[p addAttribute:kCCAttributeNamePosition index:kCCVertexAttrib_Position];
	[p addAttribute:kCCAttributeNameTexCoord index:kCCVertexAttrib_TexCoords];
	[p addAttribute:kCCAttributeNameColor index:kCCVertexAttrib_Color];
	
	[p link];
	[p updateUniforms];
	
	[_programs setObject:p forKey:kCCShader_PositionLengthTexureColor];
	[p release];
	CHECK_GL_ERROR_DEBUG();
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCGLProgram *) programForKey:(NSString*)key
{
<<<<<<< HEAD
	return [programs_ objectForKey:key];
=======
	return [_programs objectForKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) addProgram:(CCGLProgram*)program forKey:(NSString*)key
{
<<<<<<< HEAD
    [programs_ setObject:program forKey:key];
=======
    [_programs setObject:program forKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end
