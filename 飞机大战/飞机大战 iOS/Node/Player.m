//
//  Player.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "Player.h"
#import "Bullet.h"

@implementation Player

- (instancetype)init{
    self = [super init];
    if (self) {
        self.anchorPoint = CGPointMake(0.5, 0);
        self.texture = [TextureCache textureNamed:Texture_HERO_FLY_1];
        self.size = kPlayerSize;
        self.name = kPlayerName;
        
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointMake(0, self.size.height)];
        [bezierPath addLineToPoint:CGPointMake(self.size.width / 2, 25)];
        [bezierPath addLineToPoint:CGPointMake(self.size.width / 2, 18)];
        [bezierPath addLineToPoint:CGPointMake(-self.size.width / 2, 18)];
        [bezierPath addLineToPoint:CGPointMake(-self.size.width / 2, 25)];
        [bezierPath closePath];
        
        SKPhysicsBody* body = [SKPhysicsBody bodyWithPolygonFromPath:bezierPath.CGPath];
        body.categoryBitMask = GamePhysicsTypePlayer;
        body.collisionBitMask = GamePhysicsTypeEnemy;
        body.contactTestBitMask = GamePhysicsTypeEnemy;
        body.mass = 10000;
        self.physicsBody = body;
        
    }
    return self;
}

//起飞
- (void)takeoff{
    
    SKTexture* fly1 = [TextureCache textureNamed:Texture_HERO_FLY_1];
    SKTexture* fly2 = [TextureCache textureNamed:Texture_HERO_FLY_2];
    SKAction* fly = [SKAction animateWithTextures:@[fly1,fly2] timePerFrame:0.1];
    [self runAction:[SKAction repeatActionForever:fly] withKey:kPlayerFlyKey];
    
}

//降落
- (void)landing{
    [self removeActionForKey:kPlayerFlyKey];
}

//开火
- (void)fire{

    SKAction* create = [SKAction runBlock:^{
        [self createBullet];
    }];
    SKAction* wait = [SKAction waitForDuration:0.2];

    [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[create,wait]]] withKey:kPlayerFireKey];
}

//创建子弹
- (void)createBullet{
    Bullet* bullet = [Bullet node];
    bullet.zPosition = self.zPosition - 1;
    bullet.position = self.position;
    [self.scene addChild:bullet];
}

//停止射击
- (void)ceasefire{
    [self removeActionForKey:kPlayerFireKey];
}

// 被击落
- (void)died{
    
    [self removeAllActions];
    
    self.physicsBody = nil;
    
    SKTexture* die1 = [TextureCache textureNamed:Texture_HERO_BLOWUP_1];
    SKTexture* die2 = [TextureCache textureNamed:Texture_HERO_BLOWUP_2];
    SKTexture* die3 = [TextureCache textureNamed:Texture_HERO_BLOWUP_3];
    SKTexture* die4 = [TextureCache textureNamed:Texture_HERO_BLOWUP_4];
    
    SKAction* die = [SKAction animateWithTextures:@[die1,die2,die3,die4] timePerFrame:0.1];
    
    [self runAction:die completion:^{
        [self removeFromParent];
    }];
    
    [SoundManger playSound:SOUND_HERO_BLOUP node:self];
}

//移动偏移量
- (void)moveByOffset:(UIOffset)offset size:(CGSize)size{
    
    CGPoint position = self.position;

    position.x -= offset.horizontal;
    position.y -= offset.vertical;

    self.position = position;
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
