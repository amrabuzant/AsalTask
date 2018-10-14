//
//  SectionHeaderCollectionReusableView.h
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SectionHeaderCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

-(void) setUpHeader:(NSString *)albumID;

@end

NS_ASSUME_NONNULL_END
