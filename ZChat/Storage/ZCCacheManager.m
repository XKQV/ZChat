//
//  ZCCacheManager.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/27.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCCacheManager.h"

@interface ZCCacheManager ()



@end

@implementation ZCCacheManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ZCCacheManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZCCacheManager alloc] init];
    });
    return sharedInstance;
}

+ (void)saveData:(id)obj cacheKey:(NSString *)key {
    [[ZCCacheManager sharedInstance].userDiskCache setObject:obj forKey:key];
}

+ (id)fetchDataForKey:(NSString *)key {
    return [[ZCCacheManager sharedInstance].userDiskCache objectForKey:key];
}
@end
