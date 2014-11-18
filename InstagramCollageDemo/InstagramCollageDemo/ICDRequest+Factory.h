//
//  ICDRequest+Factory.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDRequest.h"

@interface ICDRequest (Factory)

/**
 Поиск пользователей по тексту
 */

+ (instancetype)searchUserRequestWithText:(NSString *)text clientIdentifier:(NSString *)clientID;

@end
