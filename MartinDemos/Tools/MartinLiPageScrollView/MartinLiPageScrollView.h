//
//  MartinLiPageScrollView.h
//  MartinDemos
//
//  Created by Gao Huang on 14-11-24.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MartinLiPageScrollViewDelegate <NSObject>

-(void)imgViewDidTouchActionAtIndex:(NSInteger)index;

@end

@interface MartinLiPageScrollView : UIScrollView<UIScrollViewDelegate>
@property(nonatomic,strong)NSArray *imgs;
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,assign)float height;
@property(nonatomic,assign)float timeInterval;
@property(nonatomic,weak)id<MartinLiPageScrollViewDelegate> martinLiPageScrollViewDelegate;

@property(nonatomic)BOOL titleIsHidden;  //默认BOOL为NO

-(void)updatePageViewInSuperView:(UIView *)superView;
-(void)updatePageViewWithImgs:(NSArray *)imgs andTitles:(NSArray *)titles inSuperView:(UIView *)superView;
@end
