//
//  EGOImageLoadingViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-5.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "EGOImageLoadingViewController.h"

@interface EGOImageLoadingViewController ()

@end

@implementation EGOImageLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imgView.imageURL = [NSURL URLWithString:@"http://222.243.208.187/yc/image/8296954b-1306-44e9-8ec5-bcb482e84817_320.jpg"];
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
