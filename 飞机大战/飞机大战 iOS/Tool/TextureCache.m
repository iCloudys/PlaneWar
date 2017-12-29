//
//  TextureCache.m
//  飞机大战 iOS
//
//  Created by Mac on 2017/12/21.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#import "TextureCache.h"

static  NSMutableDictionary<TextureName,SKTexture*>* _cache;

@implementation TextureCache

+ (instancetype)cache{
    
    static TextureCache* cache = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[super allocWithZone:NULL] init];
        [self reloadData];
    });
    return cache;
}

- (id)copyWithZone:(NSZone *)zone{
    return [TextureCache cache];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [TextureCache cache];
}

+ (void)reloadData{
    
    if (!_cache) {
        _cache = [NSMutableDictionary dictionary];
    }else{
        if (_cache.count > 0) {
            [_cache removeAllObjects];
        }
    }
    
    SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:@"gameArts-hd"];
    
    for (NSString* textureName in atlas.textureNames) {
        SKTexture* texture = [atlas textureNamed:textureName];
        NSString* key = [self nameWithString:textureName];
        [_cache setObject:texture forKey:key];
    }
}


+ (SKTexture*)textureNamed:(TextureName)name{
    if (!_cache) {
        [self reloadData];
    }
    return [_cache objectForKey:[self nameWithString:name]];
}

+ (BOOL)hasTextureWithName:(TextureName)name{
    if (!_cache) {
        [self reloadData];
    }
    return [[_cache allKeys] containsObject:[self nameWithString:name]];
}

+ (TextureName)nameWithString:(NSString*)string{
    string = string.stringByDeletingPathExtension;
    return string.uppercaseString;
}

@end
