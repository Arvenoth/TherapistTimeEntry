//
//  CARDNotesObject.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDNotesObject.h"

@implementation CARDNotesObject

@synthesize notes, status;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setNotes:[d objectForKey:@"notes"]];
    [self setStatus:[d objectForKey:@"status"]];
}

@end
