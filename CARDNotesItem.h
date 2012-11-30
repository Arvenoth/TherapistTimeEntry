//
//  CARDNotesItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"
#import "CARDAuthenticationItem.h"

@interface CARDNotesItem : NSObject <JSONSerializable>

@property (nonatomic, strong) NSString *employeeName;
@property (nonatomic, strong) NSNumber *identification;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *noteTitle;
@property (nonatomic, strong) NSString *timeStamp;

@property (nonatomic, strong) CARDAuthenticationItem *status;


@end
