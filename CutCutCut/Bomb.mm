//
//  Bomb.m
//  CutCutCut
//
<<<<<<< HEAD
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
///
=======
//  Created by Allen Benson G Tan on 5/18/12.
//  Copyright 2012 WhiteWidget Inc. All rights reserved.
//
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

#import "Bomb.h"


@implementation Bomb

-(id)initWithWorld:(b2World *)world
{
<<<<<<< HEAD
    int32 count = 8;
    NSString *file = @"bomb.png";
    b2Vec2 vertices[] = {
        b2Vec2(43.0/PTM_RATIO,54.0/PTM_RATIO),
        b2Vec2(23.0/PTM_RATIO,54.0/PTM_RATIO),
        b2Vec2(12.0/PTM_RATIO,41.0/PTM_RATIO),
        b2Vec2(12.0/PTM_RATIO,20.0/PTM_RATIO),
        b2Vec2(23.0/PTM_RATIO,10.0/PTM_RATIO),
        b2Vec2(44.0/PTM_RATIO,10.0/PTM_RATIO),
        b2Vec2(53.0/PTM_RATIO,18.0/PTM_RATIO),
        b2Vec2(53.0/PTM_RATIO,40.0/PTM_RATIO)
=======
    int32 count = 6;
    NSString *file = @"bomb.png";
    b2Vec2 vertices[] = {
        b2Vec2(52.0/PTM_RATIO,12.0/PTM_RATIO),
        b2Vec2(56.0/PTM_RATIO,40.0/PTM_RATIO),
        b2Vec2(39.0/PTM_RATIO,55.0/PTM_RATIO),
        b2Vec2(21.0/PTM_RATIO,54.0/PTM_RATIO),
        b2Vec2(7.0/PTM_RATIO,31.0/PTM_RATIO),
        b2Vec2(22.0/PTM_RATIO,7.0/PTM_RATIO)

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithFile:file body:body original:YES]))
    {
        self.type = kTypeBomb;
        self.splurt = [CCParticleSystemQuad particleWithFile:@"explosion.plist"];
        [self.splurt stopSystem];
    }
    return self;
}

@end
