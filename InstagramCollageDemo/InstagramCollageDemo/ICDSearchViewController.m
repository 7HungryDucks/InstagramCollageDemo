//
//  ICDSearchViewController.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDSearchViewController.h"
#import "ICDSearchCell.h"

#import "ICDInstagramClient.h"
#import "ICDUsers.h"
#import "ICDUser.h"

#import "UIViewController+Loading.h"
#import "UIStoryboard+Segues.h"

@interface ICDSearchViewController() <UISearchBarDelegate>

@property (nonatomic, strong) ICDSessionTask *searchSession;
@property (nonatomic, strong) NSArray *users;

@end

@implementation ICDSearchViewController

#pragma mark - Networking

- (void)featchDataWithSearchText:(NSString *)text
{
    if(self.searchSession && self.searchSession.isRunning) {
        [self.searchSession cancel];
    }
    
    if(text && ![text isEqualToString:@""]) {
        
        self.loading = YES;
        self.searchSession = [[ICDInstagramClient sharedInstance] searchUserWithText:text completionBlock:^(ICDUsers *responseObject, NSError *error) {

            self.loading = NO;
            
            self.users = responseObject.users;
            [self.tableView reloadData];
        }];
        
    } else {
        
        self.users = nil;
        [self.tableView reloadData];
    }
}

#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICDSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ICDUser *user = self.users[indexPath.row];
    
    [cell configureWithUser:user];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICDUser *user = self.users[indexPath.row];
    
    id controller = [self.storyboard instantiatePickerViewControllerWithUser:user];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UISearchBar delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self featchDataWithSearchText:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

@end
