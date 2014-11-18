//
//  ICDMedia.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDMedia.h"
#import "ICDMediaLink.h"

static NSString * const ICDMediaDataKey = @"data";

@implementation ICDMedia

+ (instancetype)instantiateWithDictionary:(NSDictionary *)dictionary
{
    return [[ICDMedia alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self) {
        
        NSMutableArray *media = [NSMutableArray array];
        
        NSArray *dataResponse = [dictionary valueForKey:ICDMediaDataKey];
        
        if (dataResponse && (NSNull *)dataResponse != [NSNull null]) {
            
            for (NSDictionary *mediaDictionary in dataResponse) {
                [media addObject:[ICDMediaLink instantiateWithDictionary:mediaDictionary]];
            }
        }
        
        self.media = [NSArray arrayWithArray:media];
    }
    
    return self;
}

@end
