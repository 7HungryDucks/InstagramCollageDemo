//
//  ICDLoadingView.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDLoadingView.h"

@implementation ICDLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    // self
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // wrapper
    UIView *wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 88, 88)];
    wrapper.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    wrapper.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    wrapper.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    wrapper.layer.cornerRadius = 5.0;
    [self addSubview:wrapper];
    
    // spinner
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [spinner startAnimating];
    spinner.center = CGPointMake(CGRectGetMidX(wrapper.bounds), CGRectGetMidY(wrapper.bounds) - 5.0);
    [wrapper addSubview:spinner];
    
    // label
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(wrapper.bounds) + 5.0, wrapper.bounds.size.width, wrapper.bounds.size.height - CGRectGetMidY(wrapper.bounds) - 5.0)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text = @"Loading…";
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:12.0];
    [wrapper addSubview:textLabel];
    _textLabel = textLabel;
}

@end
