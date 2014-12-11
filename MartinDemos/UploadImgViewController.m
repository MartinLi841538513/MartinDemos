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
#import <AFNetworking.h>
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

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.greenwh.com"]];
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"testImg1.png"], 0.5);
    NSDictionary *parameters = @{@"mid": @"70"};
    AFHTTPRequestOperation *op = [manager POST:@"/wap.php/Member/head" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        //这里的name是服务器接收图片的字段。
        [formData appendPartWithFileData:imageData name:@"picture" fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
    }];
    [op start];
}



@end
