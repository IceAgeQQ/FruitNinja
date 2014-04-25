//
//  HelloWorldLayer.mm
//  CutCutCut
//
<<<<<<< HEAD
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
=======
//  Created by Chao Xu on 13-10-23.
//  Copyright Chao Xu 2013年. All rights reserved.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
//

// Import the interfaces
#import "HelloWorldLayer.h"

<<<<<<< HEAD
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"


=======
// Not included in "cocos2d.h"
#import "CCPhysicsSprite.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#import "Watermelon.h"
#import "Strawberry.h"
#import "Pineapple.h"
#import "Grapes.h"
#import "Banana.h"
#import "Bomb.h"
<<<<<<< HEAD

=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
enum {
	kTagParentNode = 1,
};


#pragma mark - HelloWorldLayer

@interface HelloWorldLayer()
-(void) initPhysics;
-(void) addNewSpriteAtPosition:(CGPoint)p;
-(void) createMenu;
@end
<<<<<<< HEAD

/*
 * A function that compares two b2Vec2's x coordinate
 * Built to follow the requirements of the qsort function
 * http://www.cplusplus.com/reference/clibrary/cstdlib/qsort/
 */
int comparator(const void *a, const void *b) {
    const b2Vec2 *va = (const b2Vec2 *)a;
    const b2Vec2 *vb = (const b2Vec2 *)b;
    
    if (va->x > vb->x) {
        return 1;
    } else if (va->x < vb->x) {
        return -1;
    }
    return 0;    
}


=======
int comparator(const void *a,const void *b){
    const b2Vec2 *va = (const b2Vec2 *)a;
    const b2Vec2 *vb = (const b2Vec2 *)b;
    if (va ->x > vb ->x) {
        return  1;
    }else if (va ->x < vb ->x){
        return  -1;
    }
    return 0;
}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@implementation HelloWorldLayer
@synthesize cache = _cache;
@synthesize blades = _blades;
@synthesize swoosh = _swoosh;
<<<<<<< HEAD

=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
<<<<<<< HEAD

/*
 * The main init method
 */
-(id) init
{
	if( (self=[super init])) {
		// enable events
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = YES;
		CGSize s = [CCDirector sharedDirector].winSize;
		
		// init physics
		[self initPhysics];
        [self initBackground];
        [self initSprites];
        [self initHUD];
        
        // initialize variables for toss mechanic
        _nextTossTime = CACurrentMediaTime() + 1;
        _queuedForToss = 0;

        // initialize variables for cutting
        _raycastCallback = new RaycastCallback();
        
        // initialize the blade effect
        _deltaRemainder = 0.0;
        _blades = [[CCArray alloc] initWithCapacity:3];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"streak.png"];
        
        for (int i = 0; i < 3; i++)
        {
            CCBlade *blade = [CCBlade bladeWithMaximumPoint:50];
            blade.autoDim = NO;
            blade.texture = texture;
            
            [self addChild:blade z:2];
            [_blades addObject:blade];
        }
        
        // initialize the blade sparkle particle effect
        _bladeSparkle = [CCParticleSystemQuad particleWithFile:@"blade_sparkle.plist"];
        [_bladeSparkle stopSystem];
        [self addChild:_bladeSparkle z:3];
        
        // initialize all sound effects
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"swoosh.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"squash.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"toss_consecutive.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"toss_simultaneous.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"toss_bomb.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"lose_life.caf"];
        _swoosh = [[[SimpleAudioEngine sharedEngine] soundSourceForFile:@"swoosh.caf"] retain];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"nature_bgm.aifc"];
        _timeCurrent = 0;
        _timePrevious = 0;

		[self scheduleUpdate];
	}
	return self;
}

/*
 * Initializes everything in the background
 */
-(void)initBackground
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    // add the background image
    CCSprite *background = [CCSprite spriteWithFile:@"bg.png"];
    background.position = ccp(screen.width/2,screen.height/2);
    [self addChild:background z:0];
    
    // add the particle effect
    CCParticleSystemQuad *sunPollen = [CCParticleSystemQuad particleWithFile:@"sun_pollen.plist"];
    [self addChild:sunPollen];
}

/*
 * Initializes the sprite cache and populates it with sprites
 */
-(void)initSprites
{
    // allocate the a cache
    _cache = [[CCArray alloc] initWithCapacity:53];
    
    // create fruits
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Watermelon alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [self addChild:sprite.splurt z:3];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Strawberry alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [self addChild:sprite.splurt z:3];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Pineapple alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [self addChild:sprite.splurt z:3];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Grapes alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [self addChild:sprite.splurt z:3];
        [_cache addObject:sprite];
    }
    for (int i = 0; i < 10; i++)
    {
        PolygonSprite *sprite = [[Banana alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [self addChild:sprite.splurt z:3];
        [_cache addObject:sprite];
    }
    
    // create bombs
    for (int i = 0; i < 3; i++)
    {
        PolygonSprite *sprite = [[Bomb alloc] initWithWorld:world];
        sprite.position = ccp(-64*(i+1),-64);
        [self addChild:sprite z:1];
        [self addChild:sprite.splurt z:3];
        [_cache addObject:sprite];
    }
}

/*
 * Initializes the Box2D physics world
 */
-(void) initPhysics
{
	
	CGSize s = [[CCDirector sharedDirector] winSize];
	
	b2Vec2 gravity;
	gravity.Set(0.0f, -4.25f);
	world = new b2World(gravity);
	
	// Do we want to let bodies sleep?
	world->SetAllowSleeping(true);
	
	world->SetContinuousPhysics(true);
	
	m_debugDraw = new GLESDebugDraw( PTM_RATIO );
	world->SetDebugDraw(m_debugDraw);
	
	uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
	//		flags += b2Draw::e_jointBit;
	//		flags += b2Draw::e_aabbBit;
	//		flags += b2Draw::e_pairBit;
	//		flags += b2Draw::e_centerOfMassBit;
	m_debugDraw->SetFlags(flags);		
	
	
	// Define the ground body.
	b2BodyDef groundBodyDef;
	groundBodyDef.position.Set(0, 0); // bottom-left corner
	
	// Call the body factory which allocates memory for the ground body
	// from a pool and creates the ground box shape (also from a pool).
	// The body is also added to the world.
	b2Body* groundBody = world->CreateBody(&groundBodyDef);
	
	// Define the ground box shape.
	b2EdgeShape groundBox;		
	
	// bottom
	/*
	groundBox.Set(b2Vec2(0,0), b2Vec2(s.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// top
	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO));
	groundBody->CreateFixture(&groundBox,0);
	
	// left
	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// right
	groundBox.Set(b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO), b2Vec2(s.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);*/
}

/*
 * Initializes the score and lives
 */
-(void)initHUD
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    _cuts = 0;
    _lives = 3;
    
    // add unfilled crosses at the upper right corner of the screen
    for (int i = 0; i < 3; i++)
    {
        CCSprite *cross = [CCSprite spriteWithFile:@"x_unfilled.png"];
        cross.position = ccp(screen.width - cross.contentSize.width/2 - i*cross.contentSize.width, screen.height - cross.contentSize.height/2);
        [self addChild:cross z:4];
    }
    
    // add an icon to represent the score
    CCSprite *cutsIcon = [CCSprite spriteWithFile:@"fruit_cut.png"];
    cutsIcon.position = ccp(cutsIcon.contentSize.width/2, screen.height - cutsIcon.contentSize.height/2);
    [self addChild:cutsIcon];
    
    // add a label that shows the score
    _cutsLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Helvetica Neue" fontSize:30];
    _cutsLabel.anchorPoint = ccp(0, 0.5);
    _cutsLabel.position = ccp(cutsIcon.position.x + cutsIcon.contentSize.width/2 +                _cutsLabel.contentSize.width/2,cutsIcon.position.y);
    [self addChild:_cutsLabel z:4];
}

