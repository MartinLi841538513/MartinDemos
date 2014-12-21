//
//  MLMutiImagesChoosenViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-20.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MLMutiImagesChoosenViewController.h"
#import "MLImagesBrowserViewController.h"
#import <UIImageView+AFNetworking.h>
@interface MLMutiImagesChoosenViewController ()

@end

@implementation MLMutiImagesChoosenViewController

static NSString * const reuseIdentifier = @"ChoosenImageCell2";

-(void)loadView{
    [super loadView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.fatherController.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionview];
}

-(void)setupCollectionview{
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    float space = 10;
    flowlayout.itemSize = CGSizeMake(self.collectionviewHeight-space*2, self.collectionviewHeight-space*2);
    flowlayout.sectionInset = UIEdgeInsetsMake(space, space, space, space);
//    flowlayout.minimumInteritemSpacing = 10.0f;
//    flowlayout.minimumLineSpacing = 10.0f;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.collectionViewLayout = flowlayout;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.frame = self.superView.frame;
    
    self.chooseImages = [NSMutableArray arrayWithObject:[UIImage imageNamed:@"bg_uploadimage_addimage_takephoto.png"]];
}
#pragma UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self.fatherController presentViewController:picker animated:YES completion:nil];
    }else if(buttonIndex==1){
        ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] init];
        elcPicker.maximumImagesCount = 100; //Set the maximum number of images to select to 100
        elcPicker.imagePickerDelegate = self;
        [self.fatherController presentViewController:elcPicker animated:YES completion:nil];
    }
}

#pragma mark ELCImagePickerControllerDelegate Methods
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        for (NSDictionary *dict in info) {
            if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
                if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                    UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                    [self insertImage:image toChooseImages:self.chooseImages withUpdateCollectionView:self.collectionView];
                } else {
                    NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
                }
            }else {
                NSLog(@"Uknown asset type");
            }
        }
    }];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = nil;
    if (picker.allowsEditing) {
        image = info[UIImagePickerControllerEditedImage];
    }else{
        image = info[UIImagePickerControllerOriginalImage];
    }
    [picker dismissViewControllerAnimated:YES completion:^(void){
        [self insertImage:image toChooseImages:self.chooseImages withUpdateCollectionView:self.collectionView];
    }];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.imageMode==getImagesMode) {
        return self.chooseImages.count;
    }else if(self.imageMode == browseImagesMode){
        return self.imageUrls.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChoosenImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (self.imageMode==getImagesMode) {
        cell.imgView.image = self.chooseImages[indexPath.row];
    }else if(self.imageMode == browseImagesMode){
        [cell.imgView setImageWithURL:[NSURL URLWithString:self.imageUrls[indexPath.row]]];
    }
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.imageMode==getImagesMode) {
        if (indexPath.row==self.chooseImages.count-1) {
            UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"选择图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
            [action showInView:self.fatherController.view.window];
        }else{
            // Do any additional setup after loading the view from its nib.
            MLImagesBrowserViewController *target = [[MLImagesBrowserViewController alloc] initWithNibName:@"MLImagesBrowserViewController" bundle:nil];
            target.imageType = UIImageType;
            target.images = [self.chooseImages subarrayWithRange:NSMakeRange(0, self.chooseImages.count-1)];//（必填）
            //        target.titles = [NSArray arrayWithObjects:@"1",@"2",@"3", @"4",nil];//设置图片对应的title（可选）
            target.defaultLocationIndex = indexPath.row;//这一步必须放在最后。（可选）
            [self.navigationController pushViewController:target animated:YES];
            
        }
    }else if(self.imageMode == browseImagesMode){
        MLImagesBrowserViewController *target = [[MLImagesBrowserViewController alloc] initWithNibName:@"MLImagesBrowserViewController" bundle:nil];
        target.imageType = UIImageUrlType;
        target.imgUrls = self.imageUrls;//（必填）
        //        target.titles = [NSArray arrayWithObjects:@"1",@"2",@"3", @"4",nil];//设置图片对应的title（可选）
        target.defaultLocationIndex = indexPath.row;//这一步必须放在最后。（可选）
        [self.navigationController pushViewController:target animated:YES];
    }
    
}

-(void)insertImage:(UIImage *)image toChooseImages:(NSMutableArray *)images withUpdateCollectionView:(UICollectionView *)collectionView{
    [images insertObject:image atIndex:self.chooseImages.count-1];
    NSArray *array = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:images.count-2 inSection:0]];
    [collectionView insertItemsAtIndexPaths:array];
}
@end
