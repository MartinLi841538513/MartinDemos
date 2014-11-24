//
//  ScrollPageViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-11-24.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MartinLiPageScrollView.h"

@interface ScrollPageViewController : UIViewController<MartinLiPageScrollViewDelegate>
@property (weak, nonatomic) IBOutlet MartinLiPageScrollView *pageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@end
