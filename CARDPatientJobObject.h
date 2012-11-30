//
//  CARDPatientJobObject.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARDAuthenticationItem.h"
#import "CARDPatientJob.h"
#import "JSONSerializable.h"

@interface CARDPatientJobObject : NSObject <JSONSerializable>

@property (nonatomic, strong) CARDPatientJob *patientJob;
@property (nonatomic, strong) CARDAuthenticationItem *status;

@end
