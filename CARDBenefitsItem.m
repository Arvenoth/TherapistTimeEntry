//
//  CARDBenefitsItem.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDBenefitsItem.h"

@implementation CARDBenefitsItem

@synthesize availableSickTime, availableVacationTime, usedSickTime, usedVacationTime;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setAvailableSickTime:[d objectForKey:@"availableSickTime"]];
    [self setAvailableVacationTime:[d objectForKey:@"availableVacationTime"]];
    [self setUsedSickTime:[d objectForKey:@"usedSickTime"]];
    [self setUsedVacationTime:[d objectForKey:@"usedVacationTime"]];
}

@end
