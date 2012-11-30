//
//  CARDProfileItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDProfileItem : NSObject <JSONSerializable>

@property (nonatomic, strong) NSNumber *hrEmployeeId;
@property (nonatomic, strong) NSString *name;



@end
