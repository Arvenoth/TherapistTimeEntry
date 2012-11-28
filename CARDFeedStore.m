//
//  CARDFeedStore.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDFeedStore.h"
#import "CARDAuthenticationItem.h"
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

@end