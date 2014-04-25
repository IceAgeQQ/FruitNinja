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


#import "Platforms/CCGL.h"
#import "CCCamera.h"
#import "ccMacros.h"
#import "CCDrawingPrimitives.h"
#import "kazmath/GL/matrix.h"

@implementation CCCamera

<<<<<<< HEAD
@synthesize dirty = dirty_;
=======
@synthesize dirty = _dirty;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

-(id) init
{
	if( (self=[super init]) )
		[self restore];

	return self;
}

- (NSString*) description
{
<<<<<<< HEAD
	return [NSString stringWithFormat:@"<%@ = %08X | center = (%.2f,%.2f,%.2f)>", [self class], self, centerX_, centerY_, centerZ_];
=======
	return [NSString stringWithFormat:@"<%@ = %p | center = (%.2f,%.2f,%.2f)>", [self class], self, _centerX, _centerY, _centerZ];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


- (void) dealloc
{
	CCLOGINFO(@"cocos2d: deallocing %@", self);
	[super dealloc];
}

-(void) restore
{
<<<<<<< HEAD
	eyeX_ = eyeY_ = 0;
	eyeZ_ = [CCCamera getZEye];

	centerX_ = centerY_ = centerZ_ = 0;

	upX_ = 0.0f;
	upY_ = 1.0f;
	upZ_ = 0.0f;

	kmMat4Identity( &lookupMatrix_ );

	dirty_ = NO;
=======
	_eyeX = _eyeY = 0;
	_eyeZ = [CCCamera getZEye];

	_centerX = _centerY = _centerZ = 0;

	_upX = 0.0f;
	_upY = 1.0f;
	_upZ = 0.0f;

	kmMat4Identity( &_lookupMatrix );

	_dirty = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) locate
{
<<<<<<< HEAD
	if( dirty_ ) {

		kmVec3 eye, center, up;

		kmVec3Fill( &eye, eyeX_, eyeY_ , eyeZ_ );
		kmVec3Fill( &center, centerX_, centerY_, centerZ_ );

		kmVec3Fill( &up, upX_, upY_, upZ_);
		kmMat4LookAt( &lookupMatrix_, &eye, &center, &up);

		dirty_ = NO;

	}

	kmGLMultMatrix( &lookupMatrix_ );
=======
	if( _dirty ) {

		kmVec3 eye, center, up;

		kmVec3Fill( &eye, _eyeX, _eyeY , _eyeZ );
		kmVec3Fill( &center, _centerX, _centerY, _centerZ );

		kmVec3Fill( &up, _upX, _upY, _upZ);
		kmMat4LookAt( &_lookupMatrix, &eye, &center, &up);

		_dirty = NO;

	}

	kmGLMultMatrix( &_lookupMatrix );
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

}

+(float) getZEye
{
	return FLT_EPSILON;
	//	CGSize s = [[CCDirector sharedDirector] displaySize];
	//	return ( s.height / 1.1566f );
}

-(void) setEyeX: (float)x eyeY:(float)y eyeZ:(float)z
{
<<<<<<< HEAD
	eyeX_ = x;
	eyeY_ = y;
	eyeZ_ = z;

	dirty_ = YES;
=======
	_eyeX = x;
	_eyeY = y;
	_eyeZ = z;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setCenterX: (float)x centerY:(float)y centerZ:(float)z
{
<<<<<<< HEAD
	centerX_ = x;
	centerY_ = y;
	centerZ_ = z;

	dirty_ = YES;
=======
	_centerX = x;
	_centerY = y;
	_centerZ = z;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setUpX: (float)x upY:(float)y upZ:(float)z
{
<<<<<<< HEAD
	upX_ = x;
	upY_ = y;
	upZ_ = z;

	dirty_ = YES;
=======
	_upX = x;
	_upY = y;
	_upZ = z;

	_dirty = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) eyeX: (float*)x eyeY:(float*)y eyeZ:(float*)z
{
<<<<<<< HEAD
	*x = eyeX_;
	*y = eyeY_;
	*z = eyeZ_;
=======
	*x = _eyeX;
	*y = _eyeY;
	*z = _eyeZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) centerX: (float*)x centerY:(float*)y centerZ:(float*)z
{
<<<<<<< HEAD
	*x = centerX_;
	*y = centerY_;
	*z = centerZ_;
=======
	*x = _centerX;
	*y = _centerY;
	*z = _centerZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) upX: (float*)x upY:(float*)y upZ:(float*)z
{
<<<<<<< HEAD
	*x = upX_;
	*y = upY_;
	*z = upZ_;
=======
	*x = _upX;
	*y = _upY;
	*z = _upZ;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end
