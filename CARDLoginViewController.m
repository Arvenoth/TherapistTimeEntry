//
//  CARDLoginViewController.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDLoginViewController.h"
#import "CARDAuthenticationItem.h"
#import "CARDDayEventChannel.h"
#import "CARDTodayViewController.h"
#import "CARDFeedStore.h"

@interface CARDLoginViewController ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, strong) CARDAuthenticationItem *authenticationResponse;
@property (nonatomic, strong) CARDDayEventChannel *dayEventReponse;

@end

@implementation CARDLoginViewController

@synthesize username, password, signInButton, authenticationResponse, dayEventReponse;

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
                [[CARDFeedStore sharedStore] setCurrentToken:[[self authenticationResponse] token]];
                
                UIStoryboard *storyboard = [self storyboard];
                
                CARDTodayViewController *todayViewController = [storyboard instantiateViewControllerWithIdentifier:@"CARDNavigationController"];
                
                [self presentViewController:todayViewController animated:YES completion:nil];
                
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
            
            // Log the message
            NSLog(@"Fetch failed: %@", errorMessage);
            
            // Create and show an alert view
            UIAlertView *failureAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:errorMessage
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil, nil];
            
            [failureAlert show];
        }
        
        [[self signInButton] setEnabled:YES];
    };
    
    [[self signInButton] setEnabled:NO];
    
    // Initiate the request
    [[CARDFeedStore sharedStore] fetchAuthenticationCredentials:[self username]
                                                   withPassword:[self password]
                                                  andCompletion:completionBlock];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"transitionToTodayPage"])
    {        
        CARDTodayViewController *todayViewController = [[CARDTodayViewController alloc] init];
        
        void (^completionBlock)(CARDDayEventChannel *obj, NSError *err) = ^(CARDDayEventChannel *obj, NSError *err)
        {
            if (!err)
            {                
                dayEventReponse = obj;
                
                NSLog(@"This should not be the first call!!\ndayEventResponse: \nmessage: %@\nstatus: %@\ntoken:%@\n", [[dayEventReponse status] message], [[dayEventReponse status] status], [[dayEventReponse status] token]);
            }
            else
            {
                NSLog(@"Error: %@", [err localizedDescription]);
            }
        };
        
        [[CARDFeedStore sharedStore] fetchCalendarDayEvents:[[CARDFeedStore sharedStore] currentToken]
                                                     onDate:@"11/30/2012"
                                              andCompletion:completionBlock];
        
        [todayViewController setDayEventResponse:dayEventReponse];
    }
}

@end
