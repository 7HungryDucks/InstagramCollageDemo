//
//  ICDSessionTask.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDSessionTask.h"

@interface ICDSessionTask()

@property (nonatomic, strong) NSURLSessionDataTask *sessionDataTask;

@end

@implementation ICDSessionTask

#pragma mark - Initialization

+ (instancetype)sessionTaskWithDataTask:(NSURLSessionDataTask *)sessionDataTask
{
    return [[ICDSessionTask alloc] initWithDataTask:sessionDataTask];
}

- (instancetype)initWithDataTask:(NSURLSessionDataTask *)sessionDataTask
{
    self = [super init];
    
    if(self) {
        
        self.sessionDataTask = sessionDataTask;
    }
    
    return self;
}

#pragma mark - Accessors

- (BOOL)isRunning
{
    return self.sessionDataTask.state == NSURLSessionTaskStateRunning;
}

#pragma mark - Operations

- (void)cancel
{
    [self.sessionDataTask cancel];
}

@end
