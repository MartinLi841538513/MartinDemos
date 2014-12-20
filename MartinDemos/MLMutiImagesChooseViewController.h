//
//  MLMutiImagesChooseViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-20.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MLMutiImagesChooseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *collectionview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionviewHeight;
@property (weak, nonatomic) IBOutlet UILabel *showCountLabel;
- (IBAction)showCountAction:(id)sender;

@end
