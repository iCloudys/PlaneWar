//
//  Bullet.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

- (instancetype)init{
    self = [super init];
    if (self) {
        self.texture = [TextureCache textureNamed:Texture_BULLET1];
        self.size = CGSizeMake(6, 14);
        
        SKPhysicsBody* body = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        body.categoryBitMask = GamePhysicsTypeBullet;
        body.collisionBitMask = GamePhysicsTypeEnemy | GamePhysicsTypeGuard;
        body.contactTestBitMask = GamePhysicsTypeEnemy | GamePhysicsTypeGuard;
        body.velocity = CGVectorMake(0, 1000);
        self.physicsBody = body;
        
    }
    return self;
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end


@implementation Guard

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.size = CGSizeMake(500, 10);
        
        SKPhysicsBody* body = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        body.categoryBitMask = GamePhysicsTypeGuard;
        body.mass = 100000;
        self.physicsBody = body;
        
    }
    return self;
}

@end
