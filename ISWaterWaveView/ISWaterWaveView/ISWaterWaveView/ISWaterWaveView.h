//
//  SWWaveView.h
//  Skyworth
//
//  Created by Jone on 16/4/13.
//  Copyright © 2016年 HangZhou DeLan Technology Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISWaterWaveView : UIView

/**
 *  the speed of wave move
 */
@property (nonatomic, assign) CGFloat moveSpeed;

/**
 *  the amplitude of wave 振幅
 */
@property (nonatomic, assign) CGFloat amplitude;

/**
 *  the depth scale of height between [0, 1] 波纹深度占高度比例
 *  Default 0.5
 */
@property (nonatomic, assign) CGFloat depthScale;

/**
 *  the color of wave
 */
@property (nonatomic, strong) UIColor *waveColor; // Default Sky Blue Color.

/**
 *  start wave animation
 */
- (void)startWave;

/**
 *  stop wave animation
 *  must be invoke when view controller delloc
 */
- (void)stopWave;

@end
