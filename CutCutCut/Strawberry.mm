//
//  Strawberry.m
//  CutCutCut
//
<<<<<<< HEAD
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
//


=======
//  Created by Allen Benson G Tan on 5/16/12.
//  Copyright 2012 WhiteWidget Inc. All rights reserved.
//

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#import "Strawberry.h"


@implementation Strawberry

-(id)initWithWorld:(b2World *)world
{
<<<<<<< HEAD
    int32 count = 7;
    NSString *file = @"strawberry.png";
    b2Vec2 vertices[] = {
        b2Vec2(51.0/PTM_RATIO,5.0/PTM_RATIO),
        b2Vec2(56.0/PTM_RATIO,21.0/PTM_RATIO),
        b2Vec2(54.0/PTM_RATIO,45.0/PTM_RATIO),
        b2Vec2(37.0/PTM_RATIO,62.0/PTM_RATIO),
        b2Vec2(8.0/PTM_RATIO,48.0/PTM_RATIO),
        b2Vec2(12.0/PTM_RATIO,24.0/PTM_RATIO),
        b2Vec2(34.0/PTM_RATIO,5.0/PTM_RATIO)
=======
    int32 count = 6;
    NSString *file = @"strawberry.png";
    b2Vec2 vertices[] = {
        b2Vec2(7.0/PTM_RATIO,48.0/PTM_RATIO),
        b2Vec2(10.0/PTM_RATIO,23.0/PTM_RATIO),
        b2Vec2(31.0/PTM_RATIO,5.0/PTM_RATIO),
        b2Vec2(53.0/PTM_RATIO,4.0/PTM_RATIO),
        b2Vec2(56.0/PTM_RATIO,45.0/PTM_RATIO),
        b2Vec2(37.0/PTM_RATIO,61.0/PTM_RATIO)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];

    if ((self = [super initWithFile:file body:body original:YES]))
    {
        self.type = kTypeStrawberry;
        self.splurt = [CCParticleSystemQuad particleWithFile:@"strawberry_splurt.plist"];
        [self.splurt stopSystem];
    }
    return self;
}

@end