#pragma mark - Drawing
/*
 * Draws additional stuff to the scene
 */
-(void) draw
{
	//
	// IMPORTANT:
	// This is only for debug purposes
	// It is recommend to disable it
	//
	[super draw];
	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	
	kmGLPushMatrix();
    
    //ccDrawLine(_startPoint, _endPoint);
	//world->DrawDebugData();	
	
	kmGLPopMatrix();
}

#pragma mark - Polygon Splitting

/*
 * Splits a PolygonSprite into two new PolygonSprites
 */
=======
-(void)spriteLoop{
    double curTime = CACurrentMediaTime();
    
    //step 1 通过比较当前时间和nextTossTime，检查是否到了下一次抛水果的时间。
    if (curTime > _nextTossTime)
    {
        PolygonSprite *sprite;
        int chance = arc4random()%8;
        if (chance == 0) {
            CCARRAY_FOREACH(_cache, sprite){
                if (sprite.state == kStateIdle && sprite.type == kTypeBomb) {
                    [self tossSprite:sprite];
                    [[SimpleAudioEngine sharedEngine]playEffect:@"toss_bomb.caf"];
                    break;
                }
            }
        }
        
        int random = random_range(0, 4);
        //step 2 如果在consecutive模式中还有在队列中的水果等待被抛起，那么抛起它并直接进入阶段6.
        Type type = (Type)random;
        if (_currentTossType == kTossConsecutive && _queuedForToss > 0)
        {
            CCARRAY_FOREACH(_cache, sprite)
            {
                if (sprite.state == kStateIdle && sprite.type == type)
                {
                    [self tossSprite:sprite];
                    _queuedForToss--;
                    [[SimpleAudioEngine sharedEngine]playEffect:@"toss_consecutive.caf"];
                    break;
                }
            }
        }
        else
        { //step 3 从consecutive和simultaneous抛水果模式中选择其一，并设置一个被抛弃的水果的数量。
            _queuedForToss = random_range(3, 8);
            int tossType = random_range(0,1);
            
            _currentTossType = (TossType)tossType;
            [[SimpleAudioEngine sharedEngine]playEffect:@"toss_consecutice.caf"];
            //step 4 同时抛起随机数量的水果。注意水果tpye的范围从0到4因为你并不想包含Bomb（炸弹）类型。
            if (_currentTossType == kTossSimultaneous)
            {
                CCARRAY_FOREACH(_cache, sprite)
                {
                    if (sprite.state == kStateIdle && sprite.type == type)
                    {
                        [self tossSprite:sprite];
                        _queuedForToss--;
                        [[SimpleAudioEngine sharedEngine]playEffect:@"toss_simultaneous.caf"];
                        random = random_range(0, 4);
                        type = (Type)random;
                        
                        if (_queuedForToss == 0)
                        {
                            break;
                        }
                    }
                }
            } //step 5 与阶段2类似。检测如果是consecutive模式，就抛起第一个水果并进入阶段6.

            else if (_currentTossType == kTossConsecutive)
            {
                CCARRAY_FOREACH(_cache, sprite)
                {
                    if (sprite.state == kStateIdle && sprite.type == type)
                    {
                        [self tossSprite:sprite];
                        _queuedForToss--;
                        [[SimpleAudioEngine sharedEngine]playEffect:@"toss_consecutice.caf"];
                        break;
                    }
                }
            }
        }
        //step 6 设置两次抛水果的间隔时间。当所有的水果都抛完后，你随机取一个较长的间隔时间，否则，说明你当前处在consecutive模式，那么就随机取一个较短的间隔时间。
        if (_queuedForToss == 0)
        {
            _tossInterval = frandom_range(2,3);
            _nextTossTime = curTime + _tossInterval;
        }
        else
        {
            _tossInterval = frandom_range(0.3,0.8);
            _nextTossTime = curTime + _tossInterval;
        }
    }
}


