//
//  UserDetailsViewController.m
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import "UserDetailsViewController.h"

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController
@synthesize userInfo;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self LoadInfo:userInfo];
}

- (void) LoadInfo:(User*) user{
    [self setTitle:user.name];
    [_idLabel setText: [NSString stringWithFormat:@"%ld", (long)user.id]];
    [_nameLabel setText:user.name];
    [_userNameLabel setText:user.username];
    [_emailLabel setText:user.email];
    [_addressLabel setText:[NSString stringWithFormat:@"%@ / %@ / %@",user.address.suite,user.address.street,user.address.city]];
    [_zipCodeLabel setText:user.address.zipcode];
    [_phoneLabel setText:user.phone];
    [_websiteLabel setText:user.website];
    [_comNameLabel setText:user.company.name];
    [_comCatchPheaseLabel setText:user.company.catchPhrase];
    [_comBSLabel setText:user.company.bs];
    
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    CLLocationCoordinate2D userLocation = CLLocationCoordinate2DMake([user.address.geo.lat floatValue], [user.address.geo.lng floatValue]);
    [annotation setCoordinate:userLocation];
    [annotation setTitle:[NSString stringWithFormat:@"%@ Location", user.username]];
    [_geoMapView addAnnotation:annotation];
    [_geoMapView setCenterCoordinate:userLocation animated:NO];

}

@end
