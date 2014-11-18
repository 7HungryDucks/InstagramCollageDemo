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

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

#pragma mark borderWidth

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

#pragma mark - border color

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = [borderColor CGColor];
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end
