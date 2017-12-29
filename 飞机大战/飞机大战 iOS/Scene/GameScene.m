//
//  GameScene.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "GameScene.h"
#import "PauseScene.h"
#import "BGNode.h"
#import "Player.h"
#import "Bullet.h"
#import "EnemyManager.h"
#import "OverScene.h"

@interface GameScene()<SKPhysicsContactDelegate>
@property (nonatomic, strong) BGNode* bg;
@property (nonatomic, strong) Player* player;
@property (nonatomic, strong) EnemyManager* enemyManager;

@property (nonatomic, strong) Guard* guard;

@property (nonatomic, assign) CGFloat totalScore;
@property (nonatomic, strong) SKLabelNode* scoreBoard;

@property (nonatomic, strong) SKSpriteNode* pauseBtn;

@end

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if (self) {
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, 0);
    }
    return self;
}

- (void)didMoveToView:(SKView *)view{
    
    self.scaleMode = SKSceneScaleModeAspectFill;

    if (!self.bg) {
        self.bg = [BGNode nodeWithSize:self.size];
        [self addChild:self.bg];
    }
    
    if (!self.guard) {
        self.guard = [Guard node];
        self.guard.position = CGPointMake(self.size.width / 2, self.size.height + 50);
        [self addChild:self.guard];
    }
    
    if (!self.scoreBoard) {
        self.scoreBoard = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        self.scoreBoard.zPosition = 100;
        self.scoreBoard.fontSize = 17;
        self.scoreBoard.text = @"0";
        self.scoreBoard.fontColor = [SKColor blackColor];
        self.scoreBoard.position = CGPointMake(self.size.width - 20, self.size.height - 30);
        self.scoreBoard.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
        [self addChild:self.scoreBoard];
    }
    
    if (!self.pauseBtn) {
        self.pauseBtn = [SKSpriteNode spriteNodeWithTexture:[TextureCache textureNamed:Texture_GAME_PAUSE]];
        self.pauseBtn.zPosition = 100;
        self.pauseBtn.size = CGSizeMake(28, 29);
        self.pauseBtn.position = CGPointMake(self.pauseBtn.size.width / 2 + 10, self.size.height - self.pauseBtn.size.height / 2 - 10);
        [self addChild:self.pauseBtn];
    }
    
    if (!self.player) {
        self.player = [Player node];
        self.player.position = CGPointMake(self.size.width / 2, 0);
        
        SKRange* x = [SKRange rangeWithLowerLimit:self.player.size.width / 2 upperLimit:self.size.width - self.player.size.width / 2];
        SKRange* y = [SKRange rangeWithLowerLimit:0 upperLimit:self.size.height - self.player.size.height];
        self.player.constraints = @[[SKConstraint positionX:x Y:y]];
        
        [self addChild:self.player];
    }
    
    [self.player takeoff];
    [self.player fire];
    
    if (!self.enemyManager) {
        self.enemyManager = [EnemyManager node];
        [self addChild:self.enemyManager];
    }
    
    [self.enemyManager start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    NSArray<SKNode*>*nodes = [self nodesAtPoint:[touch locationInNode:self]];
    if ([nodes containsObject:self.pauseBtn]) {
        self.paused = YES;
        self.enemyManager.paused = YES;
        PauseScene* pause = [PauseScene sceneWithSize:self.size];
        pause.from = self;
        SKTransition* transtion = [SKTransition doorsCloseHorizontalWithDuration:1];
        [self.view presentScene:pause transition:transtion];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    CGPoint prevLocation = [touch previousLocationInNode:self];
    [self.player moveByOffset:offset(location, prevLocation) size:self.size];
}

- (void)update:(NSTimeInterval)currentTime{
    [self.bg scrollLoop];
}


- (void)didBeginContact:(SKPhysicsContact *)contact{
    
    [self physicsBodyDidContact:contact.bodyA];
    [self physicsBodyDidContact:contact.bodyB];

}

- (void)physicsBodyDidContact:(SKPhysicsBody*)body{
    switch (body.categoryBitMask) {
        case GamePhysicsTypePlayer:
        {
            //死亡
            id<PlaneProtocol> plane = (id<PlaneProtocol>)body.node;
            [plane died];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                //跳转
                OverScene* gameOver = [OverScene sceneWithSize:self.size];
                
                gameOver.score = self.totalScore;
                
                SKTransition* transition = [SKTransition fadeWithDuration:1];
                
                [self.view presentScene:gameOver transition:transition];
                
            });
            
        }
            break;
        case GamePhysicsTypeBullet:
        {
            SKNode* bullet = body.node;
            [bullet removeFromParent];
        }
            break;
        case GamePhysicsTypeEnemy:
        {
            id<PlaneProtocol> plane = (id<PlaneProtocol>)body.node;
            [plane died];
            self.totalScore += plane.score;
            self.scoreBoard.text = [NSString stringWithFormat:@"%.0f",self.totalScore];
        }
            break;
    }
}

- (void)dealloc{
    NSLog(@"dealloc:%@",self);
}

@end
