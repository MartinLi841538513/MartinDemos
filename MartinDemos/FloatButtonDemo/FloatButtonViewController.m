//
//  FloatButtonViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-25.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "FloatButtonViewController.h"
#import "MLFloatButton.h"
#import "SecondViewController.h"
@interface FloatButtonViewController ()<MLFloatButtonDelegate>
{
    MLFloatButton *floatButton;
}
@end
@implementation FloatButtonViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    floatButton = [MLFloatButton loadFromNibWithFrame:CGRectMake(100, 100, 32, 32) addTarget:self InSuperView:self.view];//这里一定要在viewWillAppear实现，否则，popBack将会看不到效果
 
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"FloatButtonPush"]) {
        SecondViewController *target = segue.destinationViewController;
        target.floatButton = floatButton;
        target.floatButton.floatButtonDelegate = (id)target; //重新设置代理controller
    }
}

#pragma MLFloatButtonDelegate
-(void)buttonTouchAction{
    NSLog(@"button action");
}
@end
