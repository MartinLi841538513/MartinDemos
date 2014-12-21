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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MLMutiImagesViewController" bundle:nil];//（必选）
    mutiImagesContoller = [storyboard instantiateViewControllerWithIdentifier:@"MLMutiImagesChoosenViewController"];//（必选）
    mutiImagesContoller.fatherController = self;//（必选）
    mutiImagesContoller.imageMode = getImagesMode;//（必选）
    mutiImagesContoller.superView = self.collectionview;//（必选）
    mutiImagesContoller.collectionviewHeight = self.collectionviewHeight.constant;//（必选）
    [self addChildViewController:mutiImagesContoller];//（必选）
    [self.collectionview addSubview: mutiImagesContoller.collectionView];//（必选）
}

- (IBAction)showCountAction:(id)sender {
    self.showCountLabel.text = [NSString stringWithFormat:@"%d",mutiImagesContoller.chooseImages.count];
}
@end
