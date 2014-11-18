//
//  UIStoryboard+Segues.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMediaPickerViewController.h"

@class ICDUser;

@interface UIStoryboard (Segues)

- (ICDMediaPickerViewController *)instantiatePickerViewControllerWithUser:(ICDUser *)user;

@end
