//
//  ZBarSDKDemoViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-13.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBarSDKDemoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *info;
- (IBAction)scanAction:(id)sender;

@end
