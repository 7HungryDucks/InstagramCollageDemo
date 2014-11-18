//
//  UIViewController+Loading.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "UIViewController+Loading.h"
#import "ICDLoadingView.h"

static NSInteger const ICDLoadingViewTag = 0xfff;

@implementation UIViewController (Loading)

- (void)icd_startLoading
{
    ICDLoadingView *loadingView = [self loadingView];
    if (!loadingView) {
        loadingView = [[ICDLoadingView alloc] initWithFrame:self.view.frame];
        loadingView.tag = ICDLoadingViewTag;
    }
    
    [self.view addSubview:loadingView];
    loadingView.textLabel.text = NSLocalizedString(@"Loading…", nil);
    
    loadingView.alpha = 0.0;
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        loadingView.alpha = 1.0;
    } completion:nil];
}

- (void)icd_finishLoading
{
    ICDLoadingView *loadingView = [self loadingView];
    if (!loadingView) {
        return;
    }
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        loadingView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [loadingView removeFromSuperview];
        }
    }];
}

#pragma mark - Private methods

- (ICDLoadingView *)loadingView
{
    NSInteger index = [self.view.subviews indexOfObjectPassingTest:^BOOL(UIView *obj, NSUInteger idx, BOOL *stop) {
        if (obj.tag == ICDLoadingViewTag) {
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
    ICDLoadingView *loadingView = nil;
    if (index != NSNotFound) {
        loadingView = self.view.subviews[index];
    }
    
    return loadingView;
}

- (void)setIcd_loading:(BOOL)loading
{
    if(loading) {
        [self icd_startLoading];
    } else {
        [self icd_finishLoading];
    }
}

- (BOOL)icd_loading
{
    return [self loadingView] != nil;
}

@end
