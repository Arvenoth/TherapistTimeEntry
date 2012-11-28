//
//  CARDFeedStore.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDFeedStore.h"
#import "CARDAuthenticationItem.h"

@interface CARDFeedStore()

@property (nonatomic, readonly) NSString *mainSite;

@end

@implementation CARDFeedStore

@synthesize mainSite;

- (NSString *)mainSite
{
    return @"http://phonest.centerforautism.com/";
}

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
}

@end