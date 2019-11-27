//
//  ZCStartUpCommandsBuilder.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCStartUpCommandsBuilder.h"
#import "ZCAppDelegateProtocol.h"

@implementation ZCStartUpCommandsBuilder

- (instancetype)initWithCommandType:(DelegateCommandType)type{
    self = [super init];
    if (self) {
        if (type & ZCAppDelegateCommandRefreshToken) {
            DelegateCommand command = [NSClassFromString(@"ZCAppDelegateCommandRefreshToken") new];
            [command execute];
        }
    }
    return self;
} 


@end
