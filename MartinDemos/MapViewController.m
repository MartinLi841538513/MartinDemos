//
//  MapViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-5.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MapViewController.h"
#define Latitude 28.1658601239483
#define Longitude 112.947241748764

@interface MapViewController ()<MAMapViewDelegate>

@end

@implementation MapViewController

-(void)loadView{
    [super loadView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.mapView.delegate = self;
    self.mapView.visibleMapRect = MAMapRectMake(220880104.0, 101476980.0,  9249.0, 13265.0);
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(Latitude, Longitude);
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    MAPointAnnotation *point = [[MAPointAnnotation alloc] init];
    point.title = @"长沙XX4S美容店";
    point.subtitle = @"长沙岳麓区大学城湖南大学天马学生公寓";
    point.coordinate = CLLocationCoordinate2DMake(Latitude, Longitude);
    [annotations addObject:point];
    
    [self.mapView addAnnotations:annotations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma MAMapViewDelegate
-(MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
            annotationView.canShowCallout= YES;      //设置气泡可以弹出，默认为NO
            annotationView.animatesDrop = YES;       //设置标注动画显示，默认为NO
            annotationView.draggable = YES;
            
            UIColor *color = [UIColor blueColor];
            UIFont *font = [UIFont systemFontOfSize:12.0];
            //设置标注可以拖动，默认为NO
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
            [rightButton addTarget:self action:@selector(detailAction:) forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView=rightButton;  //设置气泡右侧按钮
            
            
            UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
            [leftButton setTitle:@"call" forState:UIControlStateNormal];
            [leftButton addTarget:self action:@selector(callAction:) forControlEvents:UIControlEventTouchUpInside];
            [leftButton.titleLabel setFont:font];
            [leftButton setTitleColor:color forState:UIControlStateNormal];
            annotationView.leftCalloutAccessoryView = leftButton;
            
        }
        return annotationView;
    }
    return nil;
}

-(void)callAction:(id)sender{
    NSLog(@"call");
}

-(void)detailAction:(id)sender{
    NSLog(@"detail");
}

@end
