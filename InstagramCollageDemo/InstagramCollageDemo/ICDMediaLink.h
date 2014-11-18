//
//  ICDMediaLink.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDResponseProtocol.h"

@interface ICDMediaLink : NSObject <ICDResponseProtocol>

@property (nonatomic, strong) NSURL *link;

@end
