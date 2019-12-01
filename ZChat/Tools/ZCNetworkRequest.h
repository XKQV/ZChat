//
//  ZCNetworkRequest.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCNetworkDefine.h"
#import "NSString+ZCBaseUrlString.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^resultHandler)(NSDictionary *data, NSError *error);

@interface ZCNetworkRequest : NSObject

+ (void)postRequestWithUrl:(NSString *)url requestBody:(NSDictionary *)bodyDict withResponseHandler:(resultHandler)handler;

+ (void)getRequestWithUrlString:(NSString *)url withResponseHandler:(resultHandler)handler;

+ (void)getRequestWithUrlString:(NSString *)url urlParameter:(nullable NSDictionary *)parameterDict withResponseHandler:(nonnull resultHandler)handler;
    
@end

NS_ASSUME_NONNULL_END
