//
//  EnemyManager.h
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/27.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//  敌机管理

#import <SpriteKit/SpriteKit.h>
#import "Enemy.h"

@interface EnemyManager : SKNode

/**
 开始生成敌机并且起飞
 */
- (void)start;


/**
 结束生成敌机
 */
- (void)stop;

@end
