//
//  UIStoryboard+Segues.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "UIStoryboard+Segues.h"

#import "ICDUser.h"

static NSString * const ICDMediaPickerViewControllerIdentifier = @"ICDMediaPickerViewController";
static NSString * const ICDCollageViewControllerIdentifier = @"ICDCollageViewController";

@implementation UIStoryboard (Segues)

- (ICDMediaPickerViewController *)instantiatePickerViewControllerWithUser:(ICDUser *)user
{
    ICDMediaPickerViewController *controller = [self instantiateViewControllerWithIdentifier:ICDMediaPickerViewControllerIdentifier];
    
    NSAssert([controller isKindOfClass:[ICDMediaPickerViewController class]], @"View controller must be kind of %@ class", NSStringFromClass([ICDMediaPickerViewController class]));
    
    controller.title = user.fullName;
    controller.userID = user.userID;
    
    return controller;
}

- (ICDCollageViewController *)instantiateCollageViewControllerWithSelectedMedia:(NSArray *)media
{
    ICDCollageViewController *controller = [self instantiateViewControllerWithIdentifier:ICDCollageViewControllerIdentifier];
    
    NSAssert([controller isKindOfClass:[ICDCollageViewController class]], @"View controller must be kind of %@ class", NSStringFromClass([ICDCollageViewController class]));
    
    controller.title = NSLocalizedString(@"Preview", nil);
    controller.selectedMedia = media;
    
    return controller;
}

@end
