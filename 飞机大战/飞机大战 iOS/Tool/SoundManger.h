//
//  SoundManger.h
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/29.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NSString* SKSoundName;

@interface SoundManger : NSObject

+ (void)playSound:(SKSoundName)sound node:(SKNode*)node;

@end

static SKSoundName const SOUND_ENEMY_BLOUP      = @"enemy_blowup";
static SKSoundName const SOUND_HERO_BLOUP       = @"hero_blowup";
static SKSoundName const SOUND_BOSS_BLOUP       = @"boss_blowup";
static SKSoundName const SOUND_BOSS_APPEAR      = @"boss_appear";
static SKSoundName const SOUND_BG               = @"bg_music";
