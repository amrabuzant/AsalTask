//
//  PhotoCollectionViewCell.m
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell
@synthesize photo;

- (void)setUpCell:(Photo *)photo{
    [self setPhoto:photo];
    [_thumbImageView sd_setImageWithURL:[NSURL URLWithString:photo.thumbnailUrl]];
    [_photoTitleLabel setText:photo.title];
}

@end
