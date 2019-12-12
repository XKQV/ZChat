//
//  ZCSearchAPI.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCSearchAPI : NSObject

- (void)getMainRecommendPersonWithHandler:(ZCReponseHandler)handler;

- (void)getSearchResultsWithKeywords:(NSString *)keywords handler:(ZCReponseHandler)handler;

@end

NS_ASSUME_NONNULL_END
