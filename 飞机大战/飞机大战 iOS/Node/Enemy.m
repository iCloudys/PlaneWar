//
//  Enemy.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/27.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.texture = [TextureCache textureNamed:Texture_ENEMY1_FLY_1];
        self.size = CGSizeMake(34, 25);
        
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointMake(0, -self.size.height / 2)];
        [bezierPath addLineToPoint:CGPointMake(self.size.width / 2, -self.size.height / 2 + 15)];
        [bezierPath addLineToPoint:CGPointMake(self.size.width / 2, self.size.height / 2)];
        [bezierPath addLineToPoint:CGPointMake(-self.size.width / 2, self.size.height / 2)];
        [bezierPath addLineToPoint:CGPointMake(-self.size.width / 2, -self.size.height / 2 + 15)];
        [bezierPath closePath];

        SKPhysicsBody* body = [SKPhysicsBody bodyWithPolygonFromPath:bezierPath.CGPath];
        body.categoryBitMask = GamePhysicsTypeEnemy;
        body.collisionBitMask = GamePhysicsTypePlayer | GamePhysicsTypeBullet;
        body.contactTestBitMask = GamePhysicsTypePlayer | GamePhysicsTypeBullet;
        body.mass = 1000;
        self.physicsBody = body;
    }
    return self;
}

/**
 起飞
 */
- (void)takeoff{
    
    SKAction* run = [SKAction moveToY:-self.size.height / 2 duration:3.0];
    
    [self runAction:run completion:^{
        [self removeFromParent];
    }];
    
    SKAction* scale_1 = [SKAction scaleTo:0.9 duration:1];
    SKAction* scale_2 = [SKAction scaleTo:1 duration:1];
    SKAction* scale = [SKAction repeatActionForever:[SKAction sequence:@[scale_1,scale_2]]];
    
    [self runAction:[SKAction group:@[run,scale]] withKey:kEnemyFlyKey];
}

/**
 降落
 */
- (void)landing{
    [self removeActionForKey:kEnemyFlyKey];
}

/**
 被击落
 */
- (void)died{

    [self removeAllActions];
    
    self.physicsBody = nil;
        
    SKTexture* die1 = [TextureCache textureNamed:Texture_ENEMY1_BLOWUP_1];
    SKTexture* die2 = [TextureCache textureNamed:Texture_ENEMY1_BLOWUP_2];
    SKTexture* die3 = [TextureCache textureNamed:Texture_ENEMY1_BLOWUP_3];
    SKTexture* die4 = [TextureCache textureNamed:Texture_ENEMY1_BLOWUP_4];

    SKAction* die = [SKAction animateWithTextures:@[die1,die2,die3,die4] timePerFrame:0.1];
    
    [self runAction:die completion:^{
        [self removeFromParent];
    }];

    [SoundManger playSound:SOUND_ENEMY_BLOUP node:self];
}

/**
 分数
 */
- (CGFloat)score{
    return 1000;
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