//这个方式赋予在屏幕下方的sprite一个随机位置，并计算出一个随机的速度。min和max根据当前位置限制速度，让sprite不会太偏左，也不会太偏右。
-(void)tossSprite:(PolygonSprite*)sprite
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    CGPoint randomPosition = ccp(frandom_range(100, screen.width-164), -64);
    float randomAngularVelocity = frandom_range(-1, 1);
    
    float xModifier = 50*(randomPosition.x - 100)/(screen.width - 264);
    float min = -25.0 - xModifier;
    float max = 75.0 - xModifier;
    
    float randomXVelocity = frandom_range(min,max);
    float randomYVelocity = frandom_range(250, 300);
    
    sprite.state = kStateTossed;
    sprite.position = randomPosition;
    [sprite activateCollisions];
    sprite.body->SetLinearVelocity(b2Vec2(randomXVelocity/PTM_RATIO,randomYVelocity/PTM_RATIO));
    sprite.body->SetAngularVelocity(randomAngularVelocity);
}
-(void)clearSlices{
    for(b2Body* b = world ->GetBodyList();b;b = b->GetNext()){
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite *)b -> GetUserData();
            sprite.sliceEntered = NO;
            sprite.sliceExited = NO;
        }
    }
}
-(void)checkAndSliceObjects{
    double curTime = CACurrentMediaTime();
    for(b2Body *b = world -> GetBodyList();b;b=b->GetNext()){
        if (b->GetUserData()!=NULL) {
            PolygonSprite *sprite = (PolygonSprite *)b->GetUserData();
            if (sprite.sliceEntered && curTime > sprite.sliceEntryTime) {
                sprite.sliceEntered = NO;
            }else if (sprite.sliceEntered && sprite.sliceExited){
                [self splitPolygonSprite:sprite];
            }
        }
    }
}
// 此方法创建了活跃的可以和其他body产生碰撞的Box2D body。
-(b2Body *)createBodyWithPosition:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2 *)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution{
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position = position;
    bodyDef.angle =rotation;
    b2Body *body = world -> CreateBody(&bodyDef);
    
    b2FixtureDef fixtureDef;
    fixtureDef.density = density;
    fixtureDef.friction = friction;
    fixtureDef.restitution = restitution;
    
    b2PolygonShape shape;
    shape.Set(vertices, count);
    fixtureDef.shape = &shape;
    body -> CreateFixture(&fixtureDef);
    
    return body;
}
//此方法按照逆时针的顺序重排顶点。它使用qsort方法按x坐标升序排列，然后使用determinants来完成最终的重排。
-(b2Vec2 *)arrangeVertices:(b2Vec2 *)vertices count:(int)count{
    float determinant;
    int iCounterClockWise = 1;
    int iClockWise = count -1;
    int i;
    b2Vec2 referencePointA,referencePointB;
    b2Vec2 *sortedVertices = (b2Vec2 *)calloc(count, sizeof(b2Vec2));
    //sort all vertices in ascending order according to their x-coordinate so you can get two points of a line
    //comparator: 此方法被qsort使用，它完成顶点比较并返回结果给qsort。
    qsort(vertices, count, sizeof(b2Vec2), comparator );
    sortedVertices[0] = vertices[0];
    referencePointA = vertices[0];
    referencePointB = vertices[count -1];
    //you arrange the points by filling our vertices in both clockwise and counter-clockwise directons using the determinant function
    for(i=1;i<count-1;i++){
        determinant = calculate_determinant_2x3(referencePointA.x, referencePointA.y, referencePointB.x , referencePointB.y, vertices[i].x , vertices[i].y);
        if (determinant <0) {
            sortedVertices[iCounterClockWise++] = vertices[i];
        }else{
            sortedVertices[iClockWise --] = vertices[i];
        }
    }
    sortedVertices[iCounterClockWise] = vertices[count -1];
    return sortedVertices;
}
//areVerticesAcceptable: 目前，此方法假设所有的顶点都是合理的。
-(BOOL)areVerticesAcceptable:(b2Vec2 *)vertices count:(int)count{
    //check 1: polygons need to at least have 3 vertices
    //一个多边形至少需要3个顶点。
    if (count < 3)
    {
        return NO;
    }
    
    //check 2: the number of vertices cannot exceed b2_maxPolygonVertices
    //多边形的顶点数最多不能超过预定义的b2_maxPolygonVertices，目前是6
    if (count > b2_maxPolygonVertices)
    {
        return NO;
    }
    
    //check 3: Box2D needs the distance from each vertex to be greater than b2_epsilon
    //每个顶点之间的距离必须大于b2_epsilon。
    int32 i;
    for (i=0; i<count; ++i)
    {
        int32 i1 = i;
        int32 i2 = i + 1 < count ? i + 1 : 0;
        b2Vec2 edge = vertices[i2] - vertices[i1];
        if (edge.LengthSquared() <= b2_epsilon * b2_epsilon)
        {
            return NO;
        }
    }
    
    //check 4: Box2D needs the area of a polygon to be greater than b2_epsilon
    float32 area = 0.0f;
    
    b2Vec2 pRef(0.0f,0.0f);
    
    for (i=0; i<count; ++i)
    {
        b2Vec2 p1 = pRef;
        b2Vec2 p2 = vertices[i];
        b2Vec2 p3 = i + 1 < count ? vertices[i+1] : vertices[0];
        
        b2Vec2 e1 = p2 - p1;
        b2Vec2 e2 = p3 - p1;
        
        float32 D = b2Cross(e1, e2);
        
        float32 triangleArea = 0.5f * D;
        area += triangleArea;
    }
    
    if (area <= 0.0001)
    {
        return NO;
    }
    
    //check 5: Box2D requires that the shape be Convex.
    float determinant;
    float referenceDeterminant;
    b2Vec2 v1 = vertices[0] - vertices[count-1];
    b2Vec2 v2 = vertices[1] - vertices[0];
    referenceDeterminant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
    
    for (i=1; i<count-1; i++)
    {
        v1 = v2;
        v2 = vertices[i+1] - vertices[i];
        determinant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
        //you use the determinant to check direction from one point to another. A convex shape's points should only go around in one direction. The sign of the determinant determines that direction. If the sign of the determinant changes mid-way, then you have a concave shape.
        if (referenceDeterminant * determinant < 0.0f)
        {
            //if multiplying two determinants result to a negative value, you know that the sign of both numbers differ, hence it is concave
            return NO;
        }
    }
    v1 = v2;
    v2 = vertices[0]-vertices[count-1];
    determinant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
    if (referenceDeterminant * determinant < 0.0f)
    {
        return NO;
    }
    return YES;
}
-(void)cleanSprites
{
    PolygonSprite *sprite;
    
    //we check for all tossed sprites that have dropped offscreen and reset them
    CCARRAY_FOREACH(_cache, sprite)
    {
        if (sprite.state == kStateTossed)
        {
            CGPoint spritePosition = ccp(sprite.body->GetPosition().x*PTM_RATIO,sprite.body->GetPosition().y*PTM_RATIO);
            float yVelocity = sprite.body->GetLinearVelocity().y;
            
            //this means the sprite has dropped offscreen
            if (spritePosition.y < -64 && yVelocity < 0)
            {
                sprite.state = kStateIdle;
                sprite.sliceEntered = NO;
                sprite.sliceExited = NO;
                sprite.entryPoint.SetZero();
                sprite.exitPoint.SetZero();
                sprite.position = ccp(-64,-64);
                sprite.body->SetLinearVelocity(b2Vec2(0.0,0.0));
                sprite.body->SetAngularVelocity(0.0);
                [sprite deactivateCollisions];
                if (sprite.type != kTypeBomb) {
                    [self substractLife];
                }
            }
        }
    }
    
    //we check for all sliced pieces that have dropped offscreen and remove them
    CGSize screen = [[CCDirector sharedDirector] winSize];
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            CGPoint position = ccp(b->GetPosition().x*PTM_RATIO,b->GetPosition().y*PTM_RATIO);
            if (position.x < -64 || position.x > screen.width || position.y < -64)
            {
                if (!sprite.original)
                {
                    world->DestroyBody(sprite.body);
                    [self removeChild:sprite cleanup:YES];
                }
            }
        }
    }
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void)splitPolygonSprite:(PolygonSprite*)sprite
{
    //declare & initialize variables to be used for later
    PolygonSprite *newSprite1, *newSprite2;
    
    //our original shape's attributes
    b2Fixture *originalFixture = sprite.body->GetFixtureList();
    b2PolygonShape *originalPolygon = (b2PolygonShape*)originalFixture->GetShape();
    int vertexCount = originalPolygon->GetVertexCount();
    
<<<<<<< HEAD
    for (int i = 0 ; i < vertexCount; i++)
    {
        b2Vec2 point = originalPolygon->GetVertex(i);
    }
    
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    //our determinant(to be described later) and iterator
    float determinant;
    int i;
    
<<<<<<< HEAD
    //we store the vertices of our two new sprites here
=======
    //you store the vertices of our two new sprites here
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    b2Vec2 *sprite1Vertices = (b2Vec2*)calloc(24, sizeof(b2Vec2));
    b2Vec2 *sprite2Vertices = (b2Vec2*)calloc(24, sizeof(b2Vec2));
    b2Vec2 *sprite1VerticesSorted, *sprite2VerticesSorted;
    
<<<<<<< HEAD
    //we store how many vertices there are for each of the two new sprites here
=======
    //you store how many vertices there are for each of the two new sprites here
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    int sprite1VertexCount = 0;
    int sprite2VertexCount = 0;
    
    //step 1:
<<<<<<< HEAD
    //the entry and exit point of our cut are considered vertices of our two new shapes, so we add these before anything else
=======
    //the entry and exit point of our cut are considered vertices of our two new shapes, so you add these before anything else
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    sprite1Vertices[sprite1VertexCount++] = sprite.entryPoint;
    sprite1Vertices[sprite1VertexCount++] = sprite.exitPoint;
    sprite2Vertices[sprite2VertexCount++] = sprite.entryPoint;
    sprite2Vertices[sprite2VertexCount++] = sprite.exitPoint;
    
    //step 2:
<<<<<<< HEAD
    //iterate through all the vertices clockwise and counter-clockwise from the cutting line, and add them to each sprite's shape
=======
    //iterate through all the vertices and add them to each sprite's shape
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    for (i=0; i<vertexCount; i++)
    {
        //get our vertex from the polygon
        b2Vec2 point = originalPolygon->GetVertex(i);
        
<<<<<<< HEAD
        //we check if our point is not the same as our entry or exit point first
=======
        //you check if our point is not the same as our entry or exit point first
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        b2Vec2 diffFromEntryPoint = point - sprite.entryPoint;
        b2Vec2 diffFromExitPoint = point - sprite.exitPoint;
        
        if ((diffFromEntryPoint.x == 0 && diffFromEntryPoint.y == 0) || (diffFromExitPoint.x == 0 && diffFromExitPoint.y == 0))
        {
        }
<<<<<<< HEAD
        else 
        {
            //mathematically determine the direction of a point
=======
        else
        {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
            determinant = calculate_determinant_2x3(sprite.entryPoint.x, sprite.entryPoint.y, sprite.exitPoint.x, sprite.exitPoint.y, point.x, point.y);
            
            if (determinant > 0)
            {
                //if the determinant is positive, then the three points are in clockwise order
                sprite1Vertices[sprite1VertexCount++] = point;
            }
            else
            {
                //if the determinant is 0, the points are on the same line. if the determinant is negative, then they are in counter-clockwise order
                sprite2Vertices[sprite2VertexCount++] = point;
<<<<<<< HEAD
=======
                
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
            }//endif
        }//endif
    }//endfor
    
    //step 3:
<<<<<<< HEAD
    //Box2D needs vertices to be arranged in counter-clockwise order so we reorder our points using a custom function
    sprite1VerticesSorted = [self arrangeVertices:sprite1Vertices count:sprite1VertexCount];
    sprite2VerticesSorted = [self arrangeVertices:sprite2Vertices count:sprite2VertexCount];
    
    //step 4:
    //Box2D has some restrictions with defining shapes, so we have to consider these. We only cut the shape if both shapes pass certain requirements from our function
=======
    //Box2D needs vertices to be arranged in counter-clockwise order so you reorder our points using a custom function
    sprite1VerticesSorted = [self arrangeVertices:sprite1Vertices count:sprite1VertexCount];
    sprite2VerticesSorted = [self arrangeVertices:sprite2Vertices count:sprite2VertexCount];
    
    //step 4:这一步确保了这些经过重新排列的顶点满足Box2D的定义多边形的规则。如果areVerticesAcceptable方法认为这些顶点是不满足条件的，那么就把本次切割的信息从原sprite中移除。
    //Box2D has some restrictions with defining shapes, so you have to consider these. You only cut the shape if both shapes pass certain requirements from our function
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    BOOL sprite1VerticesAcceptable = [self areVerticesAcceptable:sprite1VerticesSorted count:sprite1VertexCount];
    BOOL sprite2VerticesAcceptable = [self areVerticesAcceptable:sprite2VerticesSorted count:sprite2VertexCount];
    
    //step 5:
<<<<<<< HEAD
    //we destroy the old shape and create the new shapes and sprites
    if (sprite1VerticesAcceptable && sprite2VerticesAcceptable)
    {
        b2Vec2 worldEntry = sprite.body->GetWorldPoint(sprite.entryPoint);
        b2Vec2 worldExit = sprite.body->GetWorldPoint(sprite.exitPoint);
        float angle = ccpToAngle(ccpSub(ccp(worldExit.x,worldExit.y), ccp(worldEntry.x,worldEntry.y)));
        CGPoint vector1 = ccpForAngle(angle + 1.570796);
        CGPoint vector2 = ccpForAngle(angle - 1.570796);
        
        //calculate the midpoint based on world coordinates
        float midX = midpoint(worldEntry.x, worldExit.x);
        float midY = midpoint(worldEntry.y, worldExit.y);

        //create the first sprite's body        
        b2Body *body1 = [self createBodyWithPosition:sprite.body->GetPosition() rotation:sprite.body->GetAngle() vertices:sprite1VerticesSorted vertexCount:sprite1VertexCount density:originalFixture->GetDensity() friction:originalFixture->GetFriction() restitution:originalFixture->GetRestitution()];
        
        //create the first sprite
        newSprite1 = [PolygonSprite spriteWithTexture:sprite.texture body:body1 original:NO];
        [self addChild:newSprite1 z:1];
        
        //push the sprite away from the second sprite
        newSprite1.body->ApplyLinearImpulse(b2Vec2(2*body1->GetMass()*vector1.x,2*body1->GetMass()*vector1.y), b2Vec2(midX,midY));
=======
    //you destroy the old shape and create the new shapes and sprites
    if (sprite1VerticesAcceptable && sprite2VerticesAcceptable)
    {
        _cuts ++;
        [_cutsLabel setString:[NSString stringWithFormat:@"%d",_cuts]];
        b2Vec2 worldEntry = sprite.body -> GetWorldPoint(sprite.entryPoint);
        b2Vec2 worldExit = sprite.body -> GetWorldPoint(sprite.exitPoint);
        float angle = ccpToAngle(ccpSub(ccp(worldExit.x,worldExit.y), ccp(worldEntry.x, worldEntry.y)));
        CGPoint vector1 = ccpForAngle(angle + 1.570796);
        CGPoint vector2 = ccpForAngle(angle - 1.570796);
        float midX = midpoint(worldEntry.x, worldExit.x);
        float midY = midpoint(worldEntry.y, worldExit.y);

        //create the first sprite's body
        b2Body *body1 = [self createBodyWithPosition:sprite.body->GetPosition() rotation:sprite.body->GetAngle() vertices:sprite1VerticesSorted vertexCount:sprite1VertexCount density:originalFixture->GetDensity() friction:originalFixture->GetFriction() restitution:originalFixture->GetRestitution()];
        
        //create the first sprite
        
        newSprite1 = [PolygonSprite spriteWithTexture:sprite.texture body:body1 original:NO];
        [self addChild:newSprite1 z:1];
        //为了把两片sprite推开，你对它们分别施加了linear impulse（线性冲量），作用点为线段中心，方向相反。此冲量基于每个body的质量，所以两个物体所受的推力基本上是一致的。更大的sprite会得到更大的冲量，更小的sprite会得到更小的冲量。
        newSprite1.body -> ApplyLinearImpulse(b2Vec2(2*body1 ->GetMass()*vector1.x,2*body1 -> GetMass()*vector1.y), b2Vec2(midX,midY));
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        
        //create the second sprite's body
        b2Body *body2 = [self createBodyWithPosition:sprite.body->GetPosition() rotation:sprite.body->GetAngle() vertices:sprite2VerticesSorted vertexCount:sprite2VertexCount density:originalFixture->GetDensity() friction:originalFixture->GetFriction() restitution:originalFixture->GetRestitution()];
        
        //create the second sprite
        newSprite2 = [PolygonSprite spriteWithTexture:sprite.texture body:body2 original:NO];
        [self addChild:newSprite2 z:1];
<<<<<<< HEAD
        
        //push the sprite away from the first sprite
        newSprite2.body->ApplyLinearImpulse(b2Vec2(2*body2->GetMass()*vector2.x,2*body2->GetMass()*vector2.y), b2Vec2(midX,midY));
        
        //we don't need the old shape & sprite anymore so we either destroy it or squirrel it away
        if (sprite.original)
        {   
            //particles should appear in the middle of the cut
            b2Vec2 convertedWorldEntry = b2Vec2(worldEntry.x*PTM_RATIO,worldEntry.y*PTM_RATIO);
            b2Vec2 convertedWorldExit = b2Vec2(worldExit.x*PTM_RATIO,worldExit.y*PTM_RATIO);
            float midX = midpoint(convertedWorldEntry.x, convertedWorldExit.x);
            float midY = midpoint(convertedWorldEntry.y, convertedWorldExit.y);
            sprite.splurt.position = ccp(midX,midY);
            [sprite.splurt resetSystem];

            //reset the state of the sprite
            sprite.state = kStateIdle; 
=======
        newSprite2.body->ApplyLinearImpulse(b2Vec2(2*body2->GetMass()*vector2.x,2*body2->GetMass()*vector2.y), b2Vec2(midX,midY));
        
        //you don't need the old shape & sprite anymore so you either destroy it or squirrel it away
        if (sprite.original)
            
        {
            
            sprite.state = kStateIdle;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
            [sprite deactivateCollisions];
            sprite.position = ccp(-256,-256);   //cast them faraway
            sprite.sliceEntered = NO;
            sprite.sliceExited = NO;
            sprite.entryPoint.SetZero();
            sprite.exitPoint.SetZero();
<<<<<<< HEAD
            
            if (sprite.type == kTypeBomb)
            {
                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion.caf"];
                [self subtractLife];
            }
            else
            {
                [[SimpleAudioEngine sharedEngine] playEffect:@"squash.caf"];
            }

        }
        else 
        {
            [[SimpleAudioEngine sharedEngine] playEffect:@"smallcut.caf"];
            world->DestroyBody(sprite.body);
            [self removeChild:sprite cleanup:YES];
        }
        _cuts++;
        [_cutsLabel setString:[NSString stringWithFormat:@"%d",_cuts]];
=======
            b2Vec2 convertedWorldEntry = b2Vec2(worldEntry.x*PTM_RATIO,worldEntry.y*PTM_RATIO);
            b2Vec2 convertedWorldExit = b2Vec2(worldExit.x*PTM_RATIO,worldExit.y*PTM_RATIO);
            float midX = midpoint(convertedWorldEntry.x, convertedWorldExit.x);
            float midY = midpoint(convertedWorldEntry.y, convertedWorldExit.y);
            sprite.splurt.position = ccp(midX,midY);
            [sprite.splurt resetSystem];
            //然后在splitPolygonSprite方法检查sprite是否被切割的位置同样检查炸弹，如果划到了一颗炸弹，那么就调用subtractLife减少玩家1条命。
            if (sprite.type == kTypeBomb) {
                [[SimpleAudioEngine sharedEngine]playEffect:@"explosion.caf"];
                [self substractLife];
            }
            else{
                [[SimpleAudioEngine sharedEngine]playEffect:@"squash.caf"];
            }
        }
        else
        {   [[SimpleAudioEngine sharedEngine]playEffect:@"smallcut.caf"];
            world->DestroyBody(sprite.body);
            [self removeChild:sprite cleanup:YES];
        }
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    }
    else
    {
        sprite.sliceEntered = NO;
        sprite.sliceExited = NO;
    }
    
    //free up our allocated vectors
    free(sprite1VerticesSorted);
    free(sprite2VerticesSorted);
    free(sprite1Vertices);
    free(sprite2Vertices);
}
<<<<<<< HEAD

/*
 * Creates a Box2D body for polygons that have been split
 */
-(b2Body*)createBodyWithPosition:(b2Vec2)position rotation:(float)rotation vertices:(b2Vec2*)vertices vertexCount:(int32)count density:(float)density friction:(float)friction restitution:(float)restitution
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
    
    b2PolygonShape shape;
    shape.Set(vertices, count);
    fixtureDef.shape = &shape;
    body->CreateFixture(&fixtureDef);
    
    return body;
}

/*
 * Arranges all given points in a counter clockwise order
 */
-(b2Vec2*)arrangeVertices:(b2Vec2*)vertices count:(int)count
{
    float determinant;
    int iCounterClockWise = 1;
    int iClockWise = count - 1;
    int i;
    
    b2Vec2 referencePointA,referencePointB;
    b2Vec2 *sortedVertices = (b2Vec2*)calloc(count, sizeof(b2Vec2));
    
    // sort all vertices in ascending order according to their x-coordinate so we can get two points of a line
    qsort(vertices, count, sizeof(b2Vec2), comparator);
    
    sortedVertices[0] = vertices[0];
    referencePointA = vertices[0];          //leftmost point
    referencePointB = vertices[count-1];    //rightmost point
    
    // we arrange the points by filling our vertices in both clockwise and counter-clockwise directions using the determinant function
    for (i=1;i<count-1;i++)
    {
        determinant = calculate_determinant_2x3(referencePointA.x, referencePointA.y, referencePointB.x, referencePointB.y, vertices[i].x, vertices[i].y);
        if (determinant<0)
        {
            sortedVertices[iCounterClockWise++] = vertices[i];
        }
        else 
        {
            sortedVertices[iClockWise--] = vertices[i];
        }//endif
    }//endif
    
    sortedVertices[iCounterClockWise] = vertices[count-1];
    return sortedVertices;
}

/*
 * Determines if a shape's vertices are acceptable by Box2D standards
 */
-(BOOL)areVerticesAcceptable:(b2Vec2*)vertices count:(int)count
{
    //check 1: polygons need to at least have 3 vertices
    if (count < 3)
    {
        return NO;
    }
    
    //check 2: the number of vertices cannot exceed b2_maxPolygonVertices
    if (count > b2_maxPolygonVertices)
    {
        return NO;
    }
    
    //check 3: Box2D needs the distance from each vertex to be greater than b2_epsilon
    int32 i;
    for (i=0; i<count; ++i)
    {
        int32 i1 = i;
        int32 i2 = i + 1 < count ? i + 1 : 0;
        b2Vec2 edge = vertices[i2] - vertices[i1];
        if (edge.LengthSquared() <= b2_epsilon * b2_epsilon)
        {
            return NO;
        }
    }
    
    //check 4: Box2D needs the area of a polygon to be greater than b2_epsilon
    float32 area = 0.0f;
    
    b2Vec2 pRef(0.0f,0.0f);
    
    for (i=0; i<count; ++i)
    {
        b2Vec2 p1 = pRef;
        b2Vec2 p2 = vertices[i];
        b2Vec2 p3 = i + 1 < count ? vertices[i+1] : vertices[0];
        
        b2Vec2 e1 = p2 - p1;
        b2Vec2 e2 = p3 - p1;
        
        float32 D = b2Cross(e1, e2);
        
        float32 triangleArea = 0.5f * D;
        area += triangleArea;
    }
    
    //we assign a value of 0.0001 since anything further is too small to see anyway
    if (area <= 0.0001)
    {
        return NO;
    }
    
    //check 5: Box2D requires that the shape be Convex.
    float determinant;
    float referenceDeterminant;
    b2Vec2 v1 = vertices[0] - vertices[count-1];
    b2Vec2 v2 = vertices[1] - vertices[0];
    referenceDeterminant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
    
    for (i=1; i<count-1; i++)
    {
        v1 = v2;
        v2 = vertices[i+1] - vertices[i];
        determinant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
        //we use the determinant to check direction from one point to another. A convex shape's points should only go around in one direction. The sign of the determinant determines that direction. If the sign of the determinant changes mid-way, then we have a concave shape.
        if (referenceDeterminant * determinant < 0.0f)
        {
            //if multiplying two determinants result to a negative value, we know that the sign of both numbers differ, hence it is concave
            return NO;
        }
    }
    //check the last two vertices
    v1 = v2;
    v2 = vertices[0]-vertices[count-1];
    determinant = calculate_determinant_2x2(v1.x, v1.y, v2.x, v2.y);
    if (referenceDeterminant * determinant < 0.0f)
    {
        return NO;
    }
    
    //passed all tests
    return YES;
}

/*
 * Responsible for checking all sprites that have been cut, and splits them.
 */
-(void)checkAndSliceObjects
{
    double curTime = CACurrentMediaTime();
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            
            if (sprite.sliceEntered && curTime > sprite.sliceEntryTime) 
            {
                //if the sprite entry time has expired, reset the state of the sprite
                sprite.sliceEntered = NO;
            }
            else if (sprite.sliceEntered && sprite.sliceExited)
            {
                //if the sprite has been cut, then split the sprite
                [self splitPolygonSprite:sprite];
            }
        }
    }
}


