//
//  Banana.m
//  CutCutCut
//
//  Created by Allen Benson G Tan on 5/16/12.
//  Copyright 2012 WhiteWidget Inc. All rights reserved.
//

#import "Banana.h"


@implementation Banana

-(id)initWithWorld:(b2World *)world
{
    int32 count = 6;
    NSString *file = @"banana.png";
    b2Vec2 vertices[] = {
        b2Vec2(55.0/PTM_RATIO,13.0/PTM_RATIO),
        b2Vec2(61.0/PTM_RATIO,37.0/PTM_RATIO),
        b2Vec2(55.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(47.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(2.0/PTM_RATIO,16.0/PTM_RATIO),
        b2Vec2(17.0/PTM_RATIO,2.0/PTM_RATIO)
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithFile:file body:body original:YES]))
    {
    }
    return self;
}

@end
