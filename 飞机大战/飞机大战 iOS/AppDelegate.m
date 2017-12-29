//
//  AppDelegate.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/19.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] init];
    
    self.window.frame = [UIScreen mainScreen].bounds;
    
    self.window.rootViewController = [[GameViewController alloc] init];
    
    [self.window makeKeyAndVisible];
        
    return YES;
}


@end
