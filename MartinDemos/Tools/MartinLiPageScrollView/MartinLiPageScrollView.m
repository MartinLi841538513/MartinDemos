//
//  MartinLiPageScrollView.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-24.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MartinLiPageScrollView.h"
#import <UIImageView+WebCache.h>
#define ScreenFrame [UIScreen mainScreen].bounds.size
//#define ScreenFrame self.frame.size
@interface MartinLiPageScrollView()
{
    
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
    [self updateWithImgUrlsInSuperView:superView];
}

//建议使用这个
-(void)updatePageViewInFatherController:(UIViewController *)fatherController{
    fatherController.automaticallyAdjustsScrollViewInsets = NO;
    if (self.imageType==UIImageType) {
        [self updateWithImagesInFatherController:fatherController];
    }else if(self.imageType==UIImageUrlType){
        [self updateWithImgUrlsInSuperView:fatherController.view];
    }
}
-(void)updateWithImgUrlsInSuperView:(UIView *)superView{
    
    NSInteger imageCount = self.imgUrls.count;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
    self.delegate = self;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ScreenFrame.width, self.height);
    self.contentSize = CGSizeMake(self.frame.size.width*(imageCount+2), self.frame.size.height);
    [self setContentOffset:CGPointMake(self.frame.size.width, -self.contentInset.top) animated:NO];
    [self addImgViewsWithImgUrls:self.imgUrls withTitles:self.titles];
    [self addSubview:[self setUpPageControlWithImgCount:imageCount]];
    [self setAutoScrollTimer];
}

-(void)updateWithImagesInFatherController:(UIViewController *)fatherController{
    NSInteger imageCount = self.images.count;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
    self.delegate = self;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ScreenFrame.width, self.height);
    self.contentSize = CGSizeMake(self.frame.size.width*(imageCount+2), self.frame.size.height);
    [self setContentOffset:CGPointMake(self.frame.size.width, -self.contentInset.top) animated:NO];
    [self addImgViewsWithImages:self.images withTitles:self.titles];
    [self addSubview:[self setUpPageControlWithImgCount:imageCount]];
}

//设置自动滚动定时器
-(void)setAutoScrollTimer{
    if (self.isAutoScroll) {
        if(!self.timeInterval){
            self.timeInterval=2.0;
        }
        static dispatch_once_t once;
        dispatch_once(&once,^{
            [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
        });
    }
}

//通过imgUrls  addImageViews
-(void)addImgViewsWithImgUrls:(NSArray *)imgUrls withTitles:(NSArray *)titles{
    for (int i=0; i<imgUrls.count+2; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.height)];
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        NSString *imgUrl = nil;
        NSString *title = nil;
        
        if (i==imgUrls.count+1) {
            imgUrl = imgUrls[0];
            title = titles[0];
        }else if(i==0){
            imgUrl = imgUrls[imgUrls.count-1];
            title = titles[imgUrls.count-1];
        } else{
            imgUrl = imgUrls[i-1];
            title = titles[i-1];
        }
        if ([imgUrl  hasPrefix:@"http"]) {
            [imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
        }else{
            [imgView setImage:[UIImage imageNamed:imgUrl]];
        }
        if (self.pageViewType==MLPageScrollViewFullScreenMode) {
            [imgView setContentMode:UIViewContentModeScaleAspectFit];
            self.backgroundColor = [UIColor blackColor];
        }
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapAction:)];
        [imgView addGestureRecognizer:tap];
        
        [self addIndicatorViewAtIndex:i];
        [self addBlackViewInView:imgView withTitle:title andStatus:self.titleIsHidden];
        [self addSubview:imgView];
    }
}

//通过images  addImageViews
-(void)addImgViewsWithImages:(NSArray *)images withTitles:(NSArray *)titles{
    for (int i=0; i<images.count+2; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        UIImage *image = nil;
        NSString *title = nil;
        
        if (i==images.count+1) {
            image = images[0];
            title = titles[0];
        }else if(i==0){
            image = images[images.count-1];
            title = titles[images.count-1];
        } else{
            image = images[i-1];
            title = titles[i-1];
        }
        [imgView setImage:image];
        if (self.pageViewType==MLPageScrollViewFullScreenMode) {
            [imgView setContentMode:UIViewContentModeScaleAspectFit];
            self.backgroundColor = [UIColor blackColor];
        }
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTapAction:)];
        [imgView addGestureRecognizer:tap];
        
        [self addIndicatorViewAtIndex:i];
        [self addBlackViewInView:imgView withTitle:title andStatus:self.titleIsHidden];
        [self addSubview:imgView];
    }

}

-(void)addIndicatorViewAtIndex:(NSInteger)i{
    float width = 25;
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((self.frame.size.width-width)/2+i*self.frame.size.width, (self.frame.size.height-width)/2, width, width)];
    [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView startAnimating];
    [self addSubview:indicatorView];
}

-(void)addBlackViewInView:(UIView *)view withTitle:(NSString *)title andStatus:(BOOL)status{
    if (status==NO) {
        float blackViewHeight = 28;
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-blackViewHeight,view.frame.size.width, blackViewHeight)];
        blackView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(blackView.frame.origin.x, 0, blackView.frame.size.width, blackViewHeight)];
        titleLable.text = title;
        [titleLable setFont:[UIFont systemFontOfSize:12.0f]];
        titleLable.textColor = [UIColor whiteColor];
        [blackView addSubview:titleLable];
        [view addSubview:blackView];
    }
}

-(void)imgTapAction:(UITapGestureRecognizer *)tap{
    [self.martinLiPageScrollViewDelegate imgViewDidTouchActionAtIndex:self.pageControl.currentPage inArray:self.urls];
}

-(void)setDefaultLocationIndex:(NSInteger)defaultLocationIndex{
    [self scrollRectToVisible:CGRectMake(self.frame.size.width*(defaultLocationIndex+1), self.frame.origin.y, self.frame.size.width, self.frame.size.height) animated:YES];
}

-(void)scrollTimer{
    [self scrollRectToVisible:CGRectMake(self.frame.size.width*(self.pageControl.currentPage+2), self.frame.origin.y, self.frame.size.width, self.frame.size.height) animated:YES];
}

-(UIPageControl *)setUpPageControlWithImgCount:(NSInteger)imgCount{
    float value = 20;
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.frame.size.width-value*imgCount+self.contentOffset.x), self.height-20, value*imgCount, value)];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.numberOfPages = imgCount;
    pageControl.hidesForSinglePage = YES;
    self.pageControl = pageControl;
    return pageControl;
}


#pragma UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x/self.frame.size.width;
    NSArray *array = nil;
    if (self.imageType==UIImageType) {
        array = self.images;
    }else if(self.imageType==UIImageUrlType){
        array = self.imgUrls;
    }
    if (page==array.count+1) {
        page=0;
        [scrollView setContentOffset:CGPointMake((page+1)*scrollView.frame.size.width, -scrollView.contentInset.top) animated:NO];
    }else if(scrollView.contentOffset.x==0){
        page = array.count;
        [scrollView setContentOffset:CGPointMake((array.count)*scrollView.frame.size.width, -scrollView.contentInset.top) animated:NO];
    }
    self.pageControl.currentPage = page-1;
    self.pageControl.frame = CGRectMake((self.frame.size.width-self.pageControl.frame.size.width)+scrollView.contentOffset.x, self.pageControl.frame.origin.y, self.pageControl.frame.size.width, self.pageControl.frame.size.height);
}

@end
