//
//  PauseScene.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/28.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "PauseScene.h"
#import "BGNode.h"
#import "StartScene.h"

@interface PauseScene()
@property (nonatomic, strong) BGNode* bg;
@property (nonatomic, strong) SKSpriteNode* title;
@property (nonatomic, strong) SKSpriteNode* plane;
@property (nonatomic, strong) SKLabelNode* continueNode;
@property (nonatomic, strong) SKLabelNode* homeNode;

@end

@implementation PauseScene

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
    
    self.continueNode = [SKLabelNode labelNodeWithText:NSLocalizedString(@"CONTINUE", nil)];
    self.continueNode.fontName = @"迷你简卡通";
    self.continueNode.fontSize = 20;
    self.continueNode.fontColor = [SKColor blackColor];
    self.continueNode.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 30);
    [self addChild:self.continueNode];
    
    self.homeNode = [SKLabelNode labelNodeWithText:NSLocalizedString(@"MENU", nil)];
    self.homeNode.fontName = self.continueNode.fontName;
    self.homeNode.fontSize = self.continueNode.fontSize;
    self.homeNode.fontColor = self.continueNode.fontColor;
    self.homeNode.position = CGPointMake(self.continueNode.position.x,self.continueNode.position.y - 40);
    [self addChild:self.homeNode];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint location = [[touches anyObject] locationInNode:self];
    
    NSArray<SKNode*>* nodes = [self nodesAtPoint:location];
    
    if ([nodes containsObject:self.continueNode]) {
        
        SKTransition* transition = [SKTransition doorsOpenHorizontalWithDuration:1];
     
        [self.view presentScene:self.from transition:transition];
        
    }else if ([nodes containsObject:self.homeNode]){
        
        StartScene* start = [StartScene sceneWithSize:self.size];
        
        SKTransition* transition = [SKTransition pushWithDirection:SKTransitionDirectionRight duration:1];

        [self.view presentScene:start transition:transition];
    }
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
