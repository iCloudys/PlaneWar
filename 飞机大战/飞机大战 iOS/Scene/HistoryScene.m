//
//  HistoryScene.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/28.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "HistoryScene.h"
#import "BGNode.h"
#import "StartScene.h"

@interface HistoryScene()
@property (nonatomic, strong) BGNode* bg;
@property (nonatomic, strong) SKSpriteNode* backBtn;
@end

@implementation HistoryScene


- (void)didMoveToView:(SKView *)view{
    
    self.scaleMode = SKSceneScaleModeAspectFill;

    self.bg = [BGNode nodeWithSize:self.size];
    [self addChild:self.bg];
    
    SKTexture* texture = [SKTexture textureWithImageNamed:@"navi_back"];
    self.backBtn = [SKSpriteNode spriteNodeWithTexture:texture];
    self.backBtn.color = [SKColor redColor];
    self.backBtn.zPosition = 100;
    self.backBtn.size = CGSizeMake(28, 29);
    self.backBtn.position = CGPointMake(self.backBtn.size.width / 2 + 10, self.size.height - self.backBtn.size.height / 2 - 10);
    [self addChild:self.backBtn];

    [self drawList];
}


- (void)drawList{
    
    NSArray<NSDictionary<SKScoreOptionKey,id>*>* scores = [NSArray arrayWithContentsOfFile:score_path()];
    
    for (unsigned int i = 0; i < scores.count; i ++) {
        
        NSDictionary<SKScoreOptionKey,id>* score = scores[i];
        
        SKLabelNode* date_label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        date_label.fontSize = 17;
        date_label.text = score[kScoreOptionDateKey];
        date_label.fontColor = [SKColor blackColor];
        date_label.position = CGPointMake(self.size.width / 4 + 16, (self.size.height - 44 - 400) / 2 + 400 - i * 40);
        [self addChild:date_label];
        
        SKLabelNode* score_label = [SKLabelNode labelNodeWithFontNamed:date_label.fontName];
        score_label.fontSize = date_label.fontSize;
        score_label.text = [NSString stringWithFormat:@"%@",score[kScoreOptionScoreKey]];
        score_label.fontColor = date_label.fontColor;
        score_label.position = CGPointMake(self.size.width / 4 * 3, date_label.position.y);
        [self addChild:score_label];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    NSArray<SKNode*>*nodes = [self nodesAtPoint:[touch locationInNode:self]];
    if ([nodes containsObject:self.backBtn]) {
        StartScene* start = [[StartScene alloc] initWithSize:self.size];
        SKTransition* pop = [SKTransition pushWithDirection:SKTransitionDirectionRight duration:1];
        [self.view presentScene:start transition:pop];
    }
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
