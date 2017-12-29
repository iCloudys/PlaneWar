//
//  HomeViewController.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/23.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "HomeViewController.h"
#import "GameViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) CALayer* logoLayer;
@property (nonatomic, strong) CALayer* planeLayer;

@property (nonatomic, strong) UIButton* btn1;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = (__bridge id)([TextureCache textureNamed:Texture_BACKGROUND_2].CGImage);
    
    self.logoLayer = [CALayer layer];
    self.logoLayer.contents = (__bridge id)([UIImage imageNamed:@"logo"].CGImage);
    [self.view.layer addSublayer:self.logoLayer];
    
    self.planeLayer = [CALayer layer];
    self.planeLayer.contents = (__bridge id)([TextureCache textureNamed:Texture_HERO_FLY_1].CGImage);
    [self.view.layer addSublayer:self.planeLayer];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.btn1.titleLabel.font = [UIFont fontWithName:@"迷你简卡通" size:17];
    
    [self.btn1 setTitle:@"经典模式" forState:UIControlStateNormal];
    
    [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"button_normal"] forState:UIControlStateNormal];
    
    [self.btn1 setBackgroundImage:[UIImage imageNamed:@"button_highlight"] forState:UIControlStateHighlighted];
    
    [self.btn1 addTarget:self action:@selector(buttonTypeAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.btn1];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGFloat logoW = 128;
    CGFloat logoH = 32;
    CGFloat logoX = (CGRectGetWidth(self.view.bounds) - logoW) / 2;
    CGFloat logoY = 40;
    self.logoLayer.frame = CGRectMake(logoX, logoY, logoW, logoH);
    
    CGFloat planeW = 66;
    CGFloat planeH = 82;
    CGFloat planeX = (CGRectGetWidth(self.view.bounds) - planeW) / 2;
    CGFloat planeY = CGRectGetMidY(self.view.bounds) - planeH - 10;
    self.planeLayer.frame = CGRectMake(planeX, planeY, planeW, planeH);

    CGFloat btnW = 150;
    CGFloat btnH = 35;
    CGFloat btnX = CGRectGetMidX(self.view.bounds) - btnW / 2;
    CGFloat btnY = CGRectGetMidY(self.view.bounds);
    self.btn1.frame = CGRectMake(btnX,btnY, btnW, btnH);
}

- (void)buttonTypeAction:(UIButton*)btn{
    switch (btn.tag) {
        case 0:
        {
            GameViewController* game = [[GameViewController alloc] init];
            [self presentViewController:game animated:NO completion:NULL];
        }
            break;
        case 1:
            NSLog(@"点击关卡模式");
            break;
        case 2:
            NSLog(@"点击历史成绩");
            break;
    }
}

@end
