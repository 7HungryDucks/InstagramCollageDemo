//
//  ICDUser.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDUser.h"

static NSString * const ICDUserNameKey = @"username";
static NSString * const ICDUserFullNameKey = @"full_name";
static NSString * const ICDUserIDKey = @"id";
static NSString * const ICDUserProfilePictureKey = @"profile_picture";

id ICDGetValueFromDictionary(NSDictionary *dictionary, NSString *key, Class type)
{
    id object = [dictionary valueForKey:key];
    
    if (object && (NSNull *)object != [NSNull null] && [object isKindOfClass:type])
        return object;
    
    return nil;
}

@implementation ICDUser

+ (instancetype)instantiateWithDictionary:(NSDictionary *)dictionary
{
    return [[ICDUser alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        
        self.name       = ICDGetValueFromDictionary(dictionary, ICDUserNameKey,     [NSString class]);
        self.fullName   = ICDGetValueFromDictionary(dictionary, ICDUserFullNameKey, [NSString class]);
        self.userID     = ICDGetValueFromDictionary(dictionary, ICDUserIDKey,       [NSString class]);
        
        NSString *profileURLString =  ICDGetValueFromDictionary(dictionary, ICDUserProfilePictureKey, [NSString class]);
        if(profileURLString)
            self.profilePictures = [NSURL URLWithString:profileURLString];
        
    }
    return self;
}

@end
