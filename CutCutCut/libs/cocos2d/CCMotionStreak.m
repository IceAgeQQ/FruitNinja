/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2011 ForzeField Studios S.L. http://forzefield.com
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

#import "CCMotionStreak.h"
#import "CCTextureCache.h"
#import "ccGLStateCache.h"
#import "CCGLProgram.h"
#import "CCShaderCache.h"
#import "ccMacros.h"

#import "Support/CCVertex.h"
#import "Support/CGPointExtension.h"


@implementation CCMotionStreak
<<<<<<< HEAD
@synthesize texture = texture_;
@synthesize blendFunc = blendFunc_;
@synthesize fastMode = fastMode_;
=======
@synthesize texture = _texture;
@synthesize blendFunc = _blendFunc;
@synthesize fastMode = _fastMode;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+ (id) streakWithFade:(float)fade minSeg:(float)minSeg width:(float)stroke color:(ccColor3B)color textureFilename:(NSString*)path
{
    return [[[self alloc] initWithFade:fade minSeg:minSeg width:stroke color:color textureFilename:path] autorelease];
}

+ (id) streakWithFade:(float)fade minSeg:(float)minSeg width:(float)stroke color:(ccColor3B)color texture:(CCTexture2D*)texture
{
    return [[[self alloc] initWithFade:fade minSeg:minSeg width:stroke color:color texture:texture] autorelease];
}

- (id) initWithFade:(float)fade minSeg:(float)minSeg width:(float)stroke color:(ccColor3B)color textureFilename:(NSString*)path
{
    NSAssert(path != nil, @"Invalid filename");

    CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:path];
    return [self initWithFade:fade minSeg:minSeg width:stroke color:color texture:texture];
}

- (id) initWithFade:(float)fade minSeg:(float)minSeg width:(float)stroke color:(ccColor3B)color texture:(CCTexture2D*)texture
{
    self = [super init];
    if (self)
    {
        [super setPosition:CGPointZero];
        [self setAnchorPoint:CGPointZero];
<<<<<<< HEAD
        [self setIsRelativeAnchorPoint:NO];

        positionR_ = CGPointZero;
        fastMode_ = YES;
        minSeg_ = (minSeg == -1.0f) ? stroke/5.0f : minSeg;
        minSeg_ *= minSeg_;

        stroke_ = stroke;
        fadeDelta_ = 1.0f/fade;

        maxPoints_ = (int)(fade*60.0f)+2;
        nuPoints_ = 0;
        pointState_ = malloc(sizeof(float) * maxPoints_);
        pointVertexes_ = malloc(sizeof(CGPoint) * maxPoints_);

        vertices_ = malloc(sizeof(ccVertex2F) * maxPoints_ * 2);
        texCoords_ = malloc(sizeof(ccTex2F) * maxPoints_ * 2);
        colorPointer_ =  malloc(sizeof(GLubyte) * maxPoints_ * 2 * 4);

        // Set blend mode
        blendFunc_.src = GL_SRC_ALPHA;
		blendFunc_.dst = GL_ONE_MINUS_SRC_ALPHA;
=======
        [self setIgnoreAnchorPointForPosition:YES];

		_startingPositionInitialized = NO;
        _positionR = CGPointZero;
        _fastMode = YES;
        _minSeg = (minSeg == -1.0f) ? stroke/5.0f : minSeg;
        _minSeg *= _minSeg;

        _stroke = stroke;
        _fadeDelta = 1.0f/fade;

        _maxPoints = (int)(fade*60.0f)+2;
        _nuPoints = _previousNuPoints = 0;
        _pointState = malloc(sizeof(float) * _maxPoints);
        _pointVertexes = malloc(sizeof(CGPoint) * _maxPoints);

        _vertices = malloc(sizeof(ccVertex2F) * _maxPoints * 2);
        _texCoords = malloc(sizeof(ccTex2F) * _maxPoints * 2);
        _colorPointer =  malloc(sizeof(GLubyte) * _maxPoints * 2 * 4);

        // Set blend mode
        _blendFunc.src = GL_SRC_ALPHA;
		_blendFunc.dst = GL_ONE_MINUS_SRC_ALPHA;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		// shader program
		self.shaderProgram = [[CCShaderCache sharedShaderCache] programForKey:kCCShader_PositionTextureColor];

        [self setTexture:texture];
        [self setColor:color];
        [self scheduleUpdate];
<<<<<<< HEAD
=======
		
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    }
    return self;
}

#pragma mark -

