//
//  ICDResponseProtocol.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICDResponseProtocol <NSObject>

+ (instancetype)instantiateWithDictionary:(NSDictionary *)dictionary;

@end
