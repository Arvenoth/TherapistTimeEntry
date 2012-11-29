//
//  CARDDayEventItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/29/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDDayEventItem : NSObject <JSONSerializable>
{
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;

@property (nonatomic, strong) NSNumber *actualEndTime;
@property (nonatomic, strong) NSString *actualStartTime;
@property (nonatomic, strong) NSString *addressLineOne;
@property (nonatomic, strong) NSString *addressLineTwo;
@property (nonatomic, strong) NSString *appointmentDate;
@property (nonatomic, strong) NSString *appointmentType;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSNumber *endSlot;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *patientId;
@property (nonatomic, strong) NSNumber *startSlot;
@property (nonatomic, strong) NSString *timeStatusId;
@property (nonatomic, strong) NSNumber *tmTimeCardId;
@property (nonatomic, strong) NSString *zipCode;

@end
