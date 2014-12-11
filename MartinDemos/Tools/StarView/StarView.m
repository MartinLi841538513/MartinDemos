//
//  StarView.m
//  DaXiaProject
//
//  Created by Gao Huang on 14-12-7.
//  Copyright (c) 2014年 None. All rights reserved.
//

#import "StarView.h"

#define emptyStar @"icon_ratingbar_full_empty.png"
#define fullStar @"icon_ratingbar_full_filled.png"

@implementation StarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UIView *)loadFromNib:(NSString *)nibName andStar:(NSString *)star{
    StarView *owner = [self new];
    [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:nil];
    [owner setStarWithStar:star inStarView:owner];
    CGRect frame = CGRectMake(0, 0, 142, 22);
    owner.starView.frame = frame;
    return owner.starView;
}

-(void)setStarWithStar:(NSString *)star inStarView:(StarView *)starView{
    int starInt = (int)[star floatValue];
    
    NSArray *stars = [NSArray arrayWithObjects:starView.star1,starView.star2,starView.star3,starView.star4,starView.star5, nil];
    
    for (int i=0; i<starInt; i++) {
        UIImageView *starImg = stars[i];
        [starImg setImage:[UIImage imageNamed:fullStar]];
    }
    
    for (int i=starInt; i<stars.count; i++) {
        UIImageView *starImg = stars[i];
        [starImg setImage:[UIImage imageNamed:emptyStar]];
    }
}


@end
