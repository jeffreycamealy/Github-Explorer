//
//  IssuesTVC.m
//  IssueTracker
//
//  Created by Jeffrey Camealy on 5/6/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "IssuesTVC.h"
#import "UAGithubEngine.h"

@interface IssuesTVC () {
    UAGithubEngine *engine;
    NSArray *issues;
}
@end


@implementation IssuesTVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    engine = [[UAGithubEngine alloc] initWithUsername:@"jeffreycamealy" password:@"yuBruDR2030" withReachability:YES];
    
    @createWeakSelf;
    [engine assignedIssuesWithState:@"open"
                            success:^(id response) {
                                issues = response;
                                [weakself.tableView reloadData];
                            } failure:^(NSError *error) {
                                
                            }];
}


#pragma mark - Tableview DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return issues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = issues[indexPath.row][@"title"];
    
    return cell;
}


#pragma mark - Tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
