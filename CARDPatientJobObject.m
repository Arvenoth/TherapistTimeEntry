//
//  CARDPatientJobObject.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDPatientJobObject.h"

@implementation CARDPatientJobObject

@synthesize patientJob, status;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [status readFromJSONDictionary:[d objectForKey:@"status"]];
    [patientJob readFromJSONDictionary:[d objectForKey:@"patientJob"]];
}

@end
