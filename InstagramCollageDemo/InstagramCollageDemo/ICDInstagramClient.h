//
//  ICDInstagramClient.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDHTTPSessionManager.h"

extern NSString * const ICDInstagramAPIBaseURLString;
extern NSString * const ICDInstagramAPIClientID;

@interface ICDInstagramClient : ICDHTTPSessionManager

+ (instancetype)sharedInstance;

@end
