//
//  CARDTodayViewController.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 12/3/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDTodayViewController.h"
#import "CARDFeedStore.h"
#import "CARDAuthenticationItem.h"
#import "CARDDayEventChannel.h"

@interface CARDTodayViewController ()

@property (nonatomic, strong) CARDDayEventChannel *dayEventResponse;
@property (nonatomic, strong) CARDAuthenticationItem *authResponse;

@end

@implementation CARDTodayViewController

@synthesize dayEventResponse, authResponse;

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"Here we are");
    [super viewDidAppear:animated];
    
    if (self)
    {
        void (^completionBlock)(CARDDayEventChannel *obj, NSError *err) = ^(CARDDayEventChannel *obj, NSError *err)
        {
            if (!err)
            {
                dayEventResponse = obj;
                authResponse = [[self dayEventResponse] status];
                
                NSLog(@"%@", [[self authResponse] message]);
            }
            else
            {
                NSLog(@"Error: %@", [err localizedDescription]);
            }
        };
        
        [[CARDFeedStore sharedStore] fetchCalendarDayEvents:[[CARDFeedStore sharedStore] currentToken]
                                                     onDate:@"11/30/2012"
                                              andCompletion:completionBlock];
    }
}

- (IBAction)profilePressed
{
    NSLog(@"Profile button pressed");
}

- (IBAction)detailsPressed
{
    NSLog(@"Details button pressed");
}

@end