/*
 * Removes all slice entry and exit points of all PolygonSprites
 */
-(void)clearSlices
{
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            sprite.sliceEntered = NO;
            sprite.sliceExited = NO;
        }
    }
}

#pragma mark - Game Logic

/*
 * Assigns a random position, linear, and angular velocity to a sprite.
 */
-(void)tossSprite:(PolygonSprite*)sprite
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    //set a random position and rotation rate
    CGPoint randomPosition = ccp(frandom_range(100, screen.width-164), -64);
    float randomAngularVelocity = frandom_range(-1, 1);
    
    //limit the velocity based on their position so that sprites aren't tossed offscreen
    float xModifier = 50*(randomPosition.x - 100)/(screen.width - 264);
    float min = -25.0 - xModifier;
    float max = 75.0 - xModifier;
    
    float randomXVelocity = frandom_range(min,max);
    float randomYVelocity = frandom_range(250, 300);
    
    //activate and toss the sprite
    sprite.state = kStateTossed;
    sprite.position = randomPosition;
    [sprite activateCollisions];
    sprite.body->SetLinearVelocity(b2Vec2(randomXVelocity/PTM_RATIO,randomYVelocity/PTM_RATIO));
    sprite.body->SetAngularVelocity(randomAngularVelocity);
}

/*
 * The main loop for tossing sprites. Picks out random fruits to be tossed based on a toss type.
 */
