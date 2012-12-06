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

@end

@implementation CARDTodayViewController

// Synthesize the public data variables
@synthesize dayEventResponse, authResponse;

// Synthesize the public variables to the display outlets
@synthesize usernameLabel, usernameCityLabel, patientNameLabel, patientAddressLabel,
            patientCityLabel, patientEndTimeLabel, patientStartTimeLabel, patientStateLabel,
            patientZipLabel;

- (IBAction)profilePressed
{
    NSLog(@"Profile button pressed");
}

- (IBAction)detailsPressed
{
    NSLog(@"Details button pressed");
}

@end
