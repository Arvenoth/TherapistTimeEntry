//
//  CARDDayEventChannel.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/29/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CARDAuthenticationItem.h"
#import "JSONSerializable.h"

@interface CARDDayEventChannel : NSObject <JSONSerializable>
{
    NSMutableString *currentString;
}

@property (nonatomic, readonly, strong) NSMutableArray *dayEvents;
@property (nonatomic, strong) CARDAuthenticationItem *status;

@end
