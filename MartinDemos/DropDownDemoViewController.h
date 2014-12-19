//
//  DropDownDemoViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-15.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownListView.h"
#import "DropDownChooseProtocol.h"

@interface DropDownDemoViewController : UIViewController<DropDownChooseDelegate,DropDownChooseDataSource>
@property (weak, nonatomic) IBOutlet DropDownListView *dropDownView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dropDownViewHeight;
@property(nonatomic,strong)NSArray *chooseArray;
@end
