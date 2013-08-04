//
//  GameLayer.h
//  FoolishTest
//
//  Created by Bill on 13-8-3.
//  Copyright (c) 2013年 GetToSet. All rights reserved.
//

#import "cocos2d.h"

@interface GameLayer : CCLayer{
    CGSize winSize;
}

@property(assign,nonatomic)CGSize winSize;

+(CCScene*)scene;

@end
