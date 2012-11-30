//
//  CARDWorkSummary.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDWorkSummary : NSObject <JSONSerializable>

@property (nonatomic, strong) NSNumber *billableHoursWorked;
@property (nonatomic, strong) NSNumber *nonBillableHoursWorked;
@property (nonatomic, strong) NSNumber *overtimeHoursWorked;
@property (nonatomic, strong) NSNumber *regularHoursWorked;

@end
