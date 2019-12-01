//
//  ZCAppDelegateCommandRefreshToken.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCAppDelegateCommandRefreshToken.h"
#import "ZCLoginApi.h"

@implementation ZCAppDelegateCommandRefreshToken

- (void)execute {
    [ZCLoginApi refreshToken];
}

@end
