//
//  TableviewMutiSelectViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-19.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "TableviewMutiSelectViewController.h"

@interface TableviewMutiSelectViewController ()

@end

@implementation TableviewMutiSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.datas = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    [self.tableview setEditing:YES animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];;
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self updateDataWithTableview:tableView];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self updateDataWithTableview:tableView];
}
- (void)updateDataWithTableview:(UITableView *)tableView {
    NSArray *indexpaths = [tableView indexPathsForSelectedRows];
    NSMutableArray *selectedItems = [NSMutableArray new];
    for (NSIndexPath *indexpath in indexpaths) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexpath];
        [selectedItems addObject:cell.textLabel.text];
    }
    self.label.text = [selectedItems componentsJoinedByString:@";"];
}
@end
