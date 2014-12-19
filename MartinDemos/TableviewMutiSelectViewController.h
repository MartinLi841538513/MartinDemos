//
//  TableviewMutiSelectViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-19.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableviewMutiSelectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *datas;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end
