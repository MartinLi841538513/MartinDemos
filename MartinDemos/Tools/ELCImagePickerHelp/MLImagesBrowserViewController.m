//
//  MLImagesBrowserViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-21.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MLImagesBrowserViewController.h"

@interface MLImagesBrowserViewController ()<MartinLiPageScrollViewDelegate>

@end

@implementation MLImagesBrowserViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.pageView.imageType = self.imageType;//(必填)
    self.pageView.imgUrls = self.imgUrls;//（必填）
    self.pageView.images = self.images;
    self.pageView.titles = self.titles;//设置图片对应的title（可选）
    self.pageView.martinLiPageScrollViewDelegate = self;//（必填）
    self.pageView.height = [UIScreen mainScreen].bounds.size.height;//（必填）
//    self.pageView.timeInterval = 5;//默认自动滚动图片时间为2秒（可选）
//    self.pageView.isAutoScroll = NO;//默认是NO（可选）
    self.pageView.titleIsHidden = NO;//默认为NO（可选）
    self.pageView.pageViewType = MLPageScrollViewFullScreenMode;//默认是广告模式（可选）
    [self.pageView updatePageViewInFatherController:self];//（必填）
    self.pageView.defaultLocationIndex = self.defaultLocationIndex;//这一步必须放在最后。（可选）

}

#pragma MartinLiPageScrollViewDelegate
-(void)imgViewDidTouchActionAtIndex:(NSInteger)index inArray:(NSArray *)array{
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
}
@end
