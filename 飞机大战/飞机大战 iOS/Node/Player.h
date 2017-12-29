//
//  Player.h
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//  玩家

#import <SpriteKit/SpriteKit.h>
#import "PlaneProtocol.h"

@interface Player : SKSpriteNode<PlaneProtocol>

/**
  在某个范围内移动某个偏移量

 @param offset 偏移量
 @param size 范围
 */
- (void)moveByOffset:(UIOffset)offset size:(CGSize)size;

@end
