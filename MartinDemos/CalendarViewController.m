//
//  CalendarViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-14.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarHomeViewController.h"
@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CalendarHomeViewController *chvc = [[CalendarHomeViewController alloc]init];
    [chvc setAirPlaneToDay:1 ToDateforString:nil];//飞机初始化方法
    
    [self addChildViewController:chvc];
    chvc.collectionView.frame = CGRectMake(12, 0, chvc.collectionView.frame.size.width, chvc.collectionView.frame.size.height);
    [self.calendarView addSubview:chvc.collectionView];

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

- (IBAction)signAction:(id)sender {
    CalendarHomeViewController *chvc = nil;
    if (!chvc) {
       chvc = [[CalendarHomeViewController alloc]init];
        chvc.calendartitle = @"飞机";
        [chvc setAirPlaneToDay:1 ToDateforString:nil];//飞机初始化方法
    }
//    chvc.calendarblock = ^(CalendarDayModel *model){
//        NSLog(@"\n---------------------------");
//        NSLog(@"1星期 %@",[model getWeek]);
//        NSLog(@"2字符串 %@",[model toString]);
//        NSLog(@"3节日  %@",model.holiday);
//        
//        if (model.holiday) {
//            [sender setTitle:[NSString stringWithFormat:@"%@ %@ %@",[model toString],[model getWeek],model.holiday] forState:UIControlStateNormal];
//        }else{
//            [sender setTitle:[NSString stringWithFormat:@"%@ %@",[model toString],[model getWeek]] forState:UIControlStateNormal];
//        }
//    };
    [self.navigationController pushViewController:chvc animated:YES];

}
@end