-(void)spriteLoop
{
    double curTime = CACurrentMediaTime();
    
    //execute only when it's time to toss sprites again
    if (curTime > _nextTossTime)
    {
        PolygonSprite *sprite;
        
        int chance = arc4random()%8;
        if (chance == 0)
        {
            CCARRAY_FOREACH(_cache, sprite)
            {
                if (sprite.state == kStateIdle && sprite.type == kTypeBomb)
                {
                    [self tossSprite:sprite];
                    [[SimpleAudioEngine sharedEngine] playEffect:@"toss_bomb.caf"];
                    break;
                }
            }
        }

        int random = random_range(0, 4);
        //if we haven't run out of fruits to toss for consecutive tossing, toss another
        Type type = (Type)random;
        if (_currentTossType == kTossConsecutive && _queuedForToss > 0)
        {
            CCARRAY_FOREACH(_cache, sprite)
            {
                if (sprite.state == kStateIdle && sprite.type == type)
                {
                    [self tossSprite:sprite];
                    _queuedForToss--;
                    [[SimpleAudioEngine sharedEngine] playEffect:@"toss_consecutive.caf"];
                    break;
                }
            }
        }
        else
        {
            //determine toss type and number of fruits to toss
            _queuedForToss = random_range(3, 8);
            int tossType = random_range(0,1);
            
            _currentTossType = (TossType)tossType;
            
            if (_currentTossType == kTossSimultaneous)
            {
                //toss fruits simultaneously
                CCARRAY_FOREACH(_cache, sprite)
                {
                    if (sprite.state == kStateIdle && sprite.type == type)
                    {
                        [self tossSprite:sprite];
                        _queuedForToss--;
                        
                        //get a different fruit type
                        random = random_range(0, 4);
                        type = (Type)random;
                        
                        if (_queuedForToss == 0)
                        {
                            break;
                        }
                    }
                }
                [[SimpleAudioEngine sharedEngine] playEffect:@"toss_simultaneous.caf"];
            }
            else if (_currentTossType == kTossConsecutive)
            {
                //toss fruits consecutively
                CCARRAY_FOREACH(_cache, sprite)
                {
                    if (sprite.state == kStateIdle && sprite.type == type)
                    {
                        //just toss one fruit
                        [self tossSprite:sprite];
                        [[SimpleAudioEngine sharedEngine] playEffect:@"toss_consecutive.caf"];
                        _queuedForToss--;
                        break;
                    }
                }
            }
        }
        //randomize an interval
        if (_queuedForToss == 0)
        {
            //if no more fruits to toss, set a longer interval
            _tossInterval = frandom_range(2,3);
            _nextTossTime = curTime + _tossInterval;
        }
        else 
        {
            //if more fruits to toss, set a shorter interval
            _tossInterval = frandom_range(0.3,0.8);
            _nextTossTime = curTime + _tossInterval;
        }
    }
}

