//
//  StarView.h
//  DaXiaProject
//
//  Created by Gao Huang on 14-12-7.
//  Copyright (c) 2014年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : NSObject
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (strong, nonatomic) IBOutlet UIView *starView;
+(UIView *)loadFromNib:(NSString *)nibName andStar:(NSString *)star;
-(void)setStarWithStar:(NSString *)star inStarView:(StarView *)starView;
@end
