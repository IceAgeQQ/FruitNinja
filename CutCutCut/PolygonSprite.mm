//
//  PolygonSprite.m
//  CutCutCut
//
//  Created by Chao Xu on 13-10-23.
//  Copyright 2013年 Chao Xu. All rights reserved.
//

#import "PolygonSprite.h"
#import "ccDeprecated.h"

@implementation PolygonSprite
@synthesize body =_body;
@synthesize original =_original;
@synthesize centroid = _centroid;
@synthesize entryPoint = _entryPoint;//切割线首次和多边形解除的点
@synthesize exitPoint = _exitPoint;//切割线第二次和多边形接触的点。
@synthesize sliceEntered = _sliceEntered;//判断多边形是否已经有切割线进入了
@synthesize sliceExited = _sliceExited;//判断多边形是否呗完整的切割过一次
@synthesize sliceEntryTime = _sliceEntryTime;//切割线进入多边形时的准确时间。用来决定过慢的清扫动作不被视为切割动作
@synthesize state =_state;
@synthesize type = _type;
@synthesize splurt = _splurt;

+(id)spriteWithFile:(NSString *)filename body:(b2Body *)body  original:(BOOL)original
{
    return [[[self alloc]initWithFile:filename body:body original:original] autorelease];
}

+(id)spriteWithTexture:(CCTexture2D *)texture body:(b2Body *)body  original:(BOOL)original
{
    return [[[self alloc]initWithTexture:texture body:body original:original] autorelease];
}

+(id)spriteWithWorld:(b2World *)world
{
    return [[[self alloc]initWithWorld:world] autorelease];
}
// 这个方法添加从文件获取的纹理并把所有的需要的参数传给initWithTexture。
-(id)initWithFile:(NSString*)filename body:(b2Body*)body  original:(BOOL)original
{
    NSAssert(filename != nil, @"Invalid filename for sprite");
    CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage: filename];
    return [self initWithTexture:texture body:body original:original];
}
//我们主要的初始化方法。PRFilledPolygon需要一个纹理和这个纹理的对应的实际多边形的顶点。由于上一步已经处理了纹理本身了，这一步只需要从sprite的Box2D body中获取相应的顶点即可。在向PRFilledPolygon传入这些顶点后，PRFilledPolygon会负责初始化这些之前声明过的变量。
-(id)initWithTexture:(CCTexture2D*)texture body:(b2Body*)body original:(BOOL)original
{
    // gather all the vertices from our Box2D shape
    _state = kStateIdle;
    b2Fixture *originalFixture = body->GetFixtureList();
    b2PolygonShape *shape = (b2PolygonShape*)originalFixture->GetShape();
    int vertexCount = shape->GetVertexCount();
    NSMutableArray *points = [NSMutableArray arrayWithCapacity:vertexCount];
    for(int i = 0; i < vertexCount; i++) {
        CGPoint p = ccp(shape->GetVertex(i).x * PTM_RATIO, shape->GetVertex(i).y * PTM_RATIO);
        [points addObject:[NSValue valueWithCGPoint:p]];
    }
    
    if ((self = [super initWithPoints:points andTexture:texture]))
    {
        _sliceExited = NO;
        _sliceEntered = NO;
        _entryPoint.SetZero();
        _exitPoint.SetZero();
        _sliceExited = 0;
        
        _body = body;
        _body->SetUserData(self);
        _original = original;
        // gets the center of the polygon
        _centroid = self.body->GetLocalCenter();
        // assign an anchor point based on the center
        self.anchorPoint = ccp(_centroid.x * PTM_RATIO / texture.contentSize.width,
                               _centroid.y * PTM_RATIO / texture.contentSize.height);
        // more init stuff here later when you expand PolygonSprite
    }
    return self;
}

-(id)initWithWorld:(b2World *)world
{
    //nothing to do here
    return nil;
}
-(void)setPosition:(CGPoint)position
{
    [super setPosition:position];
    _body->SetTransform(b2Vec2(position.x/PTM_RATIO,position.y/PTM_RATIO), _body->GetAngle());
}
//要创建body，你需要先定义一个body definition，一个a body object，a shape和一个fixture definition。
-(b2Body*)createBodyForWorld:(b2World *)world position:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution
{
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position = position;
    bodyDef.angle = rotation;
    b2Body *body = world->CreateBody(&bodyDef);
    
    b2FixtureDef fixtureDef;
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    fixtureDef.filter.categoryBits = 0;
    fixtureDef.filter.maskBits = 0;
    //PolygonSprites中的body对象设成sensors，这意味着Box2D只会检测这些body的碰撞而不会实际作用这些碰撞。当你把一个水果从底部抛向空中时，你并不想让他们在下落时互相碰撞，因为玩家很有可能还没看见它们就输掉了。
    fixtureDef.isSensor = YES;
    
    b2PolygonShape shape;
    shape.Set(vertices, count);
    fixtureDef.shape = &shape;
    body->CreateFixture(&fixtureDef);
    
    return body;
}

//有一点需要注意的是categoryBits和maskBits。它们是用来过滤物体之间的碰撞的，如果一个物体的category bit与另一个物体的mask bit匹配，他们之间就有碰撞。你把他们设置为0，因为你希望它在初始化的时候没有任何碰撞。
//你定义了两个方法简单的操纵categoryBits 和 maskBits，以此来控制PolygonSprite是否开启碰撞
-(void)activateCollisions
{
    b2Fixture *fixture = _body->GetFixtureList();
    b2Filter filter = fixture->GetFilterData();
    filter.categoryBits = 0x0001;
    filter.maskBits = 0x0001;
    fixture->SetFilterData(filter);
}

-(void)deactivateCollisions
{
    b2Fixture *fixture = _body->GetFixtureList();
    b2Filter filter = fixture->GetFilterData();
    filter.categoryBits = 0;
    filter.maskBits = 0;
    fixture->SetFilterData(filter);
}

-(CGAffineTransform) nodeToParentTransform
{
    b2Vec2 pos  = _body->GetPosition();
    
    float x = pos.x * PTM_RATIO;
    float y = pos.y * PTM_RATIO;
    
    if ( !_ignoreAnchorPointForPosition) {
        x += _anchorPointInPoints.x;
        y += _anchorPointInPoints.y;
    }
    
    // Make matrix
    float radians = _body->GetAngle();
    float c = cosf(radians);
    float s = sinf(radians);
    
    if( ! CGPointEqualToPoint(_anchorPointInPoints, CGPointZero) ){
        x += c*-_anchorPointInPoints.x+ -s*-_anchorPointInPoints.y;
        y += s*-_anchorPointInPoints.x+ c*-_anchorPointInPoints.y;
    }
    
    // Rot, Translate Matrix
    _transform = CGAffineTransformMake( c,  s,
                                       -s,c,
                                       x,y );
    
    return _transform;
}


@end








































