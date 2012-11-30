//
//  CARDPatientJob.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDPatientJob : NSObject <JSONSerializable>

@property (nonatomic, strong) NSNumber *hours;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSNumber *overtimeAllowed;
@property (nonatomic, strong) NSNumber *priority;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *workAuthorizationId;

@end
