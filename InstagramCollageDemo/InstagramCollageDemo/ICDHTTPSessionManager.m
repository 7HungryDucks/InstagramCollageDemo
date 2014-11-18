//
//  ICDHTTPSessionManager.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDHTTPSessionManager.h"

@interface ICDHTTPSessionManager()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURL *baseURL;

@end

@implementation ICDHTTPSessionManager

#pragma mark - Initialization

- (instancetype)initWithBaseURL:(NSURL *)baseURL sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super init];
    
    if(self) {
        
        self.baseURL = baseURL;
        self.session = self.session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    }
    
    return self;
}

@end