/*
 * Handles sprites that have fallen offscreen
 */
-(void)cleanSprites
{
    PolygonSprite *sprite;
    
    //we check for all tossed sprites that have dropped offscreen and reset them
    CCARRAY_FOREACH(_cache, sprite)
    {
        if (sprite.state == kStateTossed)
        {
            CGPoint spritePosition = ccp(sprite.body->GetPosition().x*PTM_RATIO,sprite.body->GetPosition().y*PTM_RATIO);
            float yVelocity = sprite.body->GetLinearVelocity().y;
            
            //this means the sprite has dropped offscreen
            if (spritePosition.y < -64 && yVelocity < 0)
            {
                sprite.state = kStateIdle;
                sprite.sliceEntered = NO;
                sprite.sliceExited = NO;
                sprite.entryPoint.SetZero();
                sprite.exitPoint.SetZero();
                sprite.position = ccp(-64,-64);
                sprite.body->SetLinearVelocity(b2Vec2(0.0,0.0));
                sprite.body->SetAngularVelocity(0.0);
                [sprite deactivateCollisions];
                
                if (sprite.type != kTypeBomb)
                {
                    [self subtractLife];
                }
            }
        }
    }
    
    //we check for all sliced pieces that have dropped offscreen and remove them
    CGSize screen = [[CCDirector sharedDirector] winSize];
    for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
    {
        if (b->GetUserData() != NULL) {
            PolygonSprite *sprite = (PolygonSprite*)b->GetUserData();
            CGPoint position = ccp(b->GetPosition().x*PTM_RATIO,b->GetPosition().y*PTM_RATIO);
            if (position.x < -64 || position.x > screen.width || position.y < -64)
            {
                if (!sprite.original)
                {
                    world->DestroyBody(sprite.body);
                    [self removeChild:sprite cleanup:YES];
                }
            }
        }
    }
}

/*
 * Reloads the scene
 */
-(void)restart
{
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

/*
 * Unschedules the update loop and shows a menu at the end of the game
 */
-(void)endGame
{
    [self unscheduleUpdate];
    CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"RESTART"fontName:@"Helvetica Neue"fontSize:50] target:self selector:@selector(restart)];
    CCMenu *menu = [CCMenu menuWithItems:label, nil];
    CGSize screen = [[CCDirector sharedDirector] winSize];
    menu.position = ccp(screen.width/2, screen.height/2);
    [self addChild:menu z:4];
}

/*
 * Subtracts the life of the player and checks if the game should end
 */
