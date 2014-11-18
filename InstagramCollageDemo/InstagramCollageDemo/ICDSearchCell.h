//
//  ICDSearchCell.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICDUser;

@interface ICDSearchCell : UITableViewCell

- (void)configureWithUser:(ICDUser *)user;

@end
