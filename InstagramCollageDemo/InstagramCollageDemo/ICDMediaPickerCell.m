//
//  ICDMediaPickerCell.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMediaPickerCell.h"

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
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsLayout];
}

@end