- (void) setPosition:(CGPoint)position
{
<<<<<<< HEAD
    positionR_ = position;
=======
	_startingPositionInitialized = YES;
    _positionR = position;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) tintWithColor:(ccColor3B)colors
{
    [self setColor:colors];

    // Fast assignation
<<<<<<< HEAD
    for(int i = 0; i<nuPoints_*2; i++)
        *((ccColor3B*) (colorPointer_+i*4)) = colors;
}

- (void) setColor:(ccColor3B)colors
{
    color_ = colors;
}

- (ccColor3B) color
{
    return color_;
=======
    for(int i = 0; i<_nuPoints*2; i++)
        *((ccColor3B*) (_colorPointer+i*4)) = colors;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) setOpacity:(GLubyte)opacity
{
    NSAssert(NO, @"Set opacity no supported");
}

- (GLubyte) opacity
{
    NSAssert(NO, @"Opacity no supported");
    return 0;
}

#pragma mark -

- (void) update:(ccTime)delta
{
<<<<<<< HEAD
    delta *= fadeDelta_;

=======
	if( !_startingPositionInitialized )
		return;

    delta *= _fadeDelta;
	
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    NSUInteger newIdx, newIdx2, i, i2;
    NSUInteger mov = 0;

    // Update current points
<<<<<<< HEAD
    for(i = 0; i<nuPoints_; i++)
    {
        pointState_[i]-=delta;

        if(pointState_[i] <= 0)
=======
    for(i = 0; i<_nuPoints; i++)
    {
        _pointState[i]-=delta;

        if(_pointState[i] <= 0)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
            mov++;
        else
        {
            newIdx = i-mov;

            if(mov>0)
            {
                // Move data
<<<<<<< HEAD
                pointState_[newIdx] = pointState_[i];

                // Move point
                pointVertexes_[newIdx] = pointVertexes_[i];
=======
                _pointState[newIdx] = _pointState[i];

                // Move point
                _pointVertexes[newIdx] = _pointVertexes[i];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

                // Move vertices
                i2 = i*2;
                newIdx2 = newIdx*2;
<<<<<<< HEAD
                vertices_[newIdx2] = vertices_[i2];
                vertices_[newIdx2+1] = vertices_[i2+1];
=======
                _vertices[newIdx2] = _vertices[i2];
                _vertices[newIdx2+1] = _vertices[i2+1];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

                // Move color
                i2 *= 4;
                newIdx2 *= 4;
<<<<<<< HEAD
                colorPointer_[newIdx2+0] = colorPointer_[i2+0];
                colorPointer_[newIdx2+1] = colorPointer_[i2+1];
                colorPointer_[newIdx2+2] = colorPointer_[i2+2];
                colorPointer_[newIdx2+4] = colorPointer_[i2+4];
                colorPointer_[newIdx2+5] = colorPointer_[i2+5];
                colorPointer_[newIdx2+6] = colorPointer_[i2+6];
            }else
                newIdx2 = newIdx*8;

            const GLubyte op = pointState_[newIdx] * 255.0f;
            colorPointer_[newIdx2+3] = op;
            colorPointer_[newIdx2+7] = op;
        }
    }
    nuPoints_-=mov;

    // Append new point
    BOOL appendNewPoint = YES;
    if(nuPoints_ >= maxPoints_)
        appendNewPoint = NO;

    else if(nuPoints_>0)
    {
        BOOL a1 = ccpDistanceSQ(pointVertexes_[nuPoints_-1], positionR_) < minSeg_;
        BOOL a2 = (nuPoints_ == 1) ? NO : (ccpDistanceSQ(pointVertexes_[nuPoints_-2], positionR_) < (minSeg_ * 2.0f));
=======
                _colorPointer[newIdx2+0] = _colorPointer[i2+0];
                _colorPointer[newIdx2+1] = _colorPointer[i2+1];
                _colorPointer[newIdx2+2] = _colorPointer[i2+2];
                _colorPointer[newIdx2+4] = _colorPointer[i2+4];
                _colorPointer[newIdx2+5] = _colorPointer[i2+5];
                _colorPointer[newIdx2+6] = _colorPointer[i2+6];
            }else
                newIdx2 = newIdx*8;

            const GLubyte op = _pointState[newIdx] * 255.0f;
            _colorPointer[newIdx2+3] = op;
            _colorPointer[newIdx2+7] = op;
        }
    }
    _nuPoints-=mov;

    // Append new point
    BOOL appendNewPoint = YES;
    if(_nuPoints >= _maxPoints)
        appendNewPoint = NO;

    else if(_nuPoints>0)
    {
        BOOL a1 = ccpDistanceSQ(_pointVertexes[_nuPoints-1], _positionR) < _minSeg;
        BOOL a2 = (_nuPoints == 1) ? NO : (ccpDistanceSQ(_pointVertexes[_nuPoints-2], _positionR) < (_minSeg * 2.0f));
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        if(a1 || a2)
            appendNewPoint = NO;
    }

    if(appendNewPoint)
    {
<<<<<<< HEAD
        pointVertexes_[nuPoints_] = positionR_;
        pointState_[nuPoints_] = 1.0f;

        // Color asignation
        const NSUInteger offset = nuPoints_*8;
        *((ccColor3B*)(colorPointer_ + offset)) = color_;
        *((ccColor3B*)(colorPointer_ + offset+4)) = color_;

        // Opacity
        colorPointer_[offset+3] = 255;
        colorPointer_[offset+7] = 255;

        // Generate polygon
        if(nuPoints_ > 0 && fastMode_ )
        {
            if(nuPoints_ > 1)
                ccVertexLineToPolygon(pointVertexes_, stroke_, vertices_, texCoords_, nuPoints_, 1);
            else
                ccVertexLineToPolygon(pointVertexes_, stroke_, vertices_, texCoords_, 0, 2);
        }

        nuPoints_ ++;
    }

    if( ! fastMode_ )
        ccVertexLineToPolygon(pointVertexes_, stroke_, vertices_, texCoords_, 0, nuPoints_);
