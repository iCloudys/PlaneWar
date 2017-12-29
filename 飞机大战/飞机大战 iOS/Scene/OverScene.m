//
//  OverScene.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/28.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "OverScene.h"

#import "BGNode.h"
#import "StartScene.h"
#import "GameScene.h"

@interface OverScene()
@property (nonatomic, strong) BGNode* bg;
@property (nonatomic, strong) SKSpriteNode* title;
@property (nonatomic, strong) SKLabelNode* gameOver;

@property (nonatomic, strong) SKLabelNode* scoreNode;

@property (nonatomic, strong) SKLabelNode* continueNode;
@property (nonatomic, strong) SKLabelNode* homeNode;

@end

@implementation OverScene

- (void)didMoveToView:(SKView *)view{
    
    self.scaleMode = SKSceneScaleModeAspectFill;
    
    self.bg = [BGNode nodeWithSize:self.size];
    [self addChild:self.bg];
    
    self.title = [SKSpriteNode spriteNodeWithImageNamed:NSLocalizedString(@"LOGO_NAME", nil)];
    self.title.size = CGSizeMake(128, 32);
    self.title.position = CGPointMake(self.size.width / 2, self.size.height - 60);
    [self addChild:self.title];
    
    self.gameOver = [SKLabelNode labelNodeWithText:@"GameOver !"];
    self.gameOver.fontName = @"Chalkduster";
    self.gameOver.fontSize = 40;
    self.gameOver.fontColor = [SKColor grayColor];
    self.gameOver.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 50);
    [self addChild:self.gameOver];
    
    self.scoreNode = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"score:%.0f",self.score]];
    self.scoreNode.fontName = self.gameOver.fontName;
    self.scoreNode.fontSize = 20;
    self.scoreNode.fontColor = [SKColor colorWithRed:171 / 255.0 green:60 / 255.0 blue:58 / 255.0 alpha:1];
    self.scoreNode.position = CGPointMake(self.size.width / 2, self.gameOver.position.y - 40);
    [self addChild:self.scoreNode];
    
    self.continueNode = [SKLabelNode labelNodeWithText:NSLocalizedString(@"RESTART", nil)];
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
    
    [self saveScore];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint location = [[touches anyObject] locationInNode:self];
    
    NSArray<SKNode*>* nodes = [self nodesAtPoint:location];
    
    if ([nodes containsObject:self.continueNode]) {
        
        GameScene* game = [GameScene sceneWithSize:self.size];
        
        SKTransition* transition = [SKTransition fadeWithDuration:1];
        
        [self.view presentScene:game transition:transition];
        
    }else if ([nodes containsObject:self.homeNode]){
        
        StartScene* start = [StartScene sceneWithSize:self.size];
        
        SKTransition* transition = [SKTransition pushWithDirection:SKTransitionDirectionRight duration:1];
        
        [self.view presentScene:start transition:transition];
    }
}

//保存分数
- (void)saveScore{
    
    NSString* path = score_path();
    NSMutableArray<NSDictionary<SKScoreOptionKey,id>*>* scores = [NSArray arrayWithContentsOfFile:path].mutableCopy;
    if (!scores) {
        scores = [NSMutableArray array];
    }
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd hh:mm";
    
    NSMutableDictionary<SKScoreOptionKey,id>* score = [NSMutableDictionary dictionary];
    [score setObject:@(self.score) forKey:kScoreOptionScoreKey];
    [score setObject:[formatter stringFromDate:[NSDate date]] forKey:kScoreOptionDateKey];
    
    if (scores.count == 10) {
        [scores removeLastObject];
    }
    
    NSUInteger index = [scores indexOfObjectPassingTest:^BOOL(NSDictionary<SKScoreOptionKey,id> * obj, NSUInteger idx, BOOL * stop) {
        if ([obj[kScoreOptionScoreKey] compare:score[kScoreOptionScoreKey]] != NSOrderedDescending) {
            *stop = YES;
        }
        return *stop;
    }];
    
    [scores insertObject:score atIndex:index == NSNotFound ? scores.count : index];
    
    [scores writeToFile:path atomically:YES];
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end

