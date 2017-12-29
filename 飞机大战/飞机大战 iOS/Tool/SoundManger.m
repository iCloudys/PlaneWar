//
//  SoundManger.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/29.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "SoundManger.h"

@implementation SoundManger

+ (void)playSound:(SKSoundName)sound node:(SKNode*)node{

    SKAction* soundAction = [SKAction playSoundFileNamed:sound waitForCompletion:YES];

    [node runAction:soundAction];

}

@end
