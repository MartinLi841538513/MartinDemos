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

//new AsyncTask<String, Void, String>() {
//    @Override
//    protected String doInBackground(String... params) {
//        try {
//            // 定义数据分隔线
//            String BOUNDARY = "------------------------7dc2fd5c0894";
//            // 定义最后数据分隔线
//            byte[] end_data = ("\r\n--" + BOUNDARY + "--\r\n")
//            .getBytes();
//            // LogUtil.d("TAG", "params[0]"+params[0]);
//            URL url = new URL(params[0]);
//            HttpURLConnection conn = (HttpURLConnection) url
//            .openConnection();
//            conn.setDoOutput(true);
//            conn.setDoInput(true);
//            conn.setUseCaches(false);
//            //conn.setConnectTimeout(1000*12);
//            conn.setRequestMethod("POST");
//            conn.setRequestProperty("connection", "Keep-Alive");
//            conn.setRequestProperty("user-agent",
//                                    "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)");
//            conn.setRequestProperty("Charsert", "UTF-8");
//            conn.setRequestProperty("Content-Type",
//                                    "multipart/form-data; boundary=" + BOUNDARY);
//            StringBuffer myparams = null;
//            OutputStream out = null;
//            out = new DataOutputStream(conn.getOutputStream());
//            myparams = new StringBuffer();
//            // 不同名称的的参数
//            if (valus != null) {
//                // LogUtil.d("TAG", "有bu相同参数的提交");
//                Iterator iter = valus.entrySet().iterator();
//                while (iter.hasNext()) {
//                    Map.Entry entry = (Map.Entry) iter.next();
//                    String val = entry.getValue().toString();
//                    String key = entry.getKey().toString();
//                    LogUtil.d("TAG", "bu相同参数"+val+"==="+key);
//                    myparams.append("--" + BOUNDARY + "\r\n");
//                    myparams.append("Content-Disposition: form-data; name=\""
//                                    + key + "\"\r\n\r\n");
//                    myparams.append(val);
//                    myparams.append("\r\n");
//                }
//            }
//            out.write(myparams.toString().getBytes());
//            
//            // 上传上传名称相同的图片
//            if (imageUrl != null) {
//                Iterator iter3 = imageUrl.entrySet().iterator();
//                while (iter3.hasNext()) {
//                    Map.Entry entry = (Map.Entry) iter3.next();
//                    Object val = entry.getValue();
//                    String key = entry.getKey().toString();
//                    LogUtil.d("TAG", "图片key。。"+key);
//                    File file = new File(val.toString());
//                    LogUtil.d("TAG", "图片file.getName()。。"+file.getName());
//                    StringBuilder sb = new StringBuilder();
//                    sb.append("--");
//                    sb.append(BOUNDARY);
//                    sb.append("\r\n");
//                    sb.append("Content-Disposition: form-data;name=\""
//                              + sameName + "\";filename=\"" + file.getName()
//                              + "\"\r\n");
//                    // 这里不能漏掉，根据文件类型来来做处理，由于上传的是图片，所以这里可以写成image/pjpeg
//                    sb.append("Content-Type:image/pjpeg\r\n\r\n");
//                    out.write(sb.toString().getBytes());
//                    DataInputStream in = new DataInputStream(
//                                                             new FileInputStream(file));
//                    int bytes = 0;
//                    byte[] bufferOut = new byte[1024];
//                    while ((bytes = in.read(bufferOut)) != -1) {
//                        out.write(bufferOut, 0, bytes);
//                    }
//                    out.write("\r\n".getBytes());
//                    in.close();
//                }
//            }
//            LogUtil.d("TAG", "上传完成数据");
//            out.write(end_data);
//            out.flush();
//            out.close();
//            // 定义BufferedReader输入流来读取URL的响应
//            BufferedReader reader = null;
//            reader = new BufferedReader(new InputStreamReader(
//                                                              conn.getInputStream()));
//            LogUtil.d("TAG", "返回数据" + reader);
//            String line = null;
//            while ((line = reader.readLine()) != null) {
//                LogUtil.d("TAG", "返回数据。" + line);
//                Message msg = Message.obtain();
//                msg.what = 200;
//                msg.obj = line;
//                handler.sendMessage(msg);
//                //						MyProgressDialog.dismiss();
//            }
//            
//        } catch (Exception e) {
//            LogUtil.d("TAG", "发送POST请求出现异常！" + e);
//            Message msg = Message.obtain();
//            msg.what = 0;
//            // msg.obj="无网络连接";
//            msg.obj = "异常" + e;
//            handler.sendMessage(msg);
//            MyProgressDialog.dismiss();
//        }
//        
//        return null;
//    }
//    
//    @Override
//    protected void onPostExecute(String result) {
//								LogUtil.d("TAG", "success");
//    }
//}.execute(myUrl);
@end
