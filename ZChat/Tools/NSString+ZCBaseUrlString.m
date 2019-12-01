//
//  NSString+ZCBaseUrlString.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "NSString+ZCBaseUrlString.h"

@implementation NSString (ZCBaseUrlString)

+ (NSString *)baseDomain {
    return @"https://ss-sandbox.intsig.net";
}

+ (NSString *)baseImageString {
    return @"https://ssimg-pre.intsig.net/yemai/vip/camfs/qxb";
}

+ (NSString *)getURLStringWithAPIType:(ZCHttpAPIType)apiType url:(NSString *)url {
    NSString *urlString = nil;
    switch (apiType) {
        case ZDHttpAPITypeUAPI:
            urlString = [[NSUserDefaults standardUserDefaults] objectForKey:@"UAPI"];
            if (urlString == nil || [urlString length] == 0) {
                urlString = [[self baseDomain] stringByAppendingString:@"/user/"];
            }
            break;
        case ZDHttpAPITypeYAPI:
            urlString = [[NSUserDefaults standardUserDefaults] objectForKey:@"YAPI"];
            if (urlString == nil || [urlString length] == 0) {
                urlString = [[self baseDomain] stringByAppendingString:@"/yemai/"];
            }
            break;
        case ZDHttpAPITypeSAPI:
            urlString = [[NSUserDefaults standardUserDefaults] objectForKey:@"SAPI"];
            if (urlString == nil || [urlString length] == 0) {
                urlString = [[self baseDomain] stringByAppendingString:@"/search/"];
            }
            break;
        default:
            break;
    }
    urlString = [urlString stringByAppendingString:url];
    return urlString;
}

+ (NSString *)addParameter:(NSDictionary *)parameter toUrl:(NSString *)url {
    url = [url stringByAppendingString:@"?"];
    for (NSString *key in parameter) {
        url = [url stringByAppendingFormat:@"%@=%@&",key, parameter[key]];
    }
    return url;
}

- (NSString *)addParameter:(NSDictionary *)parameter {
    NSString *urlString = [self stringByAppendingString:@"?"];
    for (NSString *key in parameter) {
        urlString = [urlString stringByAppendingFormat:@"%@=%@&",key, parameter[key]];
    }
    return urlString;
}

@end
