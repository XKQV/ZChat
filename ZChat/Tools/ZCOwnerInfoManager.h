//
//  ZCOwnerInfoManager.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const ZCOwnerTokenRefreshedNotification = @"ZCOwnerTokenRefreshedNotification";

@interface ZCOwnerInfoManager : NSObject

@property(nonatomic,copy)NSString *token;

+ (instancetype)sharedInstance;

+ (NSString *)ownerToken;

+ (NSDictionary *)requestTokenDict;

@end

NS_ASSUME_NONNULL_END
