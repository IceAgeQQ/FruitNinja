//
//  Watermelon.m
//  CutCutCut
//
<<<<<<< HEAD
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
=======
//  Created by Chao Xu on 13-10-23.
//  Copyright 2013年 Chao Xu. All rights reserved.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
//

#import "Watermelon.h"


@implementation Watermelon

<<<<<<< HEAD
-(id)initWithWorld:(b2World *)world
{
    int32 count = 7;
    NSString *file = @"watermelon.png";
    b2Vec2 vertices[] = {
        b2Vec2(5.0/PTM_RATIO,15.0/PTM_RATIO),
        b2Vec2(18.0/PTM_RATIO,7.0/PTM_RATIO),
        b2Vec2(32.0/PTM_RATIO,5.0/PTM_RATIO),
        b2Vec2(48.0/PTM_RATIO,7.0/PTM_RATIO),
        b2Vec2(60.0/PTM_RATIO,14.0/PTM_RATIO),
        b2Vec2(34.0/PTM_RATIO,59.0/PTM_RATIO),
=======
-(id)initWithWorld:(b2World *)world{
    int32 count = 6;
    NSString *file = @"watermelon.png";
    b2Vec2 vertices[] = {
        b2Vec2(4.0/PTM_RATIO,16.0/PTM_RATIO),
        b2Vec2(19.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(45.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(60.0/PTM_RATIO,14.0/PTM_RATIO),
        b2Vec2(35.0/PTM_RATIO,59.0/PTM_RATIO),
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        b2Vec2(28.0/PTM_RATIO,59.0/PTM_RATIO)
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithFile:file body:body original:YES]))
    {
<<<<<<< HEAD
=======
        // We will initialize more values for the fruit here later
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
        self.type = kTypeWatermelon;
        self.splurt = [CCParticleSystemQuad particleWithFile:@"watermelon_splurt.plist"];
        [self.splurt stopSystem];
    }
    return self;
}

@end
