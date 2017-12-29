//
//  BGNode.h
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BGNode : SKSpriteNode

+ (instancetype)nodeWithSize:(CGSize)size;

- (void)scrolling;


/**
 无限滚动
 */
- (void)scrollLoop;

@end
