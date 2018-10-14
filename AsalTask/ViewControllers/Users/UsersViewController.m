//
//  UsersViewController.m
//  AsalTask
//
//  Created by Amr Abu Zant on 10/13/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import "UsersViewController.h"

#define cellIdentifier @"UserCell"

@interface UsersViewController ()

@end

@implementation UsersViewController
@synthesize dataSource;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"Users"];
    [self loadUsers];
    [[self tableView] setTableFooterView:[[UIView new] initWithFrame:CGRectZero]];
}

-(void) loadUsers{
    __weak __typeof__(self) weakSelf = self;

    [APIMethods getUsersWithCompletion:^(NSArray<User *> *data, NSString *error ) {
        if ([error  isEqual: @"0"]) {
            weakSelf.dataSource = data;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[weakSelf tableView] reloadData];
            });
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    User *user = [User new];
    user = [dataSource objectAtIndex:indexPath.row];
    [[cell textLabel] setText:user.name];
    [[cell detailTextLabel] setText:user.email];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"ShowUserDetails"]) {
        UserDetailsViewController *vc = segue.destinationViewController;
        UITableViewCell *cell = sender;
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", [[cell textLabel]text]];
        NSArray *filteredArray = [dataSource filteredArrayUsingPredicate:predicate];
        vc.userInfo = filteredArray.firstObject;
    }
}

@end
