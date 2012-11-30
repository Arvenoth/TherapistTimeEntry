//
//  CARDNotesItem.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDNotesItem.h"

@implementation CARDNotesItem

@synthesize employeeName, identification, note, noteTitle, timeStamp, status;

- (void)readFromJSONDictionary:(NSDictionary *)d
{
    [self setEmployeeName:[d objectForKey:@"employeeName"]];
    [self setIdentification:[d objectForKey:@"identification"]];
    [self setNote:[d objectForKey:@"note"]];
    [self setNoteTitle:[d objectForKey:@"noteTitle"]];
    [self setTimeStamp:[d objectForKey:@"timeStamp"]];
    [self setStatus:[d objectForKey:@"status"]];
}

@end
