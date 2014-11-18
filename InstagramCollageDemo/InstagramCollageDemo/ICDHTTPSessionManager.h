//
//  ICDHTTPSessionManager.h
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICDSessionTask.h"
#import "ICDRequest.h"
#import "ICDResponseProtocol.h"

/**
 Базовый класс для работы с HTTP
 */
@interface ICDHTTPSessionManager : NSObject

/**
 Инициализация
 
 @param baseURL Основной URL сервиса (из него и ICDRequest формируется запрос)
 @param configuration Настройки сессии
 */
- (instancetype)initWithBaseURL:(NSURL *)baseURL sessionConfiguration:(NSURLSessionConfiguration *)configuration;

/**
 Выполнение запроса
 
 @param request Запрос ICDRequest
 */
- (ICDSessionTask *)performRequest:(ICDRequest *)request;

@end
