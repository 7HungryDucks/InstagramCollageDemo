//
//  ICDMediaPickerViewController.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMediaPickerViewController.h"
#import "ICDMediaPickerCell.h"

@interface ICDMediaPickerViewController()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
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

#pragma mark - Networking

- (void)fetchData
{
    
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
    
    
    return cell;
}

@end
