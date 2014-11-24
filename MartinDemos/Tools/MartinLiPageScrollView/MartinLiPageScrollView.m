//
//  MartinLiPageScrollView.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-24.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MartinLiPageScrollView.h"

#define ScreenFrame [UIScreen mainScreen].bounds.size

@interface MartinLiPageScrollView()
{
    int timeCount;
}
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation MartinLiPageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)updatePageViewInSuperView:(UIView *)superView{
    [self updatePageViewWithImgs:self.imgs inSuperView:superView];
}
-(void)updatePageViewWithImgs:(NSArray *)imgs inSuperView:(UIView *)superView{
   
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
    self.delegate = self;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ScreenFrame.width, self.height);
    self.contentSize = CGSizeMake(self.frame.size.width*(imgs.count+1), self.frame.size.height);
    
    [self addImgViews:imgs];
    
    [superView addSubview:[self setUpPageControlWithImgs:imgs]];
    timeCount = 0;
    [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
}

-(void)addImgViews:(NSArray *)imgs{
    for (int i=0; i<imgs.count+1; i++) {
        UIImage *image = nil;
        if (i==imgs.count) {
            image = [UIImage imageNamed:imgs[0]];
        }else{
            image = [UIImage imageNamed:imgs[i]];
        }
        UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
        [imgView setFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapAction:)];
        [imgView addGestureRecognizer:tap];
        [self addSubview:imgView];
    }
}

-(void)imgTapAction:(UITapGestureRecognizer *)tap{
    [self.martinLiPageScrollViewDelegate imgViewDidTouchActionAtIndex:self.pageControl.currentPage];
}

-(void)scrollTimer{
    if (timeCount==self.imgs.count) {
        timeCount=0;
        [self setContentOffset:CGPointMake(0, -self.contentInset.top) animated:NO];
    }else{
        [self scrollRectToVisible:CGRectMake(self.frame.size.width*timeCount, self.frame.origin.y, self.frame.size.width, self.frame.size.height) animated:YES];
    }
    self.pageControl.currentPage = timeCount;
    timeCount++;

}

-(UIPageControl *)setUpPageControlWithImgs:(NSArray *)imgs{
    float value = 20;
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.frame.size.width-value*imgs.count)/2, self.height+64, value*imgs.count, value)];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.numberOfPages = imgs.count;
    pageControl.hidesForSinglePage = YES;
    self.pageControl = pageControl;
    return pageControl;
}


#pragma UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/self.frame.size.width;
    if (page==self.imgs.count) {
        page=0;
        [scrollView setContentOffset:CGPointMake(0, -scrollView.contentInset.top) animated:NO];
    }
    timeCount = page;
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/self.frame.size.width;
    if (page==self.imgs.count) {
        page=0;
        [scrollView setContentOffset:CGPointMake(0, -scrollView.contentInset.top) animated:NO];
    }
    timeCount = page;
    self.pageControl.currentPage = page;
}
@end