-(void)subtractLife
{
    
    CGSize screen = [[CCDirector sharedDirector] winSize];
    _lives--;
    
    // replace the unfilled cross with a filled cross at the correct spot
=======
-(id) init
{
	if( (self=[super init])) {
        
        _bladeSparkle = [CCParticleSystemQuad particleWithFile:@"blade_sparkle.plist"];
        [_bladeSparkle stopSystem];
        [self addChild:_bladeSparkle z:3];
        
        _nextTossTime = CACurrentMediaTime() + 1;
        _queuedForToss = 0;
        [self initBackground];
        // enable events
        self.isTouchEnabled = YES;
        self.isAccelerometerEnabled = YES;
        CGSize s = [CCDirector sharedDirector].winSize;
        
        // init physics
        [self initPhysics];
        [self initSprites];
        [self initHUD];
        _raycastCallback = new RaycastCallback();
        _deltaRemainder = 0.0;
        _blades = [[CCArray alloc] initWithCapacity:3];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"streak.png"];
        
        for (int i = 0; i < 3; i++)
        {
            CCBlade *blade = [CCBlade bladeWithMaximumPoint:50];
            blade.autoDim = NO;
            blade.texture = texture;
            
            [self addChild:blade z:2];
            [_blades addObject:blade];
        }
        [self scheduleUpdate];
        [[SimpleAudioEngine sharedEngine]preloadEffect:@"swoosh.caf"];
        [[SimpleAudioEngine sharedEngine]preloadEffect:@"squash.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"toss_consecutive.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"toss_simultaneous.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"toss_bomb.caf"];
        [[SimpleAudioEngine sharedEngine] preloadEffect:@"lose_life.caf"];
        _swoosh = [[[SimpleAudioEngine sharedEngine]soundSourceForFile:@"swoosh.caf"]retain];
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"nature_bgm.aifc"];
        _timeCurrent = 0;
        _timePrevious = 0;
    }
    return self;
}
//initHUD方法在屏幕的左上角创建了3个标记用来显示玩家的命数。它还放置了一张图片代表分数，分数本身也显示在左上角。
-(void)initHUD
{
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    _cuts = 0;
    _lives = 3;
    
    for (int i = 0; i < 3; i++)
    {
        CCSprite *cross = [CCSprite spriteWithFile:@"x_unfilled.png"];
        cross.position = ccp(screen.width - cross.contentSize.width/2 - i*cross.contentSize.width, screen.height - cross.contentSize.height/2);
        [self addChild:cross z:4];
    }
    
    CCSprite *cutsIcon = [CCSprite spriteWithFile:@"fruit_cut.png"];
    cutsIcon.position = ccp(cutsIcon.contentSize.width/2, screen.height - cutsIcon.contentSize.height/2);
    [self addChild:cutsIcon];
    
    _cutsLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Helvetica Neue" fontSize:30];
    _cutsLabel.anchorPoint = ccp(0, 0.5);
    _cutsLabel.position = ccp(cutsIcon.position.x + cutsIcon.contentSize.width/2 +                _cutsLabel.contentSize.width/2,cutsIcon.position.y);
    [self addChild:_cutsLabel z:4];
}
-(void)restart{
    [[CCDirector sharedDirector]replaceScene:[HelloWorldLayer scene]];
}
//endGame方法首先移除对update的schedule以停止游戏逻辑，然后在屏幕中添加restart按钮，如果此按钮被点击，那么游戏就会重新开始。
-(void)endGame{
    [self unscheduleUpdate];
    CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"RESTART" fontName:@"Helvetica Neue" fontSize:50] target:self selector:@selector(restart)];
    CCMenu *menu = [CCMenu menuWithItems:label, nil];
    CGSize screen = [[CCDirector sharedDirector]winSize];
    menu.position = ccp(screen.width/2, screen.height/2);
    [self addChild:menu z:4];
}
//subtractLife方法在标记命数的位置叠加一个新的标记图片，用来代表生命损失，每当此方法被调用，它还检查玩家当前是否还有足够的命数，如果没有，游戏就应该结束了。
-(void)substractLife{
    [[SimpleAudioEngine sharedEngine]playEffect:@"lose_life.caf"];
    CGSize screen = [[CCDirector sharedDirector]winSize];
    _lives --;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    CCSprite *lostLife = [CCSprite spriteWithFile:@"x_filled.png"];
    lostLife.position = ccp(screen.width - lostLife.contentSize.width/2 - _lives*lostLife.contentSize.width, screen.height - lostLife.contentSize.height/2);
    [self addChild:lostLife z:4];
    
<<<<<<< HEAD
    [[SimpleAudioEngine sharedEngine] playEffect:@"lose_life.caf"];
    
    // end the game if there are no more lives
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    if (_lives <= 0)
    {
        [self endGame];
    }
}
<<<<<<< HEAD

/*
 * Main update loop
 */
-(void) update: (ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	world->Step(dt, velocityIterations, positionIterations);
    
    // tossing
    [self spriteLoop];
    
    // slicing
    [self checkAndSliceObjects];
    
    // cleaning
    [self cleanSprites];
    
    // handles the fading trail of the blade effect
    if ([_blade.path count] > 3) {
        _deltaRemainder+=dt*60*1.2;
        int pop = (int)roundf(_deltaRemainder);
        _deltaRemainder-=pop;
        [_blade pop:pop];
    }
    
    // update the time used by the swoosh sound
    _timeCurrent += dt;
}

#pragma mark - Controls

/*
 * The touch start logic
 */
-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        
        // move the start and end of the ray cast to the touch
        _startPoint = location;
        _endPoint = location;
        
        // get an unused blade and move it to the touch
        CCBlade *blade;
=======
-(void)initBackground
    {
        CGSize screen = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"bg.png"];
        background.position = ccp(screen.width/2,screen.height/2);
        [self addChild:background z:0];
        CCParticleSystemQuad *sunPollen = [CCParticleSystemQuad particleWithFile:@"sun_pollen.plist"];
        [self addChild:sunPollen];
}

