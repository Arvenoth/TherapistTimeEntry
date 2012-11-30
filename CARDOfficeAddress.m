//
//  CARDOfficeAddress.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDOfficeAddress.h"

@implementation CARDOfficeAddress

@synthesize addressType,city, latitude, longitude, addressOne, addressTwo,
            state, zipCode;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setAddressType:[d objectForKey:@"addressType"]];
    [self setCity:[d objectForKey:@"city"]];
    [self setLatitude:[d objectForKey:@"latitude"]];
    [self setLongitude:[d objectForKey:@"longitude"]];
    [self setAddressOne:[d objectForKey:@"line1"]];
    [self setAddressTwo:[d objectForKey:@"line2"]];
    [self setState:[d objectForKey:@"state"]];
    [self setZipCode:[d objectForKey:@"zipCode"]];
}

@end
