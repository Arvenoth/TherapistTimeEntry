//
//  CARDFeedStore.h
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CARDAuthenticationItem;
@class CARDDayEventChannel;
@class CARDProfileItem;
@class CARDPatientsItem;

@interface CARDFeedStore : NSObject

+ (CARDFeedStore *)sharedStore;

- (void)fetchAuthenticationCredentials:(NSString *)username withPassword:(NSString *)password andCompletion:(void(^)(CARDAuthenticationItem *obj, NSError *err))block;

- (void)fetchCalendarDayEvents:(NSString *)token onDate:(NSString *)date andCompletion:(void(^)(CARDDayEventChannel *obj, NSError *err))block;

- (void)fetchProfile:(NSString *)token andCompletion:(void(^)(CARDProfileItem *obj, NSError *err))block;

- (void)fetchPatientsAll:(NSString *)token withPatientId:(NSNumber *)patientId sinceDate:(NSString *)date andCompletion:(void(^)(CARDPatientsItem *obj, NSError *err))block;

@end
