//
//  CARDLoginViewController.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CARDLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UISwitch *rememberLastUser;

@property (weak, nonatomic) IBOutlet UIButton *signInButton;

- (void)fetchAuthenticationResponse;

@end
