//
//  ICDUsers.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDUsers.h"
#import "ICDUser.h"

static NSString * const ICDUsersDataKey = @"data";

@implementation ICDUsers

+ (instancetype)instantiateWithDictionary:(NSDictionary *)dictionary
{
    return [[ICDUsers alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        
        NSMutableArray *users = [NSMutableArray array];
        
        NSArray *dataResponse = [dictionary valueForKey:ICDUsersDataKey];
        
        if (dataResponse && (NSNull *)dataResponse != [NSNull null]) {
            
            for (NSDictionary *userDictionary in dataResponse) {
                [users addObject:[ICDUser instantiateWithDictionary:userDictionary]];
            }
        }
        
        self.users = [NSArray arrayWithArray:users];
    }
    
    return self;
}

@end
