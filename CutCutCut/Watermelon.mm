//
//  Watermelon.m
//  CutCutCut
//
//  Created by Chao Xu on 13-10-23.
//  Copyright 2013年 Chao Xu. All rights reserved.
//

#import "Watermelon.h"


@implementation Watermelon

-(id)initWithWorld:(b2World *)world{
    int32 count = 6;
    NSString *file = @"watermelon.png";
    b2Vec2 vertices[] = {
        b2Vec2(4.0/PTM_RATIO,16.0/PTM_RATIO),
        b2Vec2(19.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(45.0/PTM_RATIO,6.0/PTM_RATIO),
        b2Vec2(60.0/PTM_RATIO,14.0/PTM_RATIO),
        b2Vec2(35.0/PTM_RATIO,59.0/PTM_RATIO),
        b2Vec2(28.0/PTM_RATIO,59.0/PTM_RATIO)
    };
    CGSize screen = [[CCDirector sharedDirector] winSize];
    
    b2Body *body = [self createBodyForWorld:world position:b2Vec2(screen.width/2/PTM_RATIO,screen.height/2/PTM_RATIO) rotation:0 vertices:vertices vertexCount:count density:5.0 friction:0.2 restitution:0.2];
    
    if ((self = [super initWithFile:file body:body original:YES]))
    {
        // We will initialize more values for the fruit here later
    }
    return self;
}

@end
