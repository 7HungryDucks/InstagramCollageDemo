//
//  UIView+CustomProperty.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomProperty)

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

@end
