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
#import "CARDConnection.h"

static NSString *mainSite = @"http://phonest.centerforautism.com/";

@interface CARDFeedStore()

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
    NSString *requestString = [NSString stringWithFormat:@"%@%@", mainSite, authenticationPortal];
    
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
    NSString *requestString = [NSString stringWithFormat:@"%@%@", mainSite, calendarDayPortal];
    
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

@end