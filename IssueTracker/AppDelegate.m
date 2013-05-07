//
//  AppDelegate.m
//  IssueTracker
//
//  Created by Jeffrey Camealy on 5/4/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "HTTPClient.h"
#import "UAGithubEngine.h"
#import "RequestsVC.h"
#import "IssuesTVC.h"
#import "RepositoriesTVC.h"

@interface AppDelegate () {
    HTTPClient *httpClient;
}
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = RepositoriesTVC.new;
//    [self httpTest];
    return YES;
}

- (void)httpTest {
    UAGithubEngine *engine = [[UAGithubEngine alloc] initWithUsername:@"jeffreycamealy" password:@"yuBruDR2030" withReachability:YES];
    
    [engine repositoriesWithSuccess:^(id response) {
        NSLog(@"Got an array of repos: %@", response);
    } failure:^(NSError *error) {
        NSLog(@"Oops: %@", error);
    }];
    
    [engine assignedIssuesWithState:@"open"
                            success:^(id response) {
                                
                            } failure:^(NSError *error) {
                                
                            }];
}

@end
