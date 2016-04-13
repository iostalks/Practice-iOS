//
//  SWWaveView.m
//  Skyworth
//
//  Created by Jone on 16/4/13.
//  Copyright © 2016年 HangZhou DeLan Technology Co. All rights reserved.
//

#import "ISWaterWaveView.h"

@interface ISWaterWaveView()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) CAShapeLayer  *waveLayer;
@property (nonatomic, strong) UIBezierPath  *wavePath;

@property (nonatomic, assign) CGFloat waveHeight;
@property (nonatomic, assign) CGFloat waveWidth;
@property (nonatomic, assign) CGFloat offsetX;

@end


@implementation ISWaterWaveView

- (instancetype)init
{
    NSAssert(0, @"water wave view must init by initWithFrame:");
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseConfig];
        
        _waveWidth  = frame.size.width;
        _waveHeight = frame.size.height / 2; // water wave depth
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self baseConfig];
        
        _waveWidth  = self.frame.size.width;
        _waveHeight = self.frame.size.height / 2;
    }
    return self;
}

- (void)baseConfig
{
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    
    _waveColor  = [UIColor colorWithRed:0.0 green:0.7216 blue:1.0 alpha:1.0];
}


- (void)setDepthScale:(CGFloat)depthScale
{
    _depthScale = depthScale;
    _waveHeight = self.frame.size.height * depthScale;
}

- (void)startWave
{
    if (!self) {
        return;
    }
    
    _wavePath = [UIBezierPath bezierPath];
    
    _waveLayer = [CAShapeLayer layer];
    _waveLayer.fillColor = _waveColor.CGColor;
    [self.layer addSublayer:_waveLayer];
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateWave:)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)animateWave:(CADisplayLink *)displayLink
{
    _offsetX += self.moveSpeed;
    
    CGPathRef pathRef = [self getCurrentWavePath];
    
    _waveLayer.path = pathRef;
    
    CGPathRelease(pathRef);
    
}

- (CGPathRef)getCurrentWavePath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, _waveHeight);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <= _waveWidth; ++x) {
        y = self.amplitude * sinf((2 * M_PI) * (x / _waveWidth - _offsetX / 360)) + _waveHeight;
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    
    CGPathAddLineToPoint(path, NULL, _waveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, NULL, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
   
    return path;
}

- (void)stopWave
{
    [_waveLayer removeFromSuperlayer];
    
    [_displayLink invalidate];
    _displayLink = nil;
}


@end
