//
//  MLMutiImagesChooseViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-20.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MLMutiImagesChooseViewController.h"
#import "MLMutiImagesChoosenViewController.h"
@interface MLMutiImagesChooseViewController ()
{
    MLMutiImagesChoosenViewController *mutiImagesContoller;
}
@end

@implementation MLMutiImagesChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //模式一 选择图片
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MLMutiImagesViewController" bundle:nil];//（必选）
    mutiImagesContoller = [storyboard instantiateViewControllerWithIdentifier:@"MLMutiImagesChoosenViewController"];//（必选）
    mutiImagesContoller.fatherController = self;//（必选）
    mutiImagesContoller.imageMode = getImagesMode;//（必选）
    mutiImagesContoller.superView = self.collectionview;//（必选）
    mutiImagesContoller.collectionviewHeight = self.collectionviewHeight.constant;//（必选）
    [self addChildViewController:mutiImagesContoller];//（必选）
    [self.collectionview addSubview: mutiImagesContoller.collectionView];//（必选）
    
    
//    //模式二  浏览图片
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MLMutiImagesViewController" bundle:nil];//（必选）
//    mutiImagesContoller = [storyboard instantiateViewControllerWithIdentifier:@"MLMutiImagesChoosenViewController"];//（必选）
//    mutiImagesContoller.fatherController = self;//（必选）
//    mutiImagesContoller.imageMode = browseImagesMode;//（必选）
//    mutiImagesContoller.imageUrls = [NSArray arrayWithObjects:@"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg",@"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg",@"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg", @"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg",nil];//（必填）//暂时只支持网络图片
////    self.pageView.titles = [NSArray arrayWithObjects:@"1",@"2",@"3", @"4",nil];
//    mutiImagesContoller.superView = self.collectionview;//（必选）
//    mutiImagesContoller.collectionviewHeight = self.collectionviewHeight.constant;//（必选）
//    [self addChildViewController:mutiImagesContoller];//（必选）
//    [self.collectionview addSubview: mutiImagesContoller.collectionView];//（必选）
}

- (IBAction)showCountAction:(id)sender {
    self.showCountLabel.text = [NSString stringWithFormat:@"%d",mutiImagesContoller.chooseImages.count];
}
@end
