//
//  LocateViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-5.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "LocateViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface LocateViewController ()<CLLocationManagerDelegate>
{
}
@property (nonatomic, strong) CLLocationManager  *locationmanager;

@end

@implementation LocateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"定位";
    self.locationmanager = [[CLLocationManager alloc] init];
    self.locationmanager.delegate = self;
    self.locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationmanager.distanceFilter = 1000.0f;
    [self.locationmanager requestAlwaysAuthorization];
    [self.locationmanager startUpdatingLocation];

}

- (IBAction)locateAction:(id)sender {
 
}

#pragma CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    NSLog(@"111%@",locations[0]);
    [manager stopUpdatingLocation];

}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"33%@",error);
}

@end
