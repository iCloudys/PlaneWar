//
//  StartScene.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "StartScene.h"
#import "BGNode.h"
#import "GameScene.h"
#import "HistoryScene.h"

@interface StartScene()
@property (nonatomic, strong) BGNode* bg;
@property (nonatomic, strong) SKSpriteNode* title;
@property (nonatomic, strong) SKSpriteNode* plane;
@property (nonatomic, strong) SKLabelNode* normalNode;
@property (nonatomic, strong) SKLabelNode* scoreNode;

@end

@implementation StartScene

- (void)didMoveToView:(SKView *)view{
    
    self.scaleMode = SKSceneScaleModeAspectFill;

    self.bg = [BGNode nodeWithSize:self.size];
    [self addChild:self.bg];
    
    self.title = [SKSpriteNode spriteNodeWithImageNamed:NSLocalizedString(@"LOGO_NAME", nil)];
    self.title.size = CGSizeMake(128, 32);
    self.title.position = CGPointMake(self.size.width / 2, self.size.height - 60);
    [self addChild:self.title];
    
    SKTexture* texture1 = [TextureCache textureNamed:Texture_HERO_FLY_1];
    SKTexture* texture2 = [TextureCache textureNamed:Texture_HERO_FLY_2];
    self.plane = [SKSpriteNode spriteNodeWithTexture:texture1];
    self.plane.size = CGSizeMake(66, 82);
    self.plane.position = CGPointMake(self.size.width / 2, (self.size.height + self.plane.size.height) / 2 + 10);
    SKAction* animated = [SKAction animateWithTextures:@[texture1,texture2] timePerFrame:0.1];
    [self.plane runAction:[SKAction repeatActionForever:animated]];
    
    [self addChild:self.plane];

    self.normalNode = [SKLabelNode labelNodeWithText:NSLocalizedString(@"START_GAME", nil)];
    self.normalNode.fontName = @"迷你简卡通";
    self.normalNode.fontSize = 20;
    self.normalNode.fontColor = [SKColor blackColor];
    self.normalNode.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 30);
    [self addChild:self.normalNode];
    
    self.scoreNode = [SKLabelNode labelNodeWithText:NSLocalizedString(@"RANKING_LIST", nil)];
    self.scoreNode.fontName = self.normalNode.fontName;
    self.scoreNode.fontSize = self.normalNode.fontSize;
    self.scoreNode.fontColor = self.normalNode.fontColor;
    self.scoreNode.position = CGPointMake(self.normalNode.position.x,self.normalNode.position.y - 40);
    [self addChild:self.scoreNode];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint location = [[touches anyObject] locationInNode:self];

    NSArray<SKNode*>* nodes = [self nodesAtPoint:location];
    
    if([nodes containsObject:self.normalNode]){
        
        GameScene* game = [[GameScene alloc] initWithSize:self.size];
        
        SKTransition* transition = [SKTransition doorsOpenHorizontalWithDuration:1];
        
        [self.view presentScene:game transition:transition];
        
    }else if ([nodes containsObject:self.scoreNode]){
        
        HistoryScene* history = [[HistoryScene alloc] initWithSize:self.size];
        
        SKTransition* transition = [SKTransition pushWithDirection:SKTransitionDirectionLeft duration:1];
        
        [self.view presentScene:history transition:transition];
    }
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
