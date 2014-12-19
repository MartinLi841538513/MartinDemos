//
//  PickerDemoViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-13.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerDemoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *seletButton;
- (IBAction)selectAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectButton2;
- (IBAction)selectAction2:(id)sender;

@end
