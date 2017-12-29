//
//  GameViewController.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/19.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "GameViewController.h"
#import "StartScene.h"
#import "PauseScene.h"
#import "GameScene.h"

@interface GameViewController()

@property (nonatomic, strong) GameScene* gameScene;
@property (nonatomic, strong) PauseScene* pauseScene;

@end

@implementation GameViewController

- (void)loadView{
    self.view = [[SKView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    StartScene *scene = [StartScene sceneWithSize:self.view.bounds.size];
    
    SKView *skView = (SKView *)self.view;
    [skView presentScene:scene];
    skView.ignoresSiblingOrder = YES;
#if DEBUG
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsPhysics = YES;
#endif
}

- (BOOL)prefersHomeIndicatorAutoHidden{
    return YES;
}

@end
