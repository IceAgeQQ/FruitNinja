//
//  Grapes.m
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
#import "Grapes.h"


@implementation Grapes

-(id)initWithWorld:(b2World *)world
{
<<<<<<< HEAD
    int32 count = 8;
    NSString *file = @"grapes.png";
    b2Vec2 vertices[] = {
        b2Vec2(14.0/PTM_RATIO,61.0/PTM_RATIO),
        b2Vec2(13.0/PTM_RATIO,39.0/PTM_RATIO),
        b2Vec2(18.0/PTM_RATIO,16.0/PTM_RATIO),
        b2Vec2(30.0/PTM_RATIO,3.0/PTM_RATIO),
        b2Vec2(39.0/PTM_RATIO,3.0/PTM_RATIO),
        b2Vec2(50.0/PTM_RATIO,29.0/PTM_RATIO),
        b2Vec2(54.0/PTM_RATIO,50.0/PTM_RATIO),
        b2Vec2(42.0/PTM_RATIO,62.0/PTM_RATIO)
=======
    int32 count = 6;
    NSString *file = @"grapes.png";
    b2Vec2 vertices[] = {
        b2Vec2(13.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(12.0/PTM_RATIO,40.0/PTM_RATIO),
        b2Vec2(19.0/PTM_RATIO,4.0/PTM_RATIO),
        b2Vec2(43.0/PTM_RATIO,1.0/PTM_RATIO),
        b2Vec2(58.0/PTM_RATIO,46.0/PTM_RATIO),
        b2Vec2(43.0/PTM_RATIO,62.0/PTM_RATIO)
        
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];

    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithFile:file body:body original:YES]))
    {
        self.type = kTypeGrapes;
        self.splurt = [CCParticleSystemQuad particleWithFile:@"grapes_splurt.plist"];
        [self.splurt stopSystem];
    }
    return self;
}

@end
