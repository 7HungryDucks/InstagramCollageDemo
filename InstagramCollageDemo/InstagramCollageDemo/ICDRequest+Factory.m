//
//  ICDRequest+Factory.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDRequest+Factory.h"

#import "ICDUsers.h"

static NSString * const searchUserEndpoint = @"users/search?q=%@&client_id=%@";

@implementation ICDRequest (Factory)

+ (instancetype)searchUserRequestWithText:(NSString *)text clientIdentifier:(NSString *)clientID
{
    ICDRequest *request = [ICDRequest requestWithResource:[NSString stringWithFormat:searchUserEndpoint, text, clientID]
                                      responseClass:[ICDUsers class]];
    
    return request;
}

@end
