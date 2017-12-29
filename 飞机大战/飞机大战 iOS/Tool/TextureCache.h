//
//  TextureCache.h
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/21.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SKTexture.h>
#import <SpriteKit/SKTextureAtlas.h>
#import <SpriteKit/SKMutableTexture.h>

typedef NSString* TextureName;

@interface TextureCache : NSObject

+ (instancetype)cache;


/**
 从缓存获取指定name

 @param name key
 @return SKTexture or nil
 */
+ (SKTexture*)textureNamed:(TextureName)name;


/**
 查询是否存在指定缓存

 @param name name
 @return 存在返回YES 否则返回NO
 */
+ (BOOL)hasTextureWithName:(TextureName)name;


/**
 重新加载缓存
 */
+ (void)reloadData;


/**
 通过字符串生成符合格式的key

 @param string 字符串
 @return key
 */
+ (TextureName)nameWithString:(NSString*)string;

@end

//背景
static TextureName const Texture_BACKGROUND_2 =         @"BACKGROUND_2";
static TextureName const Texture_BOMB =                 @"BOMB";
static TextureName const Texture_BULLET1 =              @"BULLET1";
static TextureName const Texture_BULLET2 =              @"BULLET2";
static TextureName const Texture_ENEMY1_BLOWUP_1 =      @"ENEMY1_BLOWUP_1";
static TextureName const Texture_ENEMY1_BLOWUP_2 =      @"ENEMY1_BLOWUP_2";
static TextureName const Texture_ENEMY1_BLOWUP_3 =      @"ENEMY1_BLOWUP_3";
static TextureName const Texture_ENEMY1_BLOWUP_4 =      @"ENEMY1_BLOWUP_4";
static TextureName const Texture_ENEMY1_FLY_1 =         @"ENEMY1_FLY_1";
static TextureName const Texture_ENEMY2_BLOWUP_1 =      @"ENEMY2_BLOWUP_1";
static TextureName const Texture_ENEMY2_BLOWUP_2 =      @"ENEMY2_BLOWUP_2";
static TextureName const Texture_ENEMY2_BLOWUP_3 =      @"ENEMY2_BLOWUP_3";
static TextureName const Texture_ENEMY2_BLOWUP_4 =      @"ENEMY2_BLOWUP_4";
static TextureName const Texture_ENEMY2_BLOWUP_5 =      @"ENEMY2_BLOWUP_5";
static TextureName const Texture_ENEMY2_BLOWUP_6 =      @"ENEMY2_BLOWUP_6";
static TextureName const Texture_ENEMY2_BLOWUP_7 =      @"ENEMY2_BLOWUP_7";
static TextureName const Texture_ENEMY2_FLY_1 =         @"ENEMY2_FLY_1";
static TextureName const Texture_ENEMY2_FLY_2 =         @"ENEMY2_FLY_2";
static TextureName const Texture_ENEMY2_HIT_1 =         @"ENEMY2_HIT_1";
static TextureName const Texture_ENEMY3_BLOWUP_1 =      @"ENEMY3_BLOWUP_1";
static TextureName const Texture_ENEMY3_BLOWUP_2 =      @"ENEMY3_BLOWUP_2";
static TextureName const Texture_ENEMY3_BLOWUP_3 =      @"ENEMY3_BLOWUP_3";
static TextureName const Texture_ENEMY3_BLOWUP_4 =      @"ENEMY3_BLOWUP_4";
static TextureName const Texture_ENEMY3_FLY_1 =         @"ENEMY3_FLY_1";
static TextureName const Texture_ENEMY3_HIT_1 =         @"ENEMY3_HIT_1";
static TextureName const Texture_ENEMY3_HIT_2 =         @"ENEMY3_HIT_2";
static TextureName const Texture_ENEMY4_FLY_1 =         @"ENEMY4_FLY_1";
static TextureName const Texture_ENEMY5_FLY_1 =         @"ENEMY5_FLY_1";
static TextureName const Texture_GAME_PAUSE =           @"GAME_PAUSE";
static TextureName const Texture_GAME_PAUSE_HL =        @"GAME_PAUSE_HL";
static TextureName const Texture_HERO_BLOWUP_1 =        @"HERO_BLOWUP_1";
static TextureName const Texture_HERO_BLOWUP_2 =        @"HERO_BLOWUP_2";
static TextureName const Texture_HERO_BLOWUP_3 =        @"HERO_BLOWUP_3";
static TextureName const Texture_HERO_BLOWUP_4 =        @"HERO_BLOWUP_4";
static TextureName const Texture_HERO_FLY_1 =           @"HERO_FLY_1";
static TextureName const Texture_HERO_FLY_2 =           @"HERO_FLY_2";
static TextureName const Texture_LOADING0 =             @"LOADING0";
static TextureName const Texture_LOADING1 =             @"LOADING1";
static TextureName const Texture_LOADING2 =             @"LOADING2";
static TextureName const Texture_LOADING3 =             @"LOADING3";

