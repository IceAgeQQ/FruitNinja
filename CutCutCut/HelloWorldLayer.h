//
//  HelloWorldLayer.h
//  CutCutCut
//
//  Created by Chao Xu on 13-10-23.
//  Copyright Chao Xu 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "PolygonSprite.h"
#import "RayCastCallback.h"
#import "CCBlade.h"

//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
#define PTM_RATIO 32
#define calculate_determinant_2x2(x1,y1,x2,y2) x1*y2-y1*x2
#define calculate_determinant_2x3(x1,y1,x2,y2,x3,y3) x1*y2+x2*y3+x3*y1-y1*x2-y2*x3-y3*x1
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
	//CCTexture2D *spriteTexture_;	// weak ref
	b2World* world;					// strong ref
	GLESDebugDraw *m_debugDraw;		// strong ref
    CCArray *_cache;
    /**为了切割sprite，你必须能够判断点在哪儿。这就需要用到Box2D的ray casting。
    在ray casting中，你需要指定一个起始点和一个结束点，Box2D会根据它们组成的线段判断哪些Box2D的fixtures和它有相交。不只如此，它还会触发一个回调函数来告诉你具体每一个与其碰撞的fixture。
    你将要使用ray casts，基于玩家触摸屏幕的点，来判断出所有触摸经过的fixtures，并使用回调函数来记录每个具体的相交的点。**/
    CGPoint _startPoint;
    CGPoint _endPoint;
    
    RaycastCallback * _raycastCallback;
    CCArray *_blades;
    CCBlade *_blade;
    float _deltaRemainder;
}
@property(nonatomic,retain)CCArray *cache;
@property(nonatomic,retain)CCArray *blades;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(b2Vec2*)arrangeVertices:(b2Vec2*)vertices count:(int)count;
-(void)splitPolygonSprite:(PolygonSprite*)sprite;
-(BOOL)areVerticesAcceptable:(b2Vec2*)vertices count:(int)count;
-(b2Body*)createBodyWithPosition:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution;
@end
























