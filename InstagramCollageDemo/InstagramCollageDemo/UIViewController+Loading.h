//
//  UIViewController+Loading.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Loading)

@property (nonatomic, assign) BOOL icd_loading;

- (void)icd_startLoading;
- (void)icd_finishLoading;

@end
