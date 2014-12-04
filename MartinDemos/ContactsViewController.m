//
//  ContactsViewController.m
//  MartinDemos
//
//  Created by Gao Huang on 14-12-4.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "ContactsViewController.h"
#import <AddressBookUI/AddressBookUI.h>
@interface ContactsViewController ()<ABPeoplePickerNavigationControllerDelegate>
@end
@implementation ContactsViewController

- (IBAction)openContactsAction:(id)sender {
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma ABPeoplePickerNavigationControllerDelegate
// Called after a property has been selected by the user.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    ABMultiValueRef multiValue = ABRecordCopyValue(person,property);
    CFIndex index = ABMultiValueGetIndexForIdentifier(multiValue, identifier);
    NSString *phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(multiValue, index);
    self.phone.text = phone;
}

- (IBAction)callAction:(id)sender {
    NSString *tel = [NSString stringWithFormat:@"tel:%@",self.phone.text];
    UIWebView *callWebview = [[UIWebView alloc] init];
    NSURL *telURL = [NSURL URLWithString:tel];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.view addSubview:callWebview];
}
@end
