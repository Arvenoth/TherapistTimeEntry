//
//  CARDConnection.m
//  TherapistTimeEntry
//
//  Created by Robert Colin on 11/28/12.
//  Copyright (c) 2012 Center for Autism and Related Disorders, Inc. All rights reserved.
//

#import "CARDConnection.h"

static NSMutableArray *sharedConnectionList = nil;

@implementation CARDConnection

@synthesize request, completionBlock, jsonRootObject;

- (id)initWithRequest:(NSURLRequest *)req
{
    self = [super init];
    
    if (self)
    {
        [self setRequest:req];
    }
    
    return self;
}

- (void)start
{
    // Initialize the container for the data
    container = [[NSMutableData alloc] init];
    
    // Spawn the connection
    internalConnection = [[NSURLConnection alloc] initWithRequest:[self request]
                                                         delegate:self
                                                 startImmediately:YES];
    
    // If this is the first connection started, initialize the connection array
    if (!sharedConnectionList)
    {
        sharedConnectionList = [[NSMutableArray alloc] init];
    }
    
    // Add the connection to the shared list
    [sharedConnectionList addObject:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [container appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    id rootObject = nil;
    
    //
    //  The CARDConnection object could later be modified to receive
    //  XML data, this checks to make sure which is which
    //
    
    if ([self jsonRootObject])
    {
        // Turn JSON data into basic model objects
        NSDictionary *d = [NSJSONSerialization JSONObjectWithData:container
                                                          options:0
                                                            error:nil];
        
        // Have the root object construct itself from basic model objects
        [[self jsonRootObject] readFromJSONDictionary:d];
        
        rootObject = [self jsonRootObject];
    }
    
    // Then, pass the root object to the completionBlock
    if ([self completionBlock])
    {
        [self completionBlock](rootObject, nil);
    }
    
    // Now, destroy this connection
    [sharedConnectionList removeObject:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Pass the error from the connection to the completionBlock
    if ([self completionBlock])
    {
        [self completionBlock](nil, error);
    }
    
    // Destroy this connection
    [sharedConnectionList removeObject:self];
}

@end
