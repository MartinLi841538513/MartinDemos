//
//  ViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-21.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "ViewController.h"
#import "TitleCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.datas = [NSArray arrayWithObjects:@"指纹识别",@"ScrollView分页",nil];
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
    if (row==0) {
        identifier = @"TouchIDViewController";
    }else if(row==1){
        identifier = @"ScrollPageViewController";
    }
    target = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:target animated:YES];

}
@end