=======
        _pointVertexes[_nuPoints] = _positionR;
        _pointState[_nuPoints] = 1.0f;

        // Color asignation
        const NSUInteger offset = _nuPoints*8;
        *((ccColor3B*)(_colorPointer + offset)) = _displayedColor;
        *((ccColor3B*)(_colorPointer + offset+4)) = _displayedColor;

        // Opacity
        _colorPointer[offset+3] = 255;
        _colorPointer[offset+7] = 255;

        // Generate polygon
        if(_nuPoints > 0 && _fastMode )
        {
            if(_nuPoints > 1)
                ccVertexLineToPolygon(_pointVertexes, _stroke, _vertices, _nuPoints, 1);
            else
                ccVertexLineToPolygon(_pointVertexes, _stroke, _vertices, 0, 2);
        }

        _nuPoints ++;
    }

    if( ! _fastMode )
        ccVertexLineToPolygon(_pointVertexes, _stroke, _vertices, 0, _nuPoints);
	
	
	// Updated Tex Coords only if they are different than previous step
	if( _nuPoints  && _previousNuPoints != _nuPoints ) {
		float texDelta = 1.0f / _nuPoints;
		for( i=0; i < _nuPoints; i++ ) {
			_texCoords[i*2] = (ccTex2F) {0, texDelta*i};
			_texCoords[i*2+1] = (ccTex2F) {1, texDelta*i};
		}
		
		_previousNuPoints = _nuPoints;
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) reset
{
<<<<<<< HEAD
    nuPoints_ = 0;
=======
    _nuPoints = 0;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

- (void) draw
{
<<<<<<< HEAD
    if(nuPoints_ <= 1)
=======
    if(_nuPoints <= 1)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        return;

	CC_NODE_DRAW_SETUP();

	ccGLEnableVertexAttribs(kCCVertexAttribFlag_PosColorTex );
<<<<<<< HEAD
	ccGLBlendFunc( blendFunc_.src, blendFunc_.dst );

	ccGLBindTexture2D( [texture_ name] );

	glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, vertices_);
	glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, 0, texCoords_);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, colorPointer_);

    glDrawArrays(GL_TRIANGLE_STRIP, 0, (GLsizei)nuPoints_*2);
=======
	ccGLBlendFunc( _blendFunc.src, _blendFunc.dst );

	ccGLBindTexture2D( [_texture name] );

	glVertexAttribPointer(kCCVertexAttrib_Position, 2, GL_FLOAT, GL_FALSE, 0, _vertices);
	glVertexAttribPointer(kCCVertexAttrib_TexCoords, 2, GL_FLOAT, GL_FALSE, 0, _texCoords);
	glVertexAttribPointer(kCCVertexAttrib_Color, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, _colorPointer);

    glDrawArrays(GL_TRIANGLE_STRIP, 0, (GLsizei)_nuPoints*2);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	
	CC_INCREMENT_GL_DRAWS(1);
}

- (void)dealloc
{
<<<<<<< HEAD
    [texture_ release];

    free(pointState_);
    free(pointVertexes_);
    free(vertices_);
    free(colorPointer_);
    free(texCoords_);
=======
    [_texture release];

    free(_pointState);
    free(_pointVertexes);
    free(_vertices);
    free(_colorPointer);
    free(_texCoords);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

    [super dealloc];
}

@end
