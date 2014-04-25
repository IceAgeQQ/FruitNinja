//
//  HelloWorldLayer.h
//  CutCutCut
//
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "PolygonSprite.h"
#import "RaycastCallback.h"
#import "CCBlade.h"
#import "SimpleAudioEngine.h"

#define calculate_determinant_2x2(x1,y1,x2,y2) x1*y2-y1*x2
#define calculate_determinant_2x3(x1,y1,x2,y2,x3,y3) x1*y2+x2*y3+x3*y1-y1*x2-y2*x3-y3*x1
#define frandom (float)arc4random()/UINT64_C(0x100000000)
#define frandom_range(low,high) ((high-low)*frandom)+low
#define random_range(low,high) (arc4random()%(high-low+1))+low
#define midpoint(a,b) (float)(a+b)/2

//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
#define PTM_RATIO 32

typedef enum _TossType
{
    kTossConsecutive = 0,
    kTossSimultaneous
}TossType;


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    //the physics simulation world
	b2World* world;					// strong ref
	GLESDebugDraw *m_debugDraw;		// strong ref
    
    //the sprite cache
    CCArray *_cache;

    //variables for the blade effect
    CCArray *_blades;
    CCBlade *_blade;
    float _deltaRemainder;

    //variables for ray casting
    CGPoint _startPoint;
    CGPoint _endPoint;
    RaycastCallback *_raycastCallback;
    
    //variables for tossing mechanic
    double _nextTossTime;
    double _tossInterval;
    int _queuedForToss;
    TossType _currentTossType;
    
    //variables for scoring
    int _cuts;
    int _lives;
    CCLabelTTF *_cutsLabel;
    
    //particle effect for the blade
    CCParticleSystemQuad *_bladeSparkle;
    
    //variables for playing the swoosh sound
    float _timeCurrent;
    float _timePrevious;
    CDSoundSource *_swoosh;
}

@property(nonatomic,retain)CCArray *cache;
@property(nonatomic,retain)CCArray *blades;
@property(nonatomic,retain)CDSoundSource *swoosh;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(b2Vec2*)arrangeVertices:(b2Vec2*)vertices count:(int)count;
-(void)splitPolygonSprite:(PolygonSprite*)sprite;
-(BOOL)areVerticesAcceptable:(b2Vec2*)vertices count:(int)count;
-(b2Body*)createBodyWithPosition:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution;

@end
