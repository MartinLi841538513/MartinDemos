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

- (IBAction)uploadImgs:(id)sender {
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.greenwh.com"]];
    NSData *imageData1 = UIImageJPEGRepresentation([UIImage imageNamed:@"testImg1.png"], 0.5);
    NSData *imageData2 = UIImageJPEGRepresentation([UIImage imageNamed:@"testImg2.png"], 0.5);
    NSArray *imgs = [NSArray arrayWithObjects:imageData1,imageData2, nil];
    NSDictionary *parameters = @{@"mid": @"70",@"sid":@"6",@"title":@"标题1",@"content":@"内容1",@"degree":@"8",@"price":@"20",@"name":@"martin1",@"mobile":@"18613961267"};
    AFHTTPRequestOperation *op = [manager POST:@"/wap.php/Second/transrelease" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        //这里的name是服务器接收图片的字段。
        for (int i; i<imgs.count; i++) {
            [formData appendPartWithFileData:imageData1 name:[NSString stringWithFormat:@"picture[%d]",i] fileName:[NSString stringWithFormat:@"photo%d.jpg",i] mimeType:@"image/jpeg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@ ***** %@", operation.responseString, error);
    }];
    [op start];
    
    //http://www.greenwh.com/wap.php/Second/transfer?sid=6&page=1  这个链接是测试你是否上传成功
}

-(void)uploadImgs:(NSArray *)imgs withUrl:(NSString *)url andBaseName:(NSString *)baseName andParameters:(NSDictionary *)parameters{
    

}

@end
