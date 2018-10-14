//
//  SectionHeaderCollectionReusableView.m
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import "SectionHeaderCollectionReusableView.h"

@implementation SectionHeaderCollectionReusableView

- (void)setUpHeader:(NSString *)albumID{
    [_headerLabel setText:[NSString stringWithFormat:@"Album ID : %@",albumID]];
}

@end
