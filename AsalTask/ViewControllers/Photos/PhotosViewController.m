//
//  PhotosViewController.m
//  AsalTask
//
//  Created by Amr Abu Zant on 10/14/18.
//  Copyright © 2018 Amr Abu Zant. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotoCollectionViewCell.h"
#import "SectionHeaderCollectionReusableView.h"
#import "FullPhotoViewController.h"

#define cellIdentifier @"PhotoCell"
#define headerIdentifier @"SectionHeader"


@interface PhotosViewController ()

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitle:@"Photos"];
    
    [self loadPhotos];
}

- (void) loadPhotos{
    __weak __typeof__(self) weakSelf = self;

    [APIMethods getPhotosWithCompletion:^(NSArray<Photo *> *data , NSString *error) {
        if ([error  isEqual: @"0"]) {
            NSMutableDictionary *userData = [NSMutableDictionary new];
            for (Photo *item in data) {
                NSString *key = [NSString stringWithFormat:@"%ld",(long)item.albumId];
                id value = userData[key];
                if (value) {
                    [userData[key] addObject:item];
                    NSLog(@"Key Exists");
                }else{
                    userData[key] = [NSMutableArray new];
                    NSLog(@"Key Doesn't Exist");
                }
            }
            
            weakSelf.dataSource = userData;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[weakSelf collectionView] reloadData];
            });
        }
    }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowFullPhoto"]) {
        FullPhotoViewController *vc = segue.destinationViewController;

        PhotoCollectionViewCell *cell = sender;
        
        vc.photo = cell.photo;
        
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [_dataSource count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *keys = [_dataSource allKeys];
    NSString *key = [keys objectAtIndex:section];
    NSArray *arr = [_dataSource objectForKey:key];
    return [arr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSArray *keys = [_dataSource allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *arr = [_dataSource objectForKey:key];
    
    [cell setUpCell:[arr objectAtIndex:indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    SectionHeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
    
    NSArray *keys = [_dataSource allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    
    [header setUpHeader:key];
    
    return header;
}

@end
