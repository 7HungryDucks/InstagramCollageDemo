//
//  ICDInstagramClient.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDInstagramClient.h"
#import "ICDRequest+Factory.h"

NSString * const ICDInstagramAPIBaseURLString = @"https://api.instagram.com/v1/";
NSString * const ICDInstagramAPIClientID = @"5609d2fb2bf74d749716bd00a9090e5e";

@implementation ICDInstagramClient

#pragma mark - Initialization

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ICDInstagramClient *instance = nil;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[ICDInstagramClient alloc] initWithBaseURL:[NSURL URLWithString:ICDInstagramAPIBaseURLString]
                                          sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
    });
    
    return instance;
}

#pragma mark - Public methods

- (ICDSessionTask *)searchUserWithText:(NSString *)text completionBlock:(ICDRequestCompletionBlock)completionBlock
{
    ICDRequest *request = [ICDRequest searchUserRequestWithText:text clientIdentifier:ICDInstagramAPIClientID];
    request.complettionBlock = completionBlock;
    
    return [self performRequest:request];
}

@end
