//
//  ZCStartUpCommandsBuilder.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_OPTIONS(NSUInteger, DelegateCommandType) {
    ZCAppDelegateCommandRefreshToken = 1 << 0,
};

@interface ZCStartUpCommandsBuilder : NSObject
    
- (instancetype)initWithCommandType:(DelegateCommandType)type;
    
@end

NS_ASSUME_NONNULL_END
