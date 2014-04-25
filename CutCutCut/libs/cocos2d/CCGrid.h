/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009 On-Core
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


#import <Foundation/Foundation.h>

#import "CCNode.h"
#import "CCCamera.h"
#import "ccTypes.h"
#import "CCDirector.h"
#import "kazmath/mat4.h"

@class CCTexture2D;
@class CCGrabber;
@class CCGLProgram;

/** Base class for other
 */
@interface CCGridBase : NSObject
{
<<<<<<< HEAD
	BOOL		active_;
	int			reuseGrid_;
	ccGridSize	gridSize_;
	CCTexture2D *texture_;
	CGPoint		step_;
	CCGrabber	*grabber_;
	BOOL		isTextureFlipped_;

	CCGLProgram	*shaderProgram_;

	ccDirectorProjection	directorProjection_;
}

/** wheter or not the grid is active */
=======
	BOOL		_active;
	int			_reuseGrid;
	CGSize		_gridSize;
	CCTexture2D *_texture;
	CGPoint		_step;
	CCGrabber	*_grabber;
	BOOL		_isTextureFlipped;

	CCGLProgram	*_shaderProgram;

	ccDirectorProjection	_directorProjection;
}

/** whether or not the grid is active */
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@property (nonatomic,readwrite) BOOL active;
/** number of times that the grid will be reused */
@property (nonatomic,readwrite) int reuseGrid;
/** size of the grid */
<<<<<<< HEAD
@property (nonatomic,readonly) ccGridSize gridSize;
=======
@property (nonatomic,readonly) CGSize gridSize;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
/** pixels between the grids */
@property (nonatomic,readwrite) CGPoint step;
/** texture used */
@property (nonatomic, retain) CCTexture2D *texture;
/** grabber used */
@property (nonatomic, retain) CCGrabber *grabber;
/** is texture flipped */
@property (nonatomic, readwrite) BOOL isTextureFlipped;
/** shader program */
@property (nonatomic, readwrite, assign) CCGLProgram *shaderProgram;

<<<<<<< HEAD
+(id) gridWithSize:(ccGridSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
+(id) gridWithSize:(ccGridSize)gridSize;

-(id) initWithSize:(ccGridSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
-(id)initWithSize:(ccGridSize)gridSize;
=======
+(id) gridWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
+(id) gridWithSize:(CGSize)gridSize;

-(id) initWithSize:(CGSize)gridSize texture:(CCTexture2D*)texture flippedTexture:(BOOL)flipped;
-(id)initWithSize:(CGSize)gridSize;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void)beforeDraw;
-(void)afterDraw:(CCNode*)target;
-(void)blit;
-(void)reuse;

-(void)calculateVertexPoints;

@end

////////////////////////////////////////////////////////////

/**
 CCGrid3D is a 3D grid implementation. Each vertex has 3 dimensions: x,y,z
 */
@interface CCGrid3D : CCGridBase
{
<<<<<<< HEAD
	GLvoid		*texCoordinates;
	GLvoid		*vertices;
	GLvoid		*originalVertices;
	GLushort	*indices;
}

/** returns the vertex at a given position */
-(ccVertex3F)vertex:(ccGridSize)pos;
/** returns the original (non-transformed) vertex at a given position */
-(ccVertex3F)originalVertex:(ccGridSize)pos;
/** sets a new vertex at a given position */
-(void)setVertex:(ccGridSize)pos vertex:(ccVertex3F)vertex;
=======
	GLvoid		*_texCoordinates;
	GLvoid		*_vertices;
	GLvoid		*_originalVertices;
	GLushort	*_indices;
}

/** returns the vertex at a given position */
-(ccVertex3F)vertex:(CGPoint)pos;
/** returns the original (non-transformed) vertex at a given position */
-(ccVertex3F)originalVertex:(CGPoint)pos;
/** sets a new vertex at a given position */
-(void)setVertex:(CGPoint)pos vertex:(ccVertex3F)vertex;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end

////////////////////////////////////////////////////////////

/**
 CCTiledGrid3D is a 3D grid implementation. It differs from Grid3D in that
 the tiles can be separated from the grid.
*/
@interface CCTiledGrid3D : CCGridBase
{
<<<<<<< HEAD
	GLvoid		*texCoordinates;
	GLvoid		*vertices;
	GLvoid		*originalVertices;
	GLushort	*indices;
}

/** returns the tile at the given position */
-(ccQuad3)tile:(ccGridSize)pos;
/** returns the original tile (untransformed) at the given position */
-(ccQuad3)originalTile:(ccGridSize)pos;
/** sets a new tile */
-(void)setTile:(ccGridSize)pos coords:(ccQuad3)coords;
=======
	GLvoid		*_texCoordinates;
	GLvoid		*_vertices;
	GLvoid		*_originalVertices;
	GLushort	*_indices;
}

/** returns the tile at the given position */
-(ccQuad3)tile:(CGPoint)pos;
/** returns the original tile (untransformed) at the given position */
-(ccQuad3)originalTile:(CGPoint)pos;
/** sets a new tile */
-(void)setTile:(CGPoint)pos coords:(ccQuad3)coords;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end
