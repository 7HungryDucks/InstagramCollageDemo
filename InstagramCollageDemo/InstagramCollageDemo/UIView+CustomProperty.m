//
//  UIView+CustomProperty.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "UIView+CustomProperty.h"

@implementation UIView (CustomProperty)

#pragma mark cornerRadius

- (void)setIcd_cornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)icd_cornerRadius {
    return self.layer.cornerRadius;
}

#pragma mark borderWidth

- (void)setIcd_borderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)icd_borderWidth {
    return self.layer.borderWidth;
}

#pragma mark - border color

- (void)setIcd_borderColor:(UIColor *)borderColor
{
    self.layer.borderColor = [borderColor CGColor];
}

- (UIColor *)icd_borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end
