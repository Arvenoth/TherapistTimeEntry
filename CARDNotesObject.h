//
//  CARDNotesObject.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/30/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARDNotesItem.h"
#import "CARDAuthenticationItem.h"
#import "JSONSerializable.h"

@interface CARDNotesObject : NSObject <JSONSerializable>
{
    NSMutableString *currentString;
}

@property (nonatomic, readonly, strong) NSMutableArray *allNotes;
@property (nonatomic, strong) CARDAuthenticationItem *status;

@end
