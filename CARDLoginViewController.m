//
//  CARDLoginViewController.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDLoginViewController.h"

@interface CARDLoginViewController ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@end

@implementation CARDLoginViewController

@synthesize username, password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)signinPressed
{
    username = [[self usernameTextField] text];
    password = [[self passwordTextField] text];
    
    [[self usernameTextField] setText:@""];
    [[self passwordTextField] setText:@""];
    
    NSLog(@"Signing in with username: %@ and password: %@", username, password);
}

- (IBAction)forgotPasswordPressed
{
    NSLog(@"Password forgotten...");
}
@end
