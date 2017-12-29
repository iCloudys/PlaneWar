//
//  BGNode.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "BGNode.h"

@interface BGNode()
@property (nonatomic, strong) BGNode* loopBG;
@end

@implementation BGNode

+ (instancetype)nodeWithSize:(CGSize)size{
    
    BGNode* background = [BGNode spriteNodeWithTexture:[TextureCache textureNamed:Texture_BACKGROUND_2] size:size];

    background.position = CGPointMake(size.width / 2, 0);
    
    background.zPosition = -1000;
    
    background.anchorPoint = CGPointMake(0.5, 0);
    
    return background;
}

- (void)scrolling{
    CGPoint position = self.position;
    position.y --;
    if (position.y <= -self.size.height) {
        position.y = self.size.height;
    }
    self.position = position;
}

- (void)scrollLoop{
    if (!self.loopBG) {
        self.loopBG = [BGNode nodeWithSize:self.size];
        self.loopBG.position = CGPointMake(self.position.x, self.position.y + self.size.height);
        [self.scene addChild:self.loopBG];
    }
    
    [self scrolling];
    [self.loopBG scrolling];
}

@end
