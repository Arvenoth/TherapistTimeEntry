//
//  CARDAuthenticationItem.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDAuthenticationItem.h"

@implementation CARDAuthenticationItem

@synthesize message, status, token;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setMessage:[d objectForKey:@"message"]];
    [self setStatus:[d objectForKey:@"status"]];
    [self setToken:[d objectForKey:@"token"]];
}

@end
