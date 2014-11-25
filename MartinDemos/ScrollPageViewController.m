//
//  ScrollPageViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-24.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "ScrollPageViewController.h"

@interface ScrollPageViewController ()


@end

@implementation ScrollPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageView.imgs = [NSArray arrayWithObjects:@"testImg1.png",@"testImg1.png",@"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg", nil];
    self.pageView.titles = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    self.pageView.martinLiPageScrollViewDelegate = self;
    self.pageView.height = self.height.constant;
    self.pageView.timeInterval = 2;
    self.pageView.titleIsHidden = NO;
    [self.pageView updatePageViewInSuperView:self.view];

}


#pragma MartinLiPageScrollViewDelegate
-(void)imgViewDidTouchActionAtIndex:(NSInteger)index{
    NSLog(@"%d",index);
}
@end
