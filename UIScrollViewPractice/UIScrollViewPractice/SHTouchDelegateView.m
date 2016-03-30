//
//  SHTouchDelegateView.m
//  UIScrollViewPractice
//
//  Created by Jone on 16/3/30.
//  Copyright © 2016年 Jone. All rights reserved.
//

#import "SHTouchDelegateView.h"

@implementation SHTouchDelegateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.touchDelegateView && [self pointInside:point withEvent:event]) {
        CGPoint newPoint = [self convertPoint:point toView:self.touchDelegateView];
        UIView *testView = [self.touchDelegateView hitTest:newPoint withEvent:event];
        if (testView) {
            return testView;
        }else {
            return self.touchDelegateView;
        }
    }
    return [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)setTouchDelegateView:(UIView *)touchDelegateView
{
    
}
@end
