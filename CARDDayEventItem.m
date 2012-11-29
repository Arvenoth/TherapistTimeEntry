//
//  CARDDayEventItem.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/29/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDDayEventItem.h"

@implementation CARDDayEventItem

@synthesize parentParserDelegate;

@synthesize actualEndTime, actualStartTime, addressLineOne, addressLineTwo,
            appointmentDate, appointmentType, city, endSlot, endTime,
            latitude, longitude, patientId, startSlot, timeStatusId,
            tmTimeCardId, zipCode;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setActualEndTime:[d objectForKey:@"actualEndTime"]];
    [self setActualStartTime:[d objectForKey:@"actualStartTime"]];
    [self setAddressLineOne:[d objectForKey:@"addressLine1"]];
    [self setAddressLineTwo:[d objectForKey:@"addressLine2"]];
    [self setAppointmentDate:[d objectForKey:@"appointmentDate"]];
    [self setAppointmentType:[d objectForKey:@"appointmentType"]];
    [self setCity:[d objectForKey:@"city"]];
    [self setEndSlot:[d objectForKey:@"endSlot"]];
    [self setEndTime:[d objectForKey:@"endTime"]];
    [self setLatitude:[d objectForKey:@"lat"]];
    [self setLongitude:[d objectForKey:@"lng"]];
    [self setPatientId:[d objectForKey:@"patientId"]];
    [self setStartSlot:[d objectForKey:@"startSlot"]];
    [self setTimeStatusId:[d objectForKey:@"timeStatusId"]];
    [self setTmTimeCardId:[d objectForKey:@"tmTimeCardId"]];
    [self setZipCode:[d objectForKey:@"zipCode"]];
}

@end
