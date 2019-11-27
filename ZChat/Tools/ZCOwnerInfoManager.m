//
//  ZCOwnerInfoManager.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCOwnerInfoManager.h"

@implementation ZCOwnerInfoManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ZCOwnerInfoManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[ZCOwnerInfoManager alloc] init];
    });
    return manager;
}

+ (NSString *)ownerToken {
    return [ZCOwnerInfoManager sharedInstance].token;
}

- (void)setToken:(NSString *)token {
    _token = token;
    [[NSNotificationCenter defaultCenter] postNotificationName:ZCOwnerTokenRefreshedNotification object:nil userInfo:nil];
}

+ (NSDictionary *)requestTokenDict {
    return @{@"token" : [ZCOwnerInfoManager ownerToken] ?: @""};
}

@end
