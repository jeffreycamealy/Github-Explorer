//
//  RepositoriesTVC.m
//  IssueTracker
//
//  Created by Jeffrey Camealy on 5/6/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "RepositoriesTVC.h"
#import "UAGithubEngine.h"

@interface RepositoriesTVC () {
    UAGithubEngine *engine;
    NSArray *repos;
}

@end

@implementation RepositoriesTVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    engine = [[UAGithubEngine alloc] initWithUsername:@"jeffreycamealy" password:@"yuBruDR2030" withReachability:YES];
    
    @createWeakSelf;
    [engine repositoriesWithSuccess:^(id response) {
        repos = response;
        [weakself.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - Tableview DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return repos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = repos[indexPath.row][@"name"];
    
    return cell;
}


#pragma mark - Tableview Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
