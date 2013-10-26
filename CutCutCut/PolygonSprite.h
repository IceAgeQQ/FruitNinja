//
//  PolygonSprite.h
//  CutCutCut
//
//  Created by Chao Xu on 13-10-23.
//  Copyright 2013年 Chao Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRFilledPolygon.h"
#import "Box2D.h"
#import "cocos2d.h"
#define PTM_RATIO 32 //像素到米的转换系数。Box2D内部使用米作为计量单位，需要此转换参数。

//添加一个type属性用来区分这些子类。接下来，你为每种水果分别添加了state属性。一个idle（空闲）的state意味着水果可以被向上抛，另外tossed（被抛）state意味着水果还在屏幕中运动的过程中
typedef enum _State{
    kStateIdle = 0,
    kStateTossed
}State;

typedef enum _Type{
    kTypeWatermelon = 0,
    kTypeStrawberry,
    kTypePineapple,
    kTypeGrapes,
    kTypeBanana,
    kTypeBomb
}Type;

@interface PolygonSprite : PRFilledPolygon {
    b2Body * _body;
    BOOL _original;
    b2Vec2 _centroid;
    
    BOOL _sliceEntered;
    BOOL _sliceExited;
    b2Vec2 _entryPoint;
    b2Vec2 _exitPoint;
    double _sliceEntryTime;
    
    State _state;
    Type _type;
    
    CCParticleSystemQuad *_splurt;
}
@property(nonatomic,assign)b2Body *body;//这是一个关联到sprite的Box2D body。它用来模拟物理特性。
@property(nonatomic,readwrite)BOOL original;
@property(nonatomic,readwrite)b2Vec2 centroid;

@property(nonatomic,readwrite)BOOL sliceEntered;
@property(nonatomic,readwrite)BOOL sliceExited;
@property(nonatomic,readwrite)b2Vec2 entryPoint;
@property(nonatomic,readwrite)b2Vec2 exitPoint;
@property(nonatomic,readwrite)double sliceEntryTime;

@property(nonatomic,readwrite)State state;
@property(nonatomic,readwrite)Type type;
@property(nonatomic,assign)CCParticleSystemQuad *splurt;
-(id)initWithTexture:(CCTexture2D*)texture body:(b2Body*)body original:(BOOL)original;
-(id)initWithFile:(NSString*)filename body:(b2Body*)body original:(BOOL)original;
+(id)spriteWithFile:(NSString*)filename body:(b2Body*)body original:(BOOL)original;
+(id)spriteWithTexture:(CCTexture2D*)texture body:(b2Body*)body original:(BOOL)original;
-(id)initWithWorld:(b2World*)world;
+(id)spriteWithWorld:(b2World*)world;
-(b2Body*)createBodyForWorld:(b2World*)world position:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution;
-(void)activateCollisions;
-(void)deactivateCollisions;
@end







































