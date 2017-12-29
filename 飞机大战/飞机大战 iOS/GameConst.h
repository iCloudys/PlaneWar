//
//  GameConst.h
//  飞机大战
//
//  Created by Mac on 2017/12/25.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#ifndef GameConst_h
#define GameConst_h

#ifndef kPlayerSize
#define kPlayerSize CGSizeMake(66, 72)
#endif

typedef NSString* SKActionKey;
typedef NSString* SKNodeName;
typedef NSString* SKScoreOptionKey;

static SKNodeName const kPlayerName = @"kPlayerName";

static SKActionKey const kPlayerFlyKey = @"kPlayerFlyKey";
static SKActionKey const kPlayerFireKey = @"kPlayerFireKey";
static SKActionKey const kBulletMovingKey = @"kBulletMovingKey";
static SKActionKey const kEnemyFlyKey = @"kEnemyFlyKey";
static SKActionKey const kEnemyManagerStartKey = @"kEnemyManagerStartKey";

static SKScoreOptionKey const kScoreOptionDateKey = @"kScoreOptionDateKey";
static SKScoreOptionKey const kScoreOptionScoreKey = @"kScoreOptionScoreKey";

typedef NS_OPTIONS(NSUInteger, GamePhysicsType) {
    GamePhysicsTypePlayer = 1 << 0,
    GamePhysicsTypeEnemy = 1 << 1,
    GamePhysicsTypeBullet = 1 << 2,
    GamePhysicsTypeGuard = 1 << 3,
};


CG_INLINE
UIOffset offset(CGPoint point1,CGPoint point2){
    return UIOffsetMake(point2.x - point1.x, point2.y - point1.y);
}

CG_INLINE
NSString* score_path(){
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/score.plist"];
    NSLog(@"path:%@",path);
    return path;
}

#endif /* GameConst_h */
