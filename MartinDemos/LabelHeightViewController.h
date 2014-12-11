//
//  LabelHeightViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-8.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelHeightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelHeight;

@end