-(void) dealloc
{
	delete world;
	world = NULL;
	
	delete m_debugDraw;
	m_debugDraw = NULL;
	[_cache release];
    _cache = Nil;
    [_blades release];
    _blades = Nil;
    [_swoosh release];
	[super dealloc];
}
-(void)initSprites
    {
        _cache = [[CCArray alloc] initWithCapacity:53];
        
        for (int i = 0; i < 10; i++)
        {
            PolygonSprite *sprite = [[Watermelon alloc] initWithWorld:world];
            sprite.position = ccp(-64*(i+1),-64);
            [self addChild:sprite z:1];
            [_cache addObject:sprite];
            [self addChild:sprite.splurt z:3];
        }
        for (int i = 0; i < 10; i++)
        {
            PolygonSprite *sprite = [[Strawberry alloc] initWithWorld:world];
            sprite.position = ccp(-64*(i+1),-64);
            [self addChild:sprite z:1];
            [_cache addObject:sprite];
            [self addChild:sprite.splurt z:3];
        }
        for (int i = 0; i < 10; i++)
        {
            PolygonSprite *sprite = [[Pineapple alloc] initWithWorld:world];
            sprite.position = ccp(-64*(i+1),-64);
            [self addChild:sprite z:1];
            [_cache addObject:sprite];
            [self addChild:sprite.splurt z:3];
        }
        for (int i = 0; i < 10; i++)
        {
            PolygonSprite *sprite = [[Grapes alloc] initWithWorld:world];
            sprite.position = ccp(-64*(i+1),-64);
            [self addChild:sprite z:1];
            [_cache addObject:sprite];
            [self addChild:sprite.splurt z:3];
        }
        for (int i = 0; i < 10; i++)
        {
            PolygonSprite *sprite = [[Banana alloc] initWithWorld:world];
            sprite.position = ccp(-64*(i+1),-64);
            [self addChild:sprite z:1];
            [_cache addObject:sprite];
            [self addChild:sprite.splurt z:3];
        }
        
        for (int i = 0; i < 3; i++)
        {
            PolygonSprite *sprite = [[Bomb alloc] initWithWorld:world];
            sprite.position = ccp(-64*(i+1),-64);
            [self addChild:sprite z:1];
            [_cache addObject:sprite];
            [self addChild:sprite.splurt z:3];
        }
    
}
-(void) initPhysics
{
	
	CGSize s = [[CCDirector sharedDirector] winSize];
	
	b2Vec2 gravity;
	gravity.Set(0.0f, -4.25f);
	world = new b2World(gravity);
	
	
	// Do we want to let bodies sleep?
	world->SetAllowSleeping(true);
	
	world->SetContinuousPhysics(true);
	
	m_debugDraw = new GLESDebugDraw( PTM_RATIO );
	world->SetDebugDraw(m_debugDraw);
	
	uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
	//		flags += b2Draw::e_jointBit;
	//		flags += b2Draw::e_aabbBit;
	//		flags += b2Draw::e_pairBit;
	//		flags += b2Draw::e_centerOfMassBit;
	m_debugDraw->SetFlags(flags);		
	
	
	// Define the ground body.
	b2BodyDef groundBodyDef;
	groundBodyDef.position.Set(0, 0); // bottom-left corner
	
	// Call the body factory which allocates memory for the ground body
	// from a pool and creates the ground box shape (also from a pool).
	// The body is also added to the world.
	b2Body* groundBody = world->CreateBody(&groundBodyDef);
	
	// Define the ground box shape.
	b2EdgeShape groundBox;		
/**
	// bottom
	
	groundBox.Set(b2Vec2(0,0), b2Vec2(s.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// top
	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO));
	groundBody->CreateFixture(&groundBox,0);
	
	// left
	groundBox.Set(b2Vec2(0,s.height/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// right
	groundBox.Set(b2Vec2(s.width/PTM_RATIO,s.height/PTM_RATIO), b2Vec2(s.width/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
 **/
}

-(void) draw
{
	//
	// IMPORTANT:
	// This is only for debug purposes
	// It is recommend to disable it
	//
	[super draw];
	
	ccGLEnableVertexAttribs( kCCVertexAttribFlag_Position );
	
	kmGLPushMatrix();
    
    //ccDrawLine(_startPoint, _endPoint);//画线后就是要创建 ray cast
	
	//world->DrawDebugData();
	
	kmGLPopMatrix();
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector]convertToGL:location];
        _startPoint = location;
        _endPoint = location;
        CCBlade *blade;
        _bladeSparkle.position = location;
        [_bladeSparkle resetSystem];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        CCARRAY_FOREACH(_blades, blade)
        {
            if (blade.path.count == 0)
            {
                _blade = blade;
                [_blade push:location];
                break;
            }
        }
<<<<<<< HEAD
        
        // move the sparkle to the touch
        _bladeSparkle.position = location;
        [_bladeSparkle resetSystem];
    }
}

/*
 * The touch moved logic 
 */
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        
        // end point follows the touch
        _endPoint = location;
        
        // ray cast every 5 points of movement
        if (ccpLengthSQ(ccpSub(_startPoint, _endPoint)) > 25)
        {
            // ray cast twice because a fixture can only be intersected in one direction once per ray cast
            world->RayCast(_raycastCallback, 
                           b2Vec2(_startPoint.x / PTM_RATIO, _startPoint.y / PTM_RATIO),
                           b2Vec2(_endPoint.x / PTM_RATIO, _endPoint.y / PTM_RATIO));
            
            world->RayCast(_raycastCallback, 
                           b2Vec2(_endPoint.x / PTM_RATIO, _endPoint.y / PTM_RATIO),
                           b2Vec2(_startPoint.x / PTM_RATIO, _startPoint.y / PTM_RATIO));
            
            // adjust the start point after the ray cast
            _startPoint = _endPoint;
        }
        
        // add a point to the blade
=======
       
    }
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in touches){
        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        _endPoint = location;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        [_blade push:location];
        
        ccTime deltaTime = _timeCurrent - _timePrevious;
        _timePrevious = _timeCurrent;
<<<<<<< HEAD
        
        // calculate the velocity (distance / time)
        CGPoint oldPosition = _bladeSparkle.position;
        
        // sparkle follows the touch
        _bladeSparkle.position = location;
    
        // play the sound if velocity is past a certain value
=======
        CGPoint oldPosition = _bladeSparkle.position;
      _bladeSparkle.position = location;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        if (ccpDistance(_bladeSparkle.position, oldPosition) / deltaTime > 1000)
        {
            if (!_swoosh.isPlaying)
            {
<<<<<<< HEAD
                // play sound only if it is not playing
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
                [_swoosh play];
            }
        }
    }
<<<<<<< HEAD
}

/*
 * The touch end logic
 */
=======
    if (ccpLengthSQ(ccpSub(_startPoint, _endPoint)) >25) {
        world -> RayCast(_raycastCallback, b2Vec2(_startPoint.x/PTM_RATIO, _startPoint.y / PTM_RATIO), b2Vec2(_endPoint.x / PTM_RATIO,_endPoint.y / PTM_RATIO));
        world->RayCast(_raycastCallback,
                       b2Vec2(_endPoint.x / PTM_RATIO, _endPoint.y / PTM_RATIO),
                       b2Vec2(_startPoint.x / PTM_RATIO, _startPoint.y / PTM_RATIO));
        _startPoint = _endPoint;
    }
    
}
-(void) update: (ccTime) dt
{
	//It is recommended that a fixed time step is used with Box2D for stability
	//of the simulation, however, we are using a variable time step here.
	//You need to make an informed choice, the following URL is useful
	//http://gafferongames.com/game-physics/fix-your-timestep/
	_timeCurrent += dt;
    
	int32 velocityIterations = 8;
	int32 positionIterations = 1;
	
	// Instruct the world to perform a single step of simulation. It is
	// generally best to keep the time step and iterations fixed.
	world->Step(dt, velocityIterations, positionIterations);
	[self checkAndSliceObjects];
    [self cleanSprites];
    [self spriteLoop];
    if ([_blade.path count] > 3) {
        _deltaRemainder+=dt*60*1.2;
        int pop = (int)roundf(_deltaRemainder);
        _deltaRemainder-=pop;
        [_blade pop:pop];
    }
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//Add a new body/atlas sprite at the touched location
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
<<<<<<< HEAD
        
        // remove all entry and exit points from all polygons
        [self clearSlices];
        
        // fade the blade
        [_blade dim:YES];
        
        // sparkle effect stops
        [_bladeSparkle stopSystem];
	}
}

#pragma mark - Deallocation
/*
 * Releases objects that have been retained
 */
-(void) dealloc
{
	delete world;
	world = NULL;
	
	delete m_debugDraw;
	m_debugDraw = NULL;
    
    [_cache release];
    _cache = nil;
	
    [_blades release];
    _blades = nil;
    
    [_swoosh release];
    
	[super dealloc];
}	
=======
		
		location = [[CCDirector sharedDirector] convertToGL: location];
        [_bladeSparkle stopSystem];
	}
    [_blade dim:YES];

    }
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end
