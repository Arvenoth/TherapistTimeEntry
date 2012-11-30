//
//  CARDWorkSummary.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDWorkSummary.h"

@implementation CARDWorkSummary

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setBillableHoursWorked:[d objectForKey:@"billableHoursWorked"]];
    [self setNonBillableHoursWorked:[d objectForKey:@"nonBillableHoursWorked"]];
    [self setOvertimeHoursWorked:[d objectForKey:@"overtimeHoursWorked"]];
    [self setRegularHoursWorked:[d objectForKey:@"regularHoursWorked"]];
}

@end
