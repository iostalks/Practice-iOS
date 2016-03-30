//
//  PageEnableViewController.m
//  UIScrollViewPractice
//
//  Created by Jone on 16/3/30.
//  Copyright © 2016年 Jone. All rights reserved.
//

#import "SHPageEnableViewController.h"

static CGFloat kPageWidth = 240;
static CGFloat kpadding   = 20;


@interface SHPageEnableViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewWidthConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWidthConstraint;
@end

@implementation SHPageEnableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupPage];
}

- (void)setupPage
{
    int totalCount = 5;
    self.scrollViewWidthConstraint.constant = kPageWidth + kpadding;
    self.contentWidthConstraint.constant = (kpadding + kPageWidth) * totalCount;
    
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    for (UIView *view in self.containerView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat y = (self.scrollView.frame.size.height - kPageWidth ) / 2;
    for (int index = 0; index <= totalCount; ++index) {
        CGFloat x = kpadding / 2 + (kPageWidth + kpadding) * index;
        CGRect frame = CGRectMake(x, y, kPageWidth, kPageWidth);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%ld",(long)index];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:22];
        label.backgroundColor = [UIColor redColor];
        label.layer.cornerRadius = kPageWidth / 2;
        label.layer.masksToBounds = YES;
        [self.containerView addSubview:label];
        
        
        UIButton *hitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        hitBtn.frame = label.frame;
        [hitBtn addTarget:self action:@selector(btnOnTouched) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:hitBtn];
    }
}

- (void)btnOnTouched
{
    NSLog(@"hit");
}

@end
