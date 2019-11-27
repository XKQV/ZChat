//
//  NSString+ZCBaseUrlString.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZCHttpAPIType) {
    ZDHttpAPITypeUAPI = 0,
    ZDHttpAPITypeYAPI,
    ZDHttpAPITypeSAPI,
};

@interface NSString (ZCBaseUrlString)

+ (NSString *)getURLStringWithAPIType:(ZCHttpAPIType)apiType url:(NSString *)url;

+ (NSString *)addParameter:(NSDictionary *)parameter toUrl:(NSString *)url;

- (NSString *)addParameter:(NSDictionary *)parameter;

@end

NS_ASSUME_NONNULL_END
