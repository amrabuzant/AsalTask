//
//  PhotoCollectionViewCell.h
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsalTask-Swift.h"
#import <SDWebImage/UIImageView+WebCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain) Photo *photo;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *photoTitleLabel;

-(void) setUpCell:(Photo *) photo;

@end

NS_ASSUME_NONNULL_END
