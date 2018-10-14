//
//  PhotosViewController.h
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsalTask-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosViewController : UIViewController<UICollectionViewDataSource>

@property (nonatomic,retain) NSDictionary<NSString*,NSMutableArray<Photo *>*> *dataSource;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
