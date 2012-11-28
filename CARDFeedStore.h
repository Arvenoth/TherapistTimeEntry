//
//  CARDFeedStore.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CARDAuthenticationItem;

@interface CARDFeedStore : NSObject

+ (CARDFeedStore *)sharedStore;

- (void)fetchAuthenticationCredentials:(NSString *)username withPassword:(NSString *)password andCompletion:(void(^)(CARDAuthenticationItem *obj, NSError *err))block;

@end
