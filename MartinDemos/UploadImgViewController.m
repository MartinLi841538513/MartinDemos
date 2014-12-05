//
//  UploadImgViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-4.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "UploadImgViewController.h"
#import "JSONModelLib.h"
#import <SVProgressHUD/SVProgressHUD.h>
#define URL @"http://www.greenwh.com/wap.php/Member/head"
@interface UploadImgViewController ()

@end

@implementation UploadImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)uploadImgAction:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"尚在开发中"];
//    NSString *mid = @"70";
//    
//    
//    UIImage *image = [UIImage imageNamed:@"testImg1.png"];
//    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(image)];
//    NSString *dataEncode = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    
//    
//    
//    
//    self.imgView.image = [UIImage imageWithData:back];
//    
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:mid,@"mid",dataEncode,@"picture", nil];
//    NSLog(@"param:%@",params);
//    [JSONHTTPClient postJSONFromURLWithString:URL params:params completion:^(NSDictionary *model,JSONModelError *error){
//        NSInteger status = (NSInteger)model[@"status"];
//        NSString *picture = model[@"info"];
//        NSLog(@"%@",model);
//        NSLog(@"error:%@",error);
//    }];
}

@end
