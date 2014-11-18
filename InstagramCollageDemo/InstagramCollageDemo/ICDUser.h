//
//  ICDUser.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDResponseProtocol.h"

@interface ICDUser : NSObject <ICDResponseProtocol>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSURL *profilePictures;

+ (instancetype)instantiateWithDictionary:(NSDictionary *)dictionary;

@end
