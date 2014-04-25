//
//  Banana.m
//  CutCutCut
//
<<<<<<< HEAD
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
=======
//  Created by Allen Benson G Tan on 5/16/12.
//  Copyright 2012 WhiteWidget Inc. All rights reserved.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
//

#import "Banana.h"


@implementation Banana

-(id)initWithWorld:(b2World *)world
{
<<<<<<< HEAD
    int32 count = 8;
    NSString *file = @"banana.png";
    b2Vec2 vertices[] = {
        b2Vec2(5.0/PTM_RATIO,10.0/PTM_RATIO),
        b2Vec2(16.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(32.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(49.0/PTM_RATIO,13.0/PTM_RATIO),
        b2Vec2(61.0/PTM_RATIO,33.0/PTM_RATIO),
        b2Vec2(54.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(48.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(5.0/PTM_RATIO,20.0/PTM_RATIO)
=======
    int32 count = 6;
    NSString *file = @"banana.png";
    b2Vec2 vertices[] = {
        b2Vec2(55.0/PTM_RATIO,13.0/PTM_RATIO),
        b2Vec2(61.0/PTM_RATIO,37.0/PTM_RATIO),
        b2Vec2(55.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(47.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(2.0/PTM_RATIO,16.0/PTM_RATIO),
        b2Vec2(17.0/PTM_RATIO,2.0/PTM_RATIO)
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithFile:file body:body original:YES]))
    {
        self.type = kTypeBanana;
        self.splurt = [CCParticleSystemQuad particleWithFile:@"banana_splurt.plist"];
        [self.splurt stopSystem];
    }
    return self;
}

@end
