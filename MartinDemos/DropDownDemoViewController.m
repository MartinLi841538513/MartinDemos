//
//  DropDownDemoViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-15.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "DropDownDemoViewController.h"

@interface DropDownDemoViewController ()

@end

@implementation DropDownDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.chooseArray = [NSMutableArray arrayWithArray:@[
                                                   @[@"童明城",@"童赟",@"童林杰",@"老萧狗"],
                                                   @[@"郏童熙",@"胥童嘉",@"郑嘉琦"]
                                                   ]];
    self.dropDownView.dropDownDataSource = self;
    self.dropDownView.dropDownDelegate = self;
    self.dropDownView.height = self.dropDownViewHeight.constant;
    [self.dropDownView setView];
    self.dropDownView.mSuperView = self.view;
}


#pragma mark -- dropDownListDelegate
-(void) chooseAtSection:(NSInteger)section index:(NSInteger)index
{
    NSLog(@"童大爷选了section:%d ,index:%d",section,index);
}

#pragma mark -- dropdownList DataSource
-(NSInteger)numberOfSections
{
    return [self.chooseArray count];
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *arry =self.chooseArray[section];
    return [arry count];
}
-(NSString *)titleInSection:(NSInteger)section index:(NSInteger) index
{
    return self.chooseArray[section][index];
}
-(NSInteger)defaultShowSection:(NSInteger)section
{
    return 0;
}
@end
