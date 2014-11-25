//
//  SecondViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-25.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<MLFloatButtonDelegate>
@end
@implementation SecondViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.floatButton showInFatherView:self.view];
}

#pragma MLFloatButtonDelegate
-(void)buttonTouchAction{
    NSLog(@"SecondViewController floatButton touched");
}
@end
