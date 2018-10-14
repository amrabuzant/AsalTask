//
//  FullPhotoViewController.h
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsalTask-Swift.h"
#import <SDWebImage/UIImageView+WebCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface FullPhotoViewController : UIViewController
@property (nonatomic,retain) Photo *photo;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

NS_ASSUME_NONNULL_END
