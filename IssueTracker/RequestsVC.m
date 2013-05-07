//
//  RequestsVC.m
//  IssueTracker
//
//  Created by Jeffrey Camealy on 5/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "RequestsVC.h"
#import "HTTPClient.h"

@interface RequestsVC () {
    HTTPClient *httpClient;
}
@end


@implementation RequestsVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    httpClient = [HTTPClient.alloc initWithBaseURL:[NSURL URLWithString:@"https://github.com/jeffreycamealy/"]];
}

- (IBAction)goButtonPressed {
    self.textView.text = @"";
    [self.view endEditing:YES];
    
    [httpClient getPath:self.pathField.text
             parameters:nil
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    self.textView.text = [responseObject description];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    self.textView.text = error.description;
                }];
}

@end
