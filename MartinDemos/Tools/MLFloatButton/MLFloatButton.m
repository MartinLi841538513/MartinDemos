//
//  MLFloatButton.m
//  MartinDemos
//
//  Created by Gao Huang on 14-11-25.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "MLFloatButton.h"

@interface MLFloatButton()
{
    BOOL isMoving;
}
@end
@implementation MLFloatButton

+(MLFloatButton *)loadFromNibWithFrame:(CGRect)frame addTarget:(id)target InSuperView:(UIView *)superView{
    static MLFloatButton *button = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        NSString *xibName = NSStringFromClass([self class]);
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil];
        button = nib[0];
        [button addTarget:button action:@selector(dragDidMoving:withEvent:) forControlEvents:UIControlEventTouchDragInside];
        [button addTarget:button action:@selector(didTouched:withEvent:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = frame;
    });
    button.floatButtonDelegate = target;
    [superView addSubview:button];
    button.fatherView = superView;

    return button;
}

-(void)showInFatherView:(UIView *)fatherView{
    [fatherView addSubview:self];
    self.fatherView = fatherView;
}

- (void)dragDidMoving:(MLFloatButton *)button withEvent:(UIEvent *)ev
{
    isMoving = YES;
    button.center = [[[ev allTouches] anyObject] locationInView:button.fatherView];
}

- (void)didTouched:(MLFloatButton *)button withEvent:(UIEvent *)ev{
    
    if (!isMoving) {
        [button.floatButtonDelegate buttonTouchAction];
    }else{
        isMoving = NO;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
