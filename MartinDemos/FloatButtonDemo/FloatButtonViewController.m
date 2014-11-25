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

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view.
    floatButton = [MLFloatButton loadFromNibWithFrame:CGRectMake(100, 100, 32, 32) addTarget:self InSuperView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"FloatButtonPush"]) {
        SecondViewController *target = segue.destinationViewController;
        target.floatButton = floatButton;
        target.floatButton.floatButtonDelegate = (id)target; //重新设置代理controller
        target.floatButton.fatherView = target.view;//重新设置父视图
    }
}


#pragma MLFloatButtonDelegate
-(void)buttonTouchAction{
    NSLog(@"button action");

}
@end
