//
//  PickerDemoViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-13.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "PickerDemoViewController.h"
#import <RMPickerViewController.h>

@interface PickerDemoViewController ()<RMPickerViewControllerDelegate>

@property(nonatomic,strong)NSArray *components;

@end

@implementation PickerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RMPickerViewController Delegates
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.components.count;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *datas = self.components[component];
    return datas.count;
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *datas = self.components[component];
    return datas[row];
}

- (void)pickerViewController:(RMPickerViewController *)vc didSelectRows:(NSArray *)selectedRows {
    
    NSString *value = [self valueFromSelectedRows:selectedRows andComponents:self.components];
    if (vc.picker.tag==1) {
        [self.seletButton setTitle:value forState:UIControlStateNormal];
    }else if(vc.picker.tag==2){
        [self.selectButton2 setTitle:value forState:UIControlStateNormal];
    }
}

-(NSString *)valueFromSelectedRows:(NSArray *)selectedRows andComponents:(NSArray *)components{
    NSMutableString *value = [[NSMutableString alloc] init];
    for (int i=0; i<selectedRows.count; i++) {
        NSArray *datas = components[i];
        NSInteger index = [selectedRows[i] integerValue];
        [value appendString:datas[index]];
    }
    return value;
}

- (IBAction)selectAction:(id)sender {
    NSArray *datas1 = [NSArray arrayWithObjects:@"1~5支",@"6~10支",@"11~15支",@"1包",@"2包",@"3包",@"3包以上", nil];
    self.components = nil;
    self.components = [NSArray arrayWithObjects:datas1, nil];
    RMPickerViewController *pickerVC = [RMPickerViewController pickerController];
    pickerVC.picker.tag = 1;
    pickerVC.delegate = self;
    pickerVC.titleLabel.text = @"选择";
    pickerVC.disableBlurEffects = YES;
    [pickerVC show];

}
- (IBAction)selectAction2:(id)sender {
    NSArray *datas1 = [NSArray arrayWithObjects:@"1~5支",@"6~10支",@"11~15支",@"1包",@"2包",@"3包",@"3包以上", nil];
    self.components = nil;
    self.components = [NSArray arrayWithObjects:datas1, nil];
    RMPickerViewController *pickerVC = [RMPickerViewController pickerController];
    pickerVC.picker.tag = 2;
    pickerVC.delegate = self;
    pickerVC.titleLabel.text = @"选择";
    pickerVC.disableBlurEffects = YES;
    [pickerVC show];
}
@end
