//
//  ViewController.m
//  ISWaterWaveView
//
//  Created by Jone on 16/4/13.
//  Copyright © 2016年 Jone. All rights reserved.
//

#import "ViewController.h"
#import "ISWaterWaveView.h"

@interface ViewController ()
@property (nonatomic) ISWaterWaveView *waterView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ISWaterWaveView *waveView = [[ISWaterWaveView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    waveView.center = self.view.center;
    waveView.amplitude = 30;
    waveView.moveSpeed = 3;
    [waveView startWave];
    [self.view addSubview:waveView];
    self.waterView = waveView;
}

- (IBAction)stop:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.waterView stopWave];
    }else {
        [self.waterView startWave];
    }
    
}

@end
