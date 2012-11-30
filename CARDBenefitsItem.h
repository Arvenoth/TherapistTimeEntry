//
//  CARDBenefitsItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDBenefitsItem : NSObject <JSONSerializable>

@property (nonatomic, strong) NSNumber *availableSickTime;
@property (nonatomic, strong) NSNumber *availableVacationTime;
@property (nonatomic, strong) NSNumber *usedSickTime;
@property (nonatomic, strong) NSNumber *usedVacationTime;

@end
