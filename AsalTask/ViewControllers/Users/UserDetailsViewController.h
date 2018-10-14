//
//  UserDetailsViewController.h
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsalTask-Swift.h"
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailsViewController : UIViewController
@property (nonatomic,retain) User *userInfo;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipCodeLabel;
@property (weak, nonatomic) IBOutlet MKMapView *geoMapView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *comNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *comCatchPheaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *comBSLabel;


@end

NS_ASSUME_NONNULL_END
