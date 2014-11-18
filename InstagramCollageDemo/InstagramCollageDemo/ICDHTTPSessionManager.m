//
//  ICDHTTPSessionManager.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDHTTPSessionManager.h"

@interface ICDHTTPSessionManager()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURL *baseURL;

@end

@implementation ICDHTTPSessionManager

#pragma mark - Initialization

- (instancetype)initWithBaseURL:(NSURL *)baseURL sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super init];
    
    if(self) {
        
        self.baseURL = baseURL;
        self.session = self.session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    }
    
    return self;
}

#pragma mark - Public methods

- (ICDSessionTask *)performRequest:(ICDRequest *)request
{
    NSParameterAssert(request);
    
    BOOL conformsToProtocol = [request.responseClass conformsToProtocol:@protocol(ICDResponseProtocol)];
    NSAssert(conformsToProtocol, @"Response class must be conforms of %@ protocol", NSStringFromProtocol(@protocol(ICDResponseProtocol)));
    
    // Запрос
    NSString *requestString = [[NSURL URLWithString:request.resource relativeToURL:self.baseURL] absoluteString];
    
    // Блок выполняющийся после завершения задачи
    id completionHandler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id <ICDResponseProtocol> responseInstance = nil;
        
        if (!error) {
            
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingAllowFragments
                                                                         error:&error];
            
            if (!error) {
                
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                
                if (httpResponse.statusCode == 200)
                    responseInstance = [request.responseClass instantiateWithDictionary:dictionary];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(request.complettionBlock)
                request.complettionBlock(responseInstance, error);
        });
    };
    
    // Создание задачи и ее запуск
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:[NSURL URLWithString:requestString] completionHandler:completionHandler];
    [task resume];
    
    return [ICDSessionTask sessionTaskWithDataTask:task];
}

- (void)imageWithURL:(NSURL *)imageURL withCompletionBlock:(void (^)(UIImage *image, NSError *error))completionBlock
{
    // Формирование запроса
    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:20];
    
    // Проверка изображения в кэше
    NSCachedURLResponse * cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
    
    // Если кеш есть, то вернуть его через completionBlock
    if(cachedResponse && cachedResponse.data) {
        if(completionBlock)
            completionBlock([UIImage imageWithData:cachedResponse.data], nil);
        
        return;
    }
    
    // Изображения нет в кэше
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        UIImage *image = nil;
        
        if(!error) {
            
            NSData *data = [[NSData alloc] initWithContentsOfURL:location];
            
            if(data) {
                
                // Сохранение изображения в кеш
                NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response
                                                                                               data:data
                                                                                           userInfo:nil
                                                                                      storagePolicy:NSURLCacheStorageAllowed];
                
                [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse
                                                      forRequest:request];
                
                image = [UIImage imageWithData:data];
                
            } else {
                error = [NSError errorWithDomain:nil code:0 userInfo:nil];
            }
        }
        
        // Вернуть результат через блок completionBlock
        dispatch_async(dispatch_get_main_queue(), ^{
            if(completionBlock)
                completionBlock(image, error);
        });
        
    }];
    
    [task resume];

}

@end
