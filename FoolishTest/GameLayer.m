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
        
        [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"ItemSprites.plist"];
        
        winSize=[[CCDirector sharedDirector]winSize];
        
        CCSprite *background=[CCSprite spriteWithFile:@"background.png"];
        background.position=[self ccpHDWithX:480/2 y:320/2];
        [self addChild:background];
        
        [self loadLevelWithIndex:0];
    }
    
    return self;
}

-(void)loadLevelWithIndex:(int)index{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Levels" ofType:@"plist"];
    NSDictionary *levelDictionary=[[[NSDictionary dictionaryWithContentsOfFile:path]objectForKey:@"Levels"]objectAtIndex:index];
    
    NSArray *levelObjects=[levelDictionary objectForKey:@"Objects"];
    
    for(NSDictionary *objectDictionary in levelObjects){
        NSDictionary *objectPositionDictionary=[objectDictionary objectForKey:@"Position"];
        
        CGPoint objectPosition=[self ccpHDWithX:[[objectPositionDictionary objectForKey:@"x"]floatValue] y:[[objectPositionDictionary objectForKey:@"y"]floatValue]];
        
        CCSprite *sprite=[CCSprite spriteWithSpriteFrameName:[objectDictionary objectForKey:@"SpriteFrameName"]];
        [sprite setPosition:ccp(objectPosition.x,objectPosition.y)];
        [self addChild:sprite];
    }
}

-(CGPoint)ccpHDWithX:(CGFloat)x y:(CGFloat)y{
	return CGPointMake(winSize.width/480*x,winSize.height/320*y);
}

@end
