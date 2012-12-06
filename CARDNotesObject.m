//
//  CARDNotesObject.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDNotesObject.h"

@implementation CARDNotesObject

@synthesize allNotes, status;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        allNotes = [[NSMutableArray alloc] init];
        status = [[CARDAuthenticationItem alloc] init];
    }
    
    return self;
}
- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setStatus:[d objectForKey:@"status"]];
    
    NSArray *notes = [d objectForKey:@"notes"];
    
    for (NSDictionary *note in notes)
    {
        CARDNotesItem *i = [[CARDNotesItem alloc] init];
        
        [i readFromJSONDictionary:note];
        
        [allNotes addObject:i];
    }
}

@end
