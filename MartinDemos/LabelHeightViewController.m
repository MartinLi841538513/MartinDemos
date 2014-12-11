//
//  LabelHeightViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-8.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "LabelHeightViewController.h"
#import "NSString+ML.h"

@interface LabelHeightViewController ()

@end

@implementation LabelHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *fullDescAndTagStr = @"Do any additional setup after loading the view from its nibDo any additional setup after loading the view from its nibDo any additional setup after loading the view from its nibDo any additional setup after loading the view from its nibDo any additional setup after loading the view from its nibDo any additional setup after loading the view from its nibs nibDo any additional setup after loading the view from its nibDo any additional setup after loading the view from its nib";
    
    self.labelHeight.constant = [NSString heightWithString:fullDescAndTagStr font:self.testLabel.font maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-8*2, 600)]+2;
    
    self.testLabel.text = fullDescAndTagStr;
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
