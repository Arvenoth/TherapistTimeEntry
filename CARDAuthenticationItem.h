//
//  CARDAuthenticationItem.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface CARDAuthenticationItem : NSObject <JSONSerializable>
{
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *token;

@end
