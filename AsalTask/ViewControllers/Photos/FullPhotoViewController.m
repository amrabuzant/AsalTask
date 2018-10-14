//
//  FullPhotoViewController.m
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import "FullPhotoViewController.h"

@interface FullPhotoViewController ()

@end

@implementation FullPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadPhoto:_photo];
}

- (void) loadPhoto:(Photo*) photo{
    [_photoImageView sd_setImageWithURL:[NSURL URLWithString:photo.url]];
    [self setTitle:photo.title];
}

@end
