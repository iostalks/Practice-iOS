//
//  SHOffsetViewController.m
//  UIScrollViewPractice
//
//  Created by Jone on 16/3/30.
//  Copyright © 2016年 Jone. All rights reserved.
//

#import "SHOffsetViewController.h"

static CGFloat kPageWidth = 80;
static CGFloat kpadding   = 20;

@interface SHOffsetViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidthConstraint;

@end

@implementation SHOffsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}


- (void)setupSubviews
{
    int total = 30;
    
    for (UIView *view in self.containerView.subviews) {
        [view removeFromSuperview];
    }
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    CGFloat x = (self.scrollView.frame.size.width - kPageWidth) / 2;
    CGFloat y = (self.scrollView.frame.size.height - kPageWidth) / 2;
    for (int index = 0; index <= total; ++index) {
        CGRect frame = CGRectMake(x, y, kPageWidth, kPageWidth);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.backgroundColor = [UIColor colorWithRed:0.1877 green:0.5138 blue:0.9837 alpha:1.0];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%d", index];
        label.layer.cornerRadius = kPageWidth / 2;
        label.layer.masksToBounds = YES;
        [self.containerView addSubview:label];
        x += kPageWidth + kpadding;
    }
    self.contentWidthConstraint.constant = x + (self.scrollView.frame.size.width - kPageWidth) / 2 - kpadding;
    
    [self.view setNeedsLayout];
}

- (CGPoint)nearestPointForTargetPoint:(CGPoint)offset
{
    CGFloat pageSize = (kPageWidth + kpadding);
    NSInteger index = offset.x / pageSize;
    CGFloat newX = index * pageSize;
    return CGPointMake(newX, offset.y);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint targetPoint = [self nearestPointForTargetPoint:*targetContentOffset];
    targetContentOffset -> x = targetPoint.x;
    targetContentOffset -> y = targetPoint.y;
}
@end
