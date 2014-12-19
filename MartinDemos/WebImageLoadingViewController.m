//
//  EGOImageLoadingViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-5.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "WebImageLoadingViewController.h"
#import <UIImageView+AFNetworking.h>
@interface WebImageLoadingViewController ()

@end

@implementation WebImageLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.imgView是EGO的网络图片加载方式，不太好用，但是兼容性好
    self.imgView.imageURL = [NSURL URLWithString:@"http://222.243.208.187/yc/image/8296954b-1306-44e9-8ec5-bcb482e84817_320.jpg"];
    
    //AFNetworking的网络图片加载方式
    [self.imgView2 setImageWithURL:[NSURL URLWithString:@"https://www.google.com.hk/images/srpr/logo11w.png"]];
    
    //还有一种是SDWebImage，挺好用的，跟AFNetworking使用类似
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
