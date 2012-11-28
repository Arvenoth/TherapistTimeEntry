//
//  CARDLoginViewController.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDLoginViewController.h"
#import "CARDAuthenticationItem.h"
#import "CARDFeedStore.h"

@interface CARDLoginViewController ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) CARDAuthenticationItem *authenticationResponse;

@end

@implementation CARDLoginViewController

@synthesize username, password, authenticationResponse;

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
    
    [self fetchAuthenticationResponse];
}

- (IBAction)forgotPasswordPressed
{
    NSLog(@"Password forgotten...");
}

- (void)fetchAuthenticationResponse
{
    //
    // TODO :: Insert an activity indicator
    //
    
    void (^completionBlock)(CARDAuthenticationItem *obj, NSError *err) = ^(CARDAuthenticationItem *obj, NSError *err)
    {
        if (!err)
        {
            // If the response was successfully fetched, grab the
            // authenticationResponse
            authenticationResponse = obj;
            
            // Wrap the status number to challenge against
            // to be able to make the comparison
            NSNumber *numZero = [NSNumber numberWithInt:0];

            NSLog(@"message = %@\nstatus = %@\n token = %@", [[self authenticationResponse] message], [[self authenticationResponse] status], [[self authenticationResponse] token]);
            
            if ([[self authenticationResponse] status] == numZero)
            {
                UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                       message:[[self authenticationResponse] token]
                                                                      delegate:nil
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles:nil, nil];
                
                [successAlert show];
            }
            else
            {
                UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                                       message:@"Incorrect username or password"
                                                                      delegate:nil
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles:nil, nil];
                                             
                [loginFailure show];
            }
        }
        else
        {
            // Things have obviously gone wrong...
            NSString *errorMessage = [NSString stringWithFormat:@"Fetch Failed: %@", [err localizedDescription]];
            
            // Create and show an alert view
            UIAlertView *failureAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:errorMessage
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil, nil];
            
            [failureAlert show];
        }
    };
    
    // Initiate the request
    [[CARDFeedStore sharedStore] fetchAuthenticationCredentials:[self username]
                                                   withPassword:[self password]
                                                  andCompletion:completionBlock];
}

@end
