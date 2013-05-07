//
//  HTTPClient.m
//  IssueTracker
//
//  Created by Jeffrey Camealy on 5/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

#pragma mark - Init Method

- (id)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self setAuthorizationHeaderWithUsername:@"jeffreycamealy" password:@"yuBruDR2030"];
    }
    return self;
}

@end
