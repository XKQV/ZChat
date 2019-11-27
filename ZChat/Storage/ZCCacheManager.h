//
//  ZCCacheManager.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/27.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCCacheManager : NSObject

+ (instancetype)sharedInstance;

+ (void)saveData:(id)obj cacheKey:(NSString *)key;

+ (id)fetchDataForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
