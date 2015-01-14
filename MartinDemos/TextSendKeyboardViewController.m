//
//  TextSendKeyboardViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 15-1-14.
//  Copyright (c) 2015年 Martin. All rights reserved.
//

#import "TextSendKeyboardViewController.h"
#import "DAKeyboardControl.h"

@interface TextSendKeyboardViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(nonatomic,strong)UIToolbar *toolBar;
@property(nonatomic,strong)UITextField *textField;

@end

@implementation TextSendKeyboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TextSendKeyboardViewController";
    [self setupTextSendKeyboard];
}

-(void)setupTextSendKeyboard{
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f,
                                                               self.view.bounds.size.height - 40.0f,
                                                               self.view.bounds.size.width,
                                                               40.0f)];
    self.toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    self.toolBar.hidden=YES;
    [self.view addSubview:self.toolBar];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f,
                                                                   6.0f,
                                                                   self.toolBar.bounds.size.width - 20.0f - 68.0f,
                                                                   30.0f)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.toolBar addSubview:self.textField];
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sendButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    sendButton.frame = CGRectMake(self.toolBar.bounds.size.width - 68.0f,
                                  6.0f,
                                  58.0f,
                                  29.0f);
    [sendButton addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBar addSubview:sendButton];
    
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    self.view.keyboardTriggerOffset = self.toolBar.bounds.size.height;
    __weak typeof(self) weakSelf = self;
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView) {
        /*
         Try not to call "self" inside this block (retain cycle).
         But if you do, make sure to remove DAKeyboardControl
         when you are done with the view controller by calling:
         [self.view removeKeyboardControl];
         */
        CGRect toolBarFrame = weakSelf.toolBar.frame;
        toolBarFrame.origin.y = keyboardFrameInView.origin.y - toolBarFrame.size.height;
        weakSelf.toolBar.frame = toolBarFrame;
    }];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.view removeKeyboardControl];
}

-(void)sendAction:(UIButton *)sender{
    NSLog(@"%@",self.textField.text);
    [self hideKeyboard];
    self.label.text = self.textField.text;
    self.textField.text = @"";
}

-(void)showKeyboard{
    [self.textField becomeFirstResponder];
    self.toolBar.hidden = NO;
}

-(void)hideKeyboard{
    [self.textField resignFirstResponder];
    self.toolBar.hidden = YES;
}

- (IBAction)makeComment:(id)sender {
    [self showKeyboard];
}

@end
