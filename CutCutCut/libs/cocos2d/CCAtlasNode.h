/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 *
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


#import "CCTextureAtlas.h"
#import "CCNode.h"
#import "CCProtocols.h"

<<<<<<< HEAD
=======
@class CCTexture2D;

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** CCAtlasNode is a subclass of CCNode that implements the CCRGBAProtocol and
 CCTextureProtocol protocol

 It knows how to render a TextureAtlas object.
<<<<<<< HEAD
 If you are going to render a TextureAtlas consider subclassing CCAtlasNode (or a subclass of CCAtlasNode)
=======
 If you are going to render a TextureAtlas consider sub-classing CCAtlasNode (or a subclass of CCAtlasNode)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

 All features from CCNode are valid, plus the following features:
 - opacity and RGB colors
 */
<<<<<<< HEAD
@interface CCAtlasNode : CCNode <CCRGBAProtocol, CCTextureProtocol>
{
	// texture atlas
	CCTextureAtlas	*textureAtlas_;

	// chars per row
	NSUInteger		itemsPerRow_;
	// chars per column
	NSUInteger		itemsPerColumn_;

	// width of each char
	NSUInteger		itemWidth_;
	// height of each char
	NSUInteger		itemHeight_;

	// quads to draw
	NSUInteger		quadsToDraw_;

	// blend function
	ccBlendFunc		blendFunc_;

	// texture RGBA.
	GLubyte		opacity_;
	ccColor3B	color_;
	ccColor3B	colorUnmodified_;
	BOOL opacityModifyRGB_;

	// color uniform
	GLint	uniformColor_;
=======
@interface CCAtlasNode : CCNodeRGBA <CCTextureProtocol>
{
	// texture atlas
	CCTextureAtlas	*_textureAtlas;

	// chars per row
	NSUInteger		_itemsPerRow;
	// chars per column
	NSUInteger		_itemsPerColumn;

	// width of each char
	NSUInteger		_itemWidth;
	// height of each char
	NSUInteger		_itemHeight;

	// quads to draw
	NSUInteger		_quadsToDraw;

	// blend function
	ccBlendFunc		_blendFunc;

	// texture RGBA.
	ccColor3B	_colorUnmodified;
	BOOL		_opacityModifyRGB;

	// color uniform
	GLint	_uniformColor;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** conforms to CCTextureProtocol protocol */
@property (nonatomic,readwrite,retain) CCTextureAtlas *textureAtlas;

/** conforms to CCTextureProtocol protocol */
@property (nonatomic,readwrite) ccBlendFunc blendFunc;

/** conforms to CCRGBAProtocol protocol */
<<<<<<< HEAD
@property (nonatomic,readwrite) GLubyte opacity;
/** conforms to CCRGBAProtocol protocol */
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@property (nonatomic,readwrite) ccColor3B color;

/** how many quads to draw */
@property (nonatomic,readwrite) NSUInteger quadsToDraw;

/** creates a CCAtlasNode  with an Atlas file the width and height of each item measured in points and the quantity of items to render*/
+(id) atlasWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;

/** initializes an CCAtlasNode  with an Atlas file the width and height of each item measured in points and the quantity of items to render*/
-(id) initWithTileFile:(NSString*)tile tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;

<<<<<<< HEAD
/** updates the Atlas (indexed vertex array).
 * Shall be overriden in subclasses
=======
/** initializes an CCAtlasNode  with a texture the width and height of each item measured in points and the quantity of items to render*/
-(id) initWithTexture:(CCTexture2D*)texture tileWidth:(NSUInteger)w tileHeight:(NSUInteger)h itemsToRender: (NSUInteger) c;


/** updates the Atlas (indexed vertex array).
 * Shall be overridden in subclasses
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
-(void) updateAtlasValues;
@end
