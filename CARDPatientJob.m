//
//  CARDPatientJob.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDPatientJob.h"

@implementation CARDPatientJob

@synthesize hours, note, overtimeAllowed, priority, title, type, workAuthorizationId;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setHours:[d objectForKey:@"hours"]];
    [self setNote:[d objectForKey:@"note"]];
    [self setOvertimeAllowed:[d objectForKey:@"overtimeAllowed"]];
    [self setPriority:[d objectForKey:@"priority"]];
    [self setTitle:[d objectForKey:@"title"]];
    [self setType:[d objectForKey:@"type"]];
    [self setWorkAuthorizationId:[d objectForKey:@"workAuthorizationId"]];
}

@end
