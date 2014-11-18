//
//  ICDMediaPickerViewController.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMediaPickerViewController.h"
#import "ICDMediaPickerCell.h"

#import "ICDInstagramClient.h"
#import "ICDMedia.h"
#import "ICDMediaLink.h"

#import "UIStoryboard+Segues.h"
#import "UIViewController+Loading.h"

@interface ICDMediaPickerViewController() <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) ICDSessionTask *mediaSessionTask;
@property (nonatomic, assign) BOOL viewHasBeenAppeared;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ICDMediaPickerViewController

#pragma mark - Initialization

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.allowsMultipleSelection = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(!self.viewHasBeenAppeared)
        [self fetchData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.viewHasBeenAppeared = YES;
}

- (void)viewDidUnload
{
    if(self.mediaSessionTask && self.mediaSessionTask.isRunning) {
        [self.mediaSessionTask cancel];
    }
}

#pragma mark - Networking

- (void)fetchData
{
    self.icd_loading = YES;
    
    __weak typeof(self) weakSelf = self;
    self.mediaSessionTask = [[ICDInstagramClient sharedInstance] fetchMediaWithUserIdentifier:self.userID completionBlock:^(ICDMedia *responseObject, NSError *error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if(!strongSelf)
            return;
        
        strongSelf.icd_loading = NO;
        
        if(!error && responseObject.media.count > 0) {
            
            strongSelf.dataSource = responseObject.media;
            [strongSelf.collectionView reloadData];
        }
    }];
}

#pragma mark - Action 

- (IBAction)collageButtonTouch:(id)sender
{
    NSArray *selectedItem = [self selectedItem];
    
    if(selectedItem) {
        
        id controller = [self.storyboard icd_instantiateCollageViewControllerWithSelectedMedia:selectedItem];
    
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:NSLocalizedString(@"mediaPicker.message", nil)                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"mediaPicker.cancel", nil)
                          otherButtonTitles:nil, nil] show];
    }
}

- (NSArray *)selectedItem
{
    NSArray *selectedItem = [self.collectionView indexPathsForSelectedItems];
    
    if(selectedItem.count == 0) {
        return nil;
    }
    
    NSMutableArray *selectedPhotos = [NSMutableArray array];
    
    for(NSIndexPath *indexPath in selectedItem) {
        [selectedPhotos addObject:self.dataSource[indexPath.row]];
    }
    
    return selectedPhotos;
}

#pragma mark - Collection view

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ICDMediaPickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    NSAssert([cell isKindOfClass:[ICDMediaPickerCell class]], @"Cell must be kind of %@ class", NSStringFromClass([ICDMediaPickerCell class]));
    
    ICDMediaLink *mediaLink = self.dataSource[indexPath.row];
    
    cell.indexPath = indexPath;
    [[ICDInstagramClient sharedInstance] imageWithURL:mediaLink.link withCompletionBlock:^(UIImage *image, NSError *error) {
        
        if([cell.indexPath isEqual:indexPath])
            cell.mediaImageView.image = image;
    }];
    
    return cell;
}

@end
