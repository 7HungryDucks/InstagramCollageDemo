//
//  AppDelegate.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "AppDelegate.h"

static const NSUInteger memoryCapacity = 60 * 1024 * 1024;
static const NSUInteger diskCapacity = 200 * 1024 * 1024;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSURLCache setSharedURLCache:[[NSURLCache alloc] initWithMemoryCapacity:memoryCapacity
                                                                diskCapacity:diskCapacity
                                                                    diskPath:nil]];
    return YES;
}

@end
