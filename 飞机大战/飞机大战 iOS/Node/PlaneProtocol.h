//
//  PlaneProtocol.h
//  飞机大战
//
//  Created by Mac on 2017/12/28.
//  Copyright © 2017年 RUIPENG. All rights reserved.
//

#ifndef PlaneProtocol_h
#define PlaneProtocol_h

@protocol PlaneProtocol <NSObject>

/**
 起飞
 */
- (void)takeoff;


/**
 降落
 */
- (void)landing;

/**
 被击落
 */
- (void)died;


@optional
/**
 发射子弹
 */
- (void)fire;


/**
 停止射击
 */
- (void)ceasefire;


/**
 分值
 */
- (CGFloat)score;


@end

#endif /* PlaneProtocol_h */
