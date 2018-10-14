//
//  UsersViewController.h
//  AsalTask
//
//  Created by Amr Abu Zant on 10/13/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsalTask-Swift.h"
#import "UserDetailsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UsersViewController : UIViewController <UITableViewDataSource>

@property (nonatomic,retain) NSArray<User *> *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
