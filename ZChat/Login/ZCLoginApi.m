//
//  ZCLoginApi.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCLoginApi.h"

@implementation ZCLoginApi

+ (void)refreshToken {
    NSDictionary *params = @{@"account": @"18900000036",
                             @"type": @"1",
                             @"password": @"e3dfe14d35c69e95"};
 
    
    [ZCNetworkRequest getRequestWithUrlString:[NSString getURLStringWithAPIType:ZDHttpAPITypeUAPI url:@"login"] urlParameter:params withResponseHandler:^(NSDictionary * _Nonnull data, NSError * _Nonnull error) {
        [ZCOwnerInfoManager sharedInstance].userID = data[@"data"][@"user_id"];
        [ZCOwnerInfoManager sharedInstance].token = data[@"data"][@"token"];
    }];
}

// 拿个人信息
//query_profile
@end
