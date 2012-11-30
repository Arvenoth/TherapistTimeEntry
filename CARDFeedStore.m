//
//  CARDFeedStore.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDFeedStore.h"
#import "CARDAuthenticationItem.h"
#import "CARDDayEventChannel.h"
#import "CARDProfileItem.h"
#import "CARDConnection.h"

#define MAIN_SITE @"http://phonest.centerforautism.com/"

@interface CARDFeedStore()
- (NSURLRequest *)createRequestFromPortal:(NSString *)portal andParameters:(NSArray *)parameters;
@end

@implementation CARDFeedStore

+ (CARDFeedStore *)sharedStore
{
    static CARDFeedStore *feedStore = nil;
    
    if (!feedStore)
    {
        feedStore = [[CARDFeedStore alloc] init];
    }
    
    return feedStore;
}

- (void)fetchAuthenticationCredentials:(NSString *)username withPassword:(NSString *)password andCompletion:(void (^)(CARDAuthenticationItem *, NSError *))block
{
    // Prepare the URL to be sent off to the request
    NSString *authenticationPortal = [NSString stringWithFormat:@"authenticate?username=%@&password=%@", username, password];
    NSString *requestString = [NSString stringWithFormat:@"%@%@", MAIN_SITE, authenticationPortal];
    
    // Prepare the URL
    NSURL *authenticationURL = [NSURL URLWithString:requestString];
    
    // Prepare the connection
    NSURLRequest *authenticationRequest = [NSURLRequest requestWithURL:authenticationURL];
    CARDAuthenticationItem *authenticationResponse = [[CARDAuthenticationItem alloc] init];
    
    CARDConnection *connection = [[CARDConnection alloc] initWithRequest:authenticationRequest];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:authenticationResponse];
    
    [connection start];
}

- (void)fetchCalendarDayEvents:(NSString *)token onDate:(NSString *)date andCompletion:(void (^)(CARDDayEventChannel *, NSError *))block
{
    // Prepare the URL to be sent off to the request
    NSString *calendarDayPortal = [NSString stringWithFormat:@"calendar/day?token=%@&date=%@", token, date];
    NSString *requestString = [NSString stringWithFormat:@"%@%@", MAIN_SITE, calendarDayPortal];
    
    // Prepare the URL
    NSURL *calendarDayURL = [NSURL URLWithString:requestString];
    
    // Prepare the connection
    NSURLRequest *calendaryDayRequest = [NSURLRequest requestWithURL:calendarDayURL];
    CARDDayEventChannel *calendarDayResponse = [[CARDDayEventChannel alloc] init];
    
    CARDConnection *connection = [[CARDConnection alloc] initWithRequest:calendaryDayRequest];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:calendarDayResponse];
    
    [connection start];
}

- (void)fetchProfile:(NSString *)token andCompletion:(void (^)(CARDProfileItem *, NSError *))block
{
    NSString *profilePortal = [NSString stringWithFormat:@"profile?token=%@", token];
    NSString *requestString = [NSString stringWithFormat:@"%@%@", MAIN_SITE, profilePortal];
    
    NSURL *profileURL = [NSURL URLWithString:requestString];
    
    NSURLRequest *profileRequest = [NSURLRequest requestWithURL:profileURL];
    CARDProfileItem *profileResponse = [[CARDProfileItem alloc] init];
    
    CARDConnection *connection = [[CARDConnection alloc] initWithRequest:profileRequest];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:profileResponse];
    
    [connection start];
}

- (NSURLRequest *)createRequestFromPortal:(NSString *)portal andParameters:(NSArray *)parameters
{
    //
    // This is a helper function which will recieve the portal which it will target and insert
    // whatever required parameters are included
    //
    // NSString *requestedPortal = [NSString stringWithFormat:portal];
    
    return nil;
}

@end