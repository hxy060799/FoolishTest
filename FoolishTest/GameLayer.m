//
//  GameLayer.m
//  FoolishTest
//
//  Created by Bill on 13-8-3.
//  Copyright (c) 2013年 GetToSet. All rights reserved.
//

#import "GameLayer.h"

@implementation GameLayer

@synthesize winSize;

+(CCScene*)scene{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[GameLayer node];
    
    [scene addChild:layer];
    
    return scene;
}

-(id)init{
    if(self=[super init]){
        
        [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"itemSprites.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"shapes.plist"];
        
        winSize=[[CCDirector sharedDirector]winSize];
        
        CCSprite *sprite=[CCSprite spriteWithSpriteFrameName:@"bluetriangle.png"];
        [sprite setPosition:[self ccpHDWithX:480/2 y:320/2]];
        [self addChild:sprite];
        NSLog(@"x:%f,y:%f",sprite.position.x,sprite.position.y);
    }
    
    return self;
}

-(CGPoint)ccpHDWithX:(CGFloat)x y:(CGFloat)y{
	return CGPointMake(winSize.width/480*x,winSize.height/320*y);
}

@end
