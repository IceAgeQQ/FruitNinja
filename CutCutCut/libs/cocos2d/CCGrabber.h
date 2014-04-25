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


#import "Platforms/CCGL.h"
#import <Foundation/Foundation.h>

@class CCTexture2D;

/** FBO class that grabs the the contents of the screen */
@interface CCGrabber : NSObject
{
<<<<<<< HEAD
	GLuint	fbo_;
	GLint	oldFBO_;
=======
	GLuint	_FBO;
	GLint	_oldFBO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	GLfloat	oldClearColor_[4];
}

-(void)grab:(CCTexture2D*)texture;
-(void)beforeRender:(CCTexture2D*)texture;
-(void)afterRender:(CCTexture2D*)texture;

@end
