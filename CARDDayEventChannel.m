//
//  CARDDayEventChannel.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/29/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDDayEventChannel.h"
#import "CARDDayEventItem.h"

@implementation CARDDayEventChannel

@synthesize parentParserDelegate, status, dayEvents;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        dayEvents = [[NSMutableArray alloc] init];
        status = [[CARDAuthenticationItem alloc] init];
    }
    
    return self;
}

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [status readFromJSONDictionary:[d objectForKey:@"status"]];
    
    NSArray *events = [d objectForKey:@"dayEvent"];
    
    for (NSDictionary *event in events)
    {
        CARDDayEventItem *i = [[CARDDayEventItem alloc] init];
        
        [i readFromJSONDictionary:event];
        
        [dayEvents addObject:i];
    }
}

@end
