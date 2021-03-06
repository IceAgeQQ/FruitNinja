/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2009 Sindesso Pty Ltd http://www.sindesso.com/
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


#import "CCTransitionPageTurn.h"
#import	"CCActionPageTurn3D.h"
#import "CCDirector.h"

@implementation CCTransitionPageTurn

/** creates a base transition with duration and incoming scene */
+(id) transitionWithDuration:(ccTime) t scene:(CCScene*)s backwards:(BOOL) back
{
	return [[[self alloc] initWithDuration:t scene:s backwards:back] autorelease];
}

/** initializes a transition with duration and incoming scene */
-(id) initWithDuration:(ccTime) t scene:(CCScene*)s backwards:(BOOL) back
{
	// XXX: needed before [super init]
<<<<<<< HEAD
	back_ = back;
=======
	_back = back;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if( ( self = [super initWithDuration:t scene:s] ) )
	{
		// do something
	}
	return self;
}

-(void) sceneOrder
{
<<<<<<< HEAD
	inSceneOnTop_ = back_;
=======
	_inSceneOnTop = _back;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

//
-(void) onEnter
{
	[super onEnter];

	CGSize s = [[CCDirector sharedDirector] winSize];
	int x, y;
	if( s.width > s.height)
	{
		x = 16;
		y = 12;
	}
	else
	{
		x = 12;
		y = 16;
	}

<<<<<<< HEAD
	id action  = [self actionWithSize:ccg(x,y)];

	if(! back_ )
	{
		[outScene_ runAction: [CCSequence actions:
=======
	id action  = [self actionWithSize:CGSizeMake(x,y)];

	if(! _back )
	{
		[_outScene runAction: [CCSequence actions:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
							  action,
							  [CCCallFunc actionWithTarget:self selector:@selector(finish)],
							  [CCStopGrid action],
							  nil]
		 ];
	}
	else
	{
		// to prevent initial flicker
<<<<<<< HEAD
		inScene_.visible = NO;
		[inScene_ runAction: [CCSequence actions:
=======
		_inScene.visible = NO;
		[_inScene runAction: [CCSequence actions:
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
							 [CCShow action],
							 action,
							 [CCCallFunc actionWithTarget:self selector:@selector(finish)],
							 [CCStopGrid action],
							 nil]
		 ];
	}

}

<<<<<<< HEAD
-(CCActionInterval*) actionWithSize: (ccGridSize) v
{
	if( back_ )
	{
		// Get hold of the PageTurn3DAction
		return [CCReverseTime actionWithAction:
				[CCPageTurn3D actionWithSize:v duration:duration_]];
=======
-(CCActionInterval*) actionWithSize: (CGSize) v
{
	if( _back )
	{
		// Get hold of the PageTurn3DAction
		return [CCReverseTime actionWithAction:
				[CCPageTurn3D actionWithDuration:_duration size:v]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	else
	{
		// Get hold of the PageTurn3DAction
<<<<<<< HEAD
		return [CCPageTurn3D actionWithSize:v duration:duration_];
=======
		return [CCPageTurn3D actionWithDuration:_duration size:v];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

@end

