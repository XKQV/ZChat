//
//  ZCSearchAPI.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCSearchAPI.h"

@implementation ZCSearchAPI

- (void)getMainRecommendPersonWithHandler:(ZCReponseHandler)handler {
    NSString *url = [NSString getURLStringWithAPIType:ZDHttpAPITypeYAPI url:@"homepage/recmd_person"];
    NSDictionary *tokenDict = [ZCOwnerInfoManager requestTokenDict];
    url = [url addParameter:tokenDict];
    [ZCNetworkRequest getRequestWithUrlString:url withResponseHandler:^(NSDictionary * _Nonnull data, NSError * _Nonnull error) {
        if (data && !error) {
            if (handler) {
                handler(data, error);
            }
        }
    }];
    
}

@end
