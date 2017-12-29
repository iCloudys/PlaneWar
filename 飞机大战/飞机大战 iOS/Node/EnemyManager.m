//
//  EnemyManager.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/27.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "EnemyManager.h"
#import "Player.h"

@implementation EnemyManager

//开始生成敌机并且起飞
- (void)start{
    SKAction* create = [SKAction runBlock:^{
        [self createEnemy];
    }];
    SKAction* wait = [SKAction waitForDuration:0.7];
    
    [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[create,wait]]] withKey:kEnemyManagerStartKey];
}

//创建敌机
- (void)createEnemy{
    Enemy* enemy = [Enemy node];
    
    CGPoint position = CGPointMake(arc4random_uniform(self.scene.size.width - kPlayerSize.width) + kPlayerSize.width / 2, self.scene.size.height + enemy.size.height / 2);
    
    enemy.position = position;
    
    [self addChild:enemy];
    
    [enemy takeoff];
}

//结束生成敌机
- (void)stop{
    [self removeActionForKey:kEnemyManagerStartKey];
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
