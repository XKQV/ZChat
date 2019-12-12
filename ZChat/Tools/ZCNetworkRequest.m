
//
//  ZCNetworkRequest.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCNetworkRequest.h"
#import "NSString+ZCBaseUrlString.h"
#import <AFNetworking.h>

@implementation ZCNetworkRequest

+ (void)postRequestWithUrl:(NSString *)url requestBody:(NSDictionary *)bodyDict withResponseHandler:(nonnull resultHandler)handler {
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:bodyDict options:NSJSONWritingPrettyPrinted error:nil];
    NSString* jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:120];
    [request setHTTPMethod:@"POST"];
    [request setValue: @"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue: @"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody: [jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (handler) {
            handler(dict[@"data"], error);
        }
    }] resume];
}

+ (void)getRequestWithUrlString:(NSString *)url urlParameter:(nullable NSDictionary *)parameterDict withResponseHandler:(nonnull resultHandler)handler {
    if (parameterDict) {
        url = [NSString addParameter:parameterDict toUrl:url];
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:120];
       [request setHTTPMethod:@"GET"];
       [request setValue: @"application/json; encoding=utf-8" forHTTPHeaderField:@"Content-Type"];
       [request setValue: @"application/json" forHTTPHeaderField:@"Accept"];
       AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
       manager.responseSerializer = [AFHTTPResponseSerializer serializer];
       [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
           if (responseObject) {
               NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
               if (handler) {
                   handler(dict[@"data"], error);
               }
           }
       }] resume];
    
}

+ (void)getRequestWithUrlString:(NSString *)url withResponseHandler:(nonnull resultHandler)handler {
    [ZCNetworkRequest getRequestWithUrlString:url urlParameter:nil withResponseHandler:handler];
}


@end
