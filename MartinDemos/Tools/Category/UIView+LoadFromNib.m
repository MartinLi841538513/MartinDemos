//
//  UIView+LoadFromNib.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-25.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "UIView+LoadFromNib.h"

@implementation UIView (LoadFromNib)
+(id)loadFromNib{
    NSString *xibName = NSStringFromClass([self class]);
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil];
    UIView *view = nib[0];
    return view;
}
@end
