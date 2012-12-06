//
//  CARDProfileItem.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDProfileItem.h"

@implementation CARDProfileItem

@synthesize hrEmployeeId, name, benefits, officeAddress, workSummary;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        benefits = [[CARDBenefitsItem alloc] init];
        officeAddress = [[CARDOfficeAddress alloc] init];
        workSummary = [[CARDWorkSummary alloc] init];
    }
    
    return self;
}

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setHrEmployeeId:[d objectForKey:@"hrEmployeeId"]];
    [self setName:[d objectForKey:@"name"]];
    [self setBenefits:[d objectForKey:@"benefits"]];
    [self setOfficeAddress:[d objectForKey:@"officeAddress"]];
    [self setWorkSummary:[d objectForKey:@"workSummary"]];
}

@end
