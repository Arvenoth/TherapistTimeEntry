//
//  CARDPatientsItem.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDPatientsItem.h"

@implementation CARDPatientsItem

@synthesize birthDate, customerSiteId, guardianName, name, patientId, progressTrend,
            scheduledTime, startTime, tmTimeCardId, address, status;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        address = [[CARDPatientsAddress alloc] init];
        status = [[CARDAuthenticationItem alloc] init];
    }
    
    return self;
}

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [status readFromJSONDictionary:[d objectForKey:@"status"]];
    [address readFromJSONDictionary:[d objectForKey:@"address"]];
    
    [self setBirthDate:[d objectForKey:@"birthDate"]];
    [self setCustomerSiteId:[d objectForKey:@"customerSiteId"]];
    [self setGuardianName:[d objectForKey:@"guardianName"]];
    [self setName:[d objectForKey:@"name"]];
    [self setPatientId:[d objectForKey:@"progressTrend"]];
    [self setScheduledTime:[d objectForKey:@"scheduledTime"]];
    [self setStartTime:[d objectForKey:@"startTime"]];
    [self setTmTimeCardId:[d objectForKey:@"tmTimeCardId"]];
}

@end
