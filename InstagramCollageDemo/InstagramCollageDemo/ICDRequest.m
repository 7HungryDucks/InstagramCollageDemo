//
//  ICDRequest.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDRequest.h"

@implementation ICDRequest

+ (instancetype)requestWithResource:(NSString *)resource responseClass:(Class)responseClass
{
    ICDRequest * request = [ICDRequest new];
    
    request.resource = resource;
    request.responseClass = responseClass;
    
    return request;
}

@end
