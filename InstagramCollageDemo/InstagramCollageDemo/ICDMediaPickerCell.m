//
//  ICDMediaPickerCell.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMediaPickerCell.h"
#import "UIView+CustomProperty.h"

@implementation ICDMediaPickerCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.mediaImageView.image = nil;
}

#pragma mark - Laying Out

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
    self.borderColor = self.isSelected ? [UIColor blueColor] : [UIColor whiteColor];
    self.borderWidth = self.isSelected ? 5.0 : 0.0;

}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsLayout];
}

@end
