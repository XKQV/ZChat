//
//  ZCMainSearchPresentor.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCMainSearchPresentor.h"
#import "ZCSearchAPI.h"
#import "ZDSearchPersonModel.h"

static const NSString *RecommendPersonCacheKey = @"RecommendPersonCacheKey";

@implementation ZCMainSearchPresentor

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadRecommandPerson) name:ZCOwnerTokenRefreshedNotification object:nil];
    }
    return self;
}

- (void)loadRecommandPerson {
    ZCSearchAPI *api = [[ZCSearchAPI alloc] init];
    [api getMainRecommendPersonWithHandler:^(id data, NSError *error) {
        self.recommendPersonArray = [NSArray yy_modelArrayWithClass:[ZDSearchPersonModel class] json:data[@"data"][@"list"]];
        if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUI)]) {
            [self.delegate reloadUI];
        }
        
    }];
}


@end
