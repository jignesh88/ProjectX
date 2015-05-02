//
//  CoachRegisterViewController.m
//  ProjectX
//
//  Created by Jignesh Patel on 2/05/2015.
//  Copyright (c) 2015 Jignesh Patel. All rights reserved.
//

#import "CoachRegisterViewController.h"

@implementation CoachRegisterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtEmail.delegate = self;
    self.txtPwd.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.txtEmail resignFirstResponder];
    [self.txtPwd resignFirstResponder];
    return NO;
}

@end
