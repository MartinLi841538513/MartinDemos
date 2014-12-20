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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MLMutiImagesViewController" bundle:nil];
    mutiImagesContoller = [storyboard instantiateViewControllerWithIdentifier:@"MLMutiImagesChoosenViewController"];
    mutiImagesContoller.fatherController = self;
    mutiImagesContoller.superView = self.collectionview;
    mutiImagesContoller.collectionviewHeight = self.collectionviewHeight.constant;
    [self addChildViewController:mutiImagesContoller];
    [self.collectionview addSubview: mutiImagesContoller.collectionView];
}

- (IBAction)showCountAction:(id)sender {
    self.showCountLabel.text = [NSString stringWithFormat:@"%d",mutiImagesContoller.chooseImages.count];
}
@end
