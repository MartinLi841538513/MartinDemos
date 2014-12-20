//
//  ImagesViewerViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-19.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "ImagesViewerViewController.h"


@interface ImagesViewerViewController ()
{
    NSMutableArray *_imageViews;
    NSArray *images;
}
@end

@implementation ImagesViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//    _imageViews = [[NSMutableArray alloc] initWithObjects:self.imgView1,self.imgView2,self.imgView3, nil];
//    images = [NSArray arrayWithObjects:@"testImg1.png",@"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg", @"http://gtms04.alicdn.com/tps/i4/TB10SpoGFXXXXXbapXXvKyzTVXX-520-280.jpg", nil];
//    for (UIImageView *imageView in _imageViews) {
//        NSInteger index = [_imageViews indexOfObject:imageView];
//        UITapGestureRecognizer *gesture =
//        [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                action:@selector(tapHandle:)];
//        imageView.contentMode = UIViewContentModeScaleAspectFill;
//        imageView.clipsToBounds = YES;
//        [imageView addGestureRecognizer:gesture];
//        
//        NSString *image = images[index];
//        if ([image hasPrefix:@"http"]) {
//            [imageView setImageWithURL:[NSURL URLWithString:image]];
//        }else{
//            [imageView setImage:[UIImage imageNamed:image]];
//        }
//    }

}


@end
