//
//  ICDMediaLink.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMediaLink.h"

static NSString * const ICDMediaLinkImagesKey = @"images";
static NSString * const ICDMediaLinkResolutionKey = @"standard_resolution";
static NSString * const ICDMediaLinkURLKey = @"url";

@implementation ICDMediaLink

+ (instancetype)instantiateWithDictionary:(NSDictionary *)dictionary
{
    return [[ICDMediaLink alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        
        self.link = [self parseLink:dictionary];
    }
    
    return self;
}

- (NSURL *)parseLink:(NSDictionary *)dictionary
{
    NSString * value = @"";
    
    NSDictionary *images = [dictionary valueForKey:ICDMediaLinkImagesKey];
    if (images && (NSNull *)images != [NSNull null]) {
        NSDictionary * imageDictionary = [images valueForKey:ICDMediaLinkResolutionKey];
        if (imageDictionary && (NSNull *)imageDictionary != [NSNull null]) {
            NSString *tempURLString = [imageDictionary valueForKey:ICDMediaLinkURLKey];
            if (tempURLString && (NSNull *)tempURLString != [NSNull null]) {
                value = tempURLString;
            }
        }
    }
    
    return [NSURL URLWithString:value];
}

@end
