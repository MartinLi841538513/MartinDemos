//
//  MLImagesBrowserViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-21.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MartinLiPageScrollView.h"
@interface MLImagesBrowserViewController : UIViewController
@property (weak, nonatomic) IBOutlet MartinLiPageScrollView *pageView;
@property(nonatomic,assign)NSInteger pageViewType;
@property(nonatomic,assign)NSInteger imageType;
@property(nonatomic,strong)NSArray *imgUrls;
@property(nonatomic,strong)NSArray *images;
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)NSArray *urls;
@property(nonatomic,assign)float height;
@property(nonatomic,assign)float timeInterval;
@property(nonatomic,assign)NSInteger defaultLocationIndex;
@property(nonatomic)BOOL titleIsHidden;  //默认BOOL为NO
@property(nonatomic)BOOL isAutoScroll;  //默认为NO
@end
