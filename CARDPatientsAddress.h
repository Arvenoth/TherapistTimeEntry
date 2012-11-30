//
//  CARDPatientsAddress.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDPatientsAddress : NSObject <JSONSerializable>

@property (nonatomic, strong) NSString *addressType;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *addressOne;
@property (nonatomic, strong) NSString *addressTwo;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSNumber *zipCode;

@end
