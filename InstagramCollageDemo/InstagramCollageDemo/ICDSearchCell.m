//
//  ICDSearchCell.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDSearchCell.h"
#import "ICDUser.h"

@interface ICDSearchCell()

@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ICDSearchCell

- (void)configureWithUser:(ICDUser *)user
{
    self.fullNameLabel.text = user.fullName;
    self.nameLabel.text = user.name;
}

@end
