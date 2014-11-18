//
//  ICDRequest.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ICDRequestCompletionBlock)(id responseObject, NSError *error);

@interface ICDRequest : NSObject

@property (nonatomic, strong) NSString *resource;
@property (nonatomic, strong) Class responseClass;
@property (nonatomic, strong) ICDRequestCompletionBlock complettionBlock;

+ (instancetype)requestWithResource:(NSString *)resource responseClass:(Class)responseClass;

@end
