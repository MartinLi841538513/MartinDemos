//
//  MLMutiImagesChoosenViewController.h
//  MartinDemos
//
//  Created by Gao Huang on 14-12-20.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoosenImageCell.h"
#import <ELCImagePickerController.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/ALAsset.h>

enum{
    getImagesMode,
    browseImagesMode
};

@interface MLMutiImagesChoosenViewController : UICollectionViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,ELCImagePickerControllerDelegate>
@property(nonatomic,strong)NSMutableArray *chooseImages;
@property(nonatomic,strong)UIViewController *fatherController;
@property(nonatomic,strong)UIView *superView;
@property(nonatomic,assign)float collectionviewHeight;
@property(nonatomic)NSInteger imageMode;//必选
@property(nonatomic,strong)NSArray *imageUrls;
@end

