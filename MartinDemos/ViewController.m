//
//  ViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-21.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "ViewController.h"
#import "TitleCell.h"
#import "UploadImgViewController.h"
#import "TakePhotoViewControllerViewController.h"
#import "MapViewController.h"
#import "WebImageLoadingViewController.h"
#import "LocateViewController.h"
#import "StarViewDemoViewController.h"
#import "LabelHeightViewController.h"
#import "ZBarSDKDemoViewController.h"
#import "PickerDemoViewController.h"
#import "CalendarViewController.h"
#import "DropDownDemoViewController.h"
#import "TableviewMutiSelectViewController.h"
#import "MLImagesBrowserViewController.h"
#import "TextSendKeyboardViewController.h"
#import "BlueToothViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.datas = [NSArray arrayWithObjects:@"指纹识别",@"ScrollView分页",@"悬浮按钮",@"通讯录",@"HTTPClient上传图片",@"拍照",@"地图",@"WebImageLoading",@"定位",@"starViewDemo",@"LabelHeight",@"ZBar扫一扫",@"选择器",@"日历",@"仿美团的下拉菜单",@"tableview多选",@"图片全屏浏览",@"文字发送键盘",@"蓝牙开发",@"显示进度",@"欢迎界面",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.name.text = self.datas[row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    UIViewController *target = nil;
    NSString *identifier = nil;
    NSString *nibName = nil;
    if (row==0) {
        identifier = @"TouchIDViewController";
    }else if(row==1){
        identifier = @"ScrollPageViewController";
    }else if(row==2){
        identifier = @"FloatButtonViewController";
    }else if(row==3){
        identifier = @"ContactsViewController";
    }else if(row==4){
        nibName = @"UploadImgViewController";
        target = [[UploadImgViewController alloc] initWithNibName:nibName bundle:nil];
    }else if(row==5){
        identifier = @"MLMutiImagesChooseViewController";
//        nibName = @"TakePhotoViewControllerViewController";
//        target = [[TakePhotoViewControllerViewController alloc] initWithNibName:nibName bundle:nil];
    }else if(row==6){
        nibName = @"MapViewController";
        target = [[MapViewController alloc] initWithNibName:nibName bundle:nil];
    }else if(row==7){
        nibName = @"EGOImageLoadingViewController";
        target = [[WebImageLoadingViewController alloc] initWithNibName:nibName bundle:nil];
    }else if (row==8){
        nibName = @"LocateViewController";
        target = [[LocateViewController alloc] initWithNibName:nibName bundle:nil];
    }else if (row==9){
        target = [[StarViewDemoViewController alloc] initWithNibName:@"StarViewDemoViewController" bundle:nil];
    }else if(row==10){
        target = [[LabelHeightViewController alloc] initWithNibName:@"LabelHeightViewController" bundle:nil];
    }else if(row==11){
        target = [[ZBarSDKDemoViewController alloc] initWithNibName:@"ZBarSDKDemoViewController" bundle:nil];
    }else if(row==12){
        target = [[PickerDemoViewController alloc] initWithNibName:@"PickerDemoViewController" bundle:nil];
    }else if(row==13){
        target = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
    }else if(row==14){
        target = [[DropDownDemoViewController alloc] initWithNibName:@"DropDownDemoViewController" bundle:nil];
    }else if (row==15){
        target = [[TableviewMutiSelectViewController alloc] initWithNibName:@"TableviewMutiSelectViewController" bundle:nil];
    }else if (row==16){
        target = [[MLImagesBrowserViewController alloc] initWithNibName:@"MLImagesBrowserViewController" bundle:nil];
    }else if (row==17){
        target = [[TextSendKeyboardViewController alloc] initWithNibName:@"TextSendKeyboardViewController" bundle:nil];
    }else if (row==18){
        target = [[BlueToothViewController alloc] initWithNibName:@"BlueToothViewController" bundle:nil];
    }else if (row==19){
        target = [[ProgressShowController alloc] initWithNibName:@"ProgressShowController" bundle:nil];
    }else if (row==20){
        target = [[WelcomeViewController alloc] initWithNibName:@"WelcomeViewController" bundle:nil];
    }
    if (identifier!=nil) {
        target = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    }
    [self.navigationController pushViewController:target animated:YES];

}
@end
