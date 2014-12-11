//
//  StarViewDemoViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-7.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "StarViewDemoViewController.h"

@interface StarViewDemoViewController ()

@end

@implementation StarViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *view = [StarView loadFromNib:@"StarView" andStar:@"1.5"];
    [self.starView addSubview:view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
