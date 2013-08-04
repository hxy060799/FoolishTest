//
//  GameLayer.m
//  FoolishTest
//
//  Created by Bill on 13-8-3.
//  Copyright (c) 2013年 GetToSet. All rights reserved.
//

#import "GameLayer.h"

@implementation GameLayer

+(CCScene*)scene{
    CCScene *scene=[CCScene node];
    CCLayer *layer=[GameLayer node];
    
    [scene addChild:layer];
    
    return scene;
}

-(id)init{
    if(self=[super init]){
        
        [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"itemSprites.plist"];
        
        CGSize winSize=[[CCDirector sharedDirector]winSize];
        
        CCSprite *sprite=[CCSprite spriteWithSpriteFrameName:@"umbrella.png"];
        [sprite setScale:0.5];
        [sprite setPosition:ccp(winSize.width/2,winSize.height/2)];
        [self addChild:sprite];
    }
    
    return self;
}

@end
