//
//  ICDSessionTask.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICDSessionTask : NSURLSessionDataTask

@property (nonatomic, readonly) BOOL isRunning;

+ (instancetype)sessionTaskWithDataTask:(NSURLSessionDataTask *)sessionDataTask;

- (void)cancel;

@end
