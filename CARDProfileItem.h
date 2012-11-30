//
//  CARDProfileItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"
#import "CARDBenefitsItem.h"
#import "CARDOfficeAddress.h"
#import "CARDWorkSummary.h"

@interface CARDProfileItem : NSObject <JSONSerializable>

@property (nonatomic, strong) NSNumber *hrEmployeeId;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) CARDBenefitsItem *benefits;
@property (nonatomic, strong) CARDOfficeAddress *officeAddress;
@property (nonatomic, strong) CARDWorkSummary *workSummary;

@end
