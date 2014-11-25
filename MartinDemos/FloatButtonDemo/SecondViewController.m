//
//  SecondViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-25.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<MLFloatButtonDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view addSubview:self.floatButton];

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

#pragma MLFloatButtonDelegate
-(void)buttonTouchAction{
    NSLog(@"SecondViewController floatButton touched");
}
@end
