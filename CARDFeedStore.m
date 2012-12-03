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
#import "CARDPatientsItem.h"
#import "CARDNotesObject.h"
#import "CARDPatientJobObject.h"
#import "CARDConnection.h"

#define MAIN_SITE @"http://phonest.centerforautism.com/"

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

- (void)fetchPatientsAll:(NSString *)token withIdentification:(NSNumber *)identification sinceDate:(NSString *)date andCompletion:(void (^)(CARDPatientsItem *, NSError *))block
{
    NSString *patientsAllPortal = [NSString stringWithFormat:@"patients/all?token=%@&id=%@&since=%@", token, identification, date];
    NSString *requestString = [NSString stringWithFormat:@"%@%@", MAIN_SITE, patientsAllPortal];
    
    NSURL *patientsAllURL = [NSURL URLWithString:requestString];
    
    NSURLRequest *patientsAllRequest = [NSURLRequest requestWithURL:patientsAllURL];
    CARDPatientsItem *patientsAllResponse = [[CARDPatientsItem alloc] init];
    
    CARDConnection *connection = [[CARDConnection alloc] initWithRequest:patientsAllRequest];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:patientsAllResponse];
    
    [connection start];
}

- (void)fetchNotesAll:(NSString *)token forPatient:(NSNumber *)patientId sinceDate:(NSString *)date andCompletion:(void (^)(CARDNotesObject *, NSError *))block
{
    NSString *notesAllPortal = [NSString stringWithFormat:@"notes/all?token=%@&id=%@&since=%@", token, patientId, date];
    NSString *requestString = [NSString stringWithFormat:@"%@%@", MAIN_SITE, notesAllPortal];
    
    NSURL *notesAllURL = [NSURL URLWithString:requestString];
    
    NSURLRequest *notesAllRequest = [NSURLRequest requestWithURL:notesAllURL];
    CARDNotesObject *notesAllResponse = [[CARDNotesObject alloc] init];
    
    CARDConnection *connection  = [[CARDConnection alloc] initWithRequest:notesAllRequest];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:notesAllResponse];
    
    [connection start];
}

- (void)fetchWorkAuthorizationList:(NSString *)token andCompletion:(void (^)(CARDPatientJobObject *, NSError *))block
{
    NSString *workAuthorizationListPortal = [NSString stringWithFormat:@"workauthorization/list?token=%@", token];
    NSString *requestString = [NSString stringWithFormat:@"%@%@", MAIN_SITE, workAuthorizationListPortal];
    
    NSURL *workAuthorizationListURL = [NSURL URLWithString:requestString];
    
    NSURLRequest *workAuthorizationRequest = [NSURLRequest requestWithURL:workAuthorizationListURL];
    CARDPatientJobObject *workAuthorizationResponse = [[CARDPatientJobObject alloc] init];
    
    CARDConnection *connection = [[CARDConnection alloc] initWithRequest:workAuthorizationRequest];
    [connection setCompletionBlock:block];
    [connection setJsonRootObject:workAuthorizationResponse];
    
    [connection start];
}

@end