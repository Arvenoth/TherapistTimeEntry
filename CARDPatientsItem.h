//
//  CARDPatientsItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARDPatientsAddress.h"
#import "CARDAuthenticationItem.h"
#import "JSONSerializable.h"

@interface CARDPatientsItem : NSObject <JSONSerializable>

@property (nonatomic, strong) NSString *birthDate;
@property (nonatomic, strong) NSNumber *customerSiteId;
@property (nonatomic, strong) NSString *guardianName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *patientId;
@property (nonatomic, strong) NSNumber *progressTrend;
@property (nonatomic, strong) NSNumber *scheduledTime;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSNumber *tmTimeCardId;

@property (nonatomic, strong) CARDPatientsAddress *address;
@property (nonatomic, strong) CARDAuthenticationItem *status;

@end
