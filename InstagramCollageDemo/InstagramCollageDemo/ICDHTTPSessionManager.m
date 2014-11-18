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


@end
