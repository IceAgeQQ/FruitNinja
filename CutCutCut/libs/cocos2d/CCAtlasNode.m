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
 */


#import "CCAtlasNode.h"
#import "ccMacros.h"
#import "CCGLProgram.h"
<<<<<<< HEAD
=======
#import "CCTextureCache.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#import "CCShaderCache.h"
#import "ccGLStateCache.h"
#import "CCDirector.h"
#import "Support/TransformUtils.h"

// external
#import "kazmath/GL/matrix.h"


@interface CCAtlasNode ()
-(void) calculateMaxItems;
-(void) updateBlendFunc;
-(void) updateOpacityModifyRGB;
@end

@implementation CCAtlasNode

<<<<<<< HEAD
@synthesize textureAtlas = textureAtlas_;
@synthesize blendFunc = blendFunc_;
@synthesize quadsToDraw = quadsToDraw_;
=======
@synthesize textureAtlas = _textureAtlas;
@synthesize blendFunc = _blendFunc;
@synthesize quadsToDraw = _quadsToDraw;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#pragma mark CCAtlasNode - Creation & Init
- (id) init
{
	NSAssert( NO, @"Not supported - Use initWtihTileFile instead");
    return self;
}

+(id) atlasWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c
{
	return [[[self alloc] initWithTileFile:tile tileWidth:w tileHeight:h itemsToRender:c] autorelease];
}

<<<<<<< HEAD
-(id) initWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c
{
	if( (self=[super init]) ) {

		itemWidth_ = w;
		itemHeight_ = h;

		opacity_ = 255;
		color_ = colorUnmodified_ = ccWHITE;
		opacityModifyRGB_ = YES;

		blendFunc_.src = CC_BLEND_SRC;
		blendFunc_.dst = CC_BLEND_DST;

		CCTextureAtlas * newAtlas = [[CCTextureAtlas alloc] initWithFile:tile capacity:c];
		self.textureAtlas = newAtlas;
		[newAtlas release];

		if( ! textureAtlas_ ) {
=======
-(id) initWithTileFile:(NSString*)filename tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c
{
	CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:filename];
	return [self initWithTexture:texture tileWidth:w tileHeight:h itemsToRender:c];
}

-(id) initWithTexture:(CCTexture2D*)texture tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;
{
	if( (self=[super init]) ) {
		
		_itemWidth = w;
		_itemHeight = h;

		_colorUnmodified = ccWHITE;
		_opacityModifyRGB = YES;

		_blendFunc.src = CC_BLEND_SRC;
		_blendFunc.dst = CC_BLEND_DST;

		_textureAtlas = [[CCTextureAtlas alloc] initWithTexture:texture capacity:c];
		
		if( ! _textureAtlas ) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			CCLOG(@"cocos2d: Could not initialize CCAtlasNode. Invalid Texture");
			[self release];
			return nil;
		}

		[self updateBlendFunc];
		[self updateOpacityModifyRGB];

		[self calculateMaxItems];

		self.quadsToDraw = c;

		// shader stuff
		self.shaderProgram = [[CCShaderCache sharedShaderCache] programForKey:kCCShader_PositionTexture_uColor];
<<<<<<< HEAD
		uniformColor_ = glGetUniformLocation( shaderProgram_->program_, "u_color");
=======
		_uniformColor = glGetUniformLocation( _shaderProgram.program, "u_color");
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(void) dealloc
{
<<<<<<< HEAD
	[textureAtlas_ release];
=======
	[_textureAtlas release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

#pragma mark CCAtlasNode - Atlas generation

-(void) calculateMaxItems
{
<<<<<<< HEAD
	CGSize s = [[textureAtlas_ texture] contentSize];
	itemsPerColumn_ = s.height / itemHeight_;
	itemsPerRow_ = s.width / itemWidth_;
=======
	CGSize s = [[_textureAtlas texture] contentSize];
	_itemsPerColumn = s.height / _itemHeight;
	_itemsPerRow = s.width / _itemWidth;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) updateAtlasValues
{
	[NSException raise:@"CCAtlasNode:Abstract" format:@"updateAtlasValue not overriden"];
}

#pragma mark CCAtlasNode - draw
- (void) draw
{
	CC_NODE_DRAW_SETUP();

<<<<<<< HEAD
	ccGLBlendFunc( blendFunc_.src, blendFunc_.dst );
	
	GLfloat colors[4] = {color_.r / 255.0f, color_.g / 255.0f, color_.b / 255.0f, opacity_ / 255.0f};
	[shaderProgram_ setUniformLocation:uniformColor_ with4fv:colors count:1];

	[textureAtlas_ drawNumberOfQuads:quadsToDraw_ fromIndex:0];
=======
	ccGLBlendFunc( _blendFunc.src, _blendFunc.dst );
	
	GLfloat colors[4] = { _displayedColor.r / 255.0f,
                          _displayedColor.g / 255.0f,
                          _displayedColor.b / 255.0f,
                          _displayedOpacity / 255.0f};
	[_shaderProgram setUniformLocation:_uniformColor with4fv:colors count:1];

	[_textureAtlas drawNumberOfQuads:_quadsToDraw fromIndex:0];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCAtlasNode - RGBA protocol

- (ccColor3B) color
{
<<<<<<< HEAD
	if(opacityModifyRGB_)
		return colorUnmodified_;

	return color_;
=======
	if (_opacityModifyRGB)
		return _colorUnmodified;

	return super.color;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setColor:(ccColor3B)color3
{
<<<<<<< HEAD
	color_ = colorUnmodified_ = color3;

	if( opacityModifyRGB_ ){
		color_.r = color3.r * opacity_/255;
		color_.g = color3.g * opacity_/255;
		color_.b = color3.b * opacity_/255;
	}
}

-(GLubyte) opacity
{
	return opacity_;
=======
	_colorUnmodified = color3;

	if( _opacityModifyRGB ){
		color3.r = color3.r * _displayedOpacity/255;
		color3.g = color3.g * _displayedOpacity/255;
		color3.b = color3.b * _displayedOpacity/255;
	}
    [super setColor:color3];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setOpacity:(GLubyte) anOpacity
{
<<<<<<< HEAD
	opacity_			= anOpacity;

	// special opacity for premultiplied textures
	if( opacityModifyRGB_ )
		[self setColor: colorUnmodified_];
=======
    [super setOpacity:anOpacity];

	// special opacity for premultiplied textures
	if( _opacityModifyRGB )
		[self setColor: _colorUnmodified];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setOpacityModifyRGB:(BOOL)modify
{
	ccColor3B oldColor	= self.color;
<<<<<<< HEAD
	opacityModifyRGB_	= modify;
=======
	_opacityModifyRGB	= modify;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	self.color			= oldColor;
}

-(BOOL) doesOpacityModifyRGB
{
<<<<<<< HEAD
	return opacityModifyRGB_;
=======
	return _opacityModifyRGB;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) updateOpacityModifyRGB
{
<<<<<<< HEAD
	opacityModifyRGB_ = [textureAtlas_.texture hasPremultipliedAlpha];
=======
	_opacityModifyRGB = [_textureAtlas.texture hasPremultipliedAlpha];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

#pragma mark CCAtlasNode - CCNodeTexture protocol

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
	[self updateOpacityModifyRGB];
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
