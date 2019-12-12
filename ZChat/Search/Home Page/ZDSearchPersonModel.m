//
//  ZDMainRecommendModel.m
//  ZDao
//
//  Created by 汪凯 on 2017/12/7.
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#import "ZDSearchPersonModel.h"

/**
 * 人的额外数据:{"cp_id": xxx, "utype": 0,
 *             "relation_status": 0,
 *             "status": 0,
 *             "cc_white_flag": 1}
 */
static NSString *const ZDMainRecmdPersonType = @"person";

static NSString *const ZDMainRecmdRelationTagType = @"relation_tag";

@implementation ZDSearchPersonModel

#pragma mark - Public Methods

- (NSNumber *)last_active {
    return [NSNumber numberWithLongLong:[self.data[@"last_active"] longLongValue]];
}

- (NSString *)last_active_text {
    return self.data[@"last_active_text"];
}


- (BOOL)isAuth {
    return (int)[self.data objectForKey:@"auth_flag"] == 1;
}

- (BOOL)isOnline {
    return (int)[self.data objectForKey:@"online_flag"] == 1;
}

- (BOOL)isVip {
    return (int)[self.data objectForKey:@"vip_flag"] == 1;
}


- (NSString *)senior_manage {
    return [self.data objectForKey:@"senior_manage"];
}

- (NSString *)industry_id {
    return self.data[@"industry_id"];
}

- (NSArray<NSDictionary *> *)relation_tags {
    return self.data[@"relation_tag"];
}

- (NSString *)connectionNotCompressNote {
    return self.connectionInfo[@"title"];
}

+ (instancetype)yy_modelWithDictionary:(NSDictionary *)dictionary {
    ZDSearchPersonModel *model = [super yy_modelWithDictionary: dictionary];
    model.data = dictionary;
    return model;
}

#pragma mark - YYModel Mapping Methods

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"relationStatus": @"relation_status",
             @"recmdPersonCount": @"recmd_person_count",
             @"actionUrl": @"action_url",
             @"actionTitle": @"action_title",
             @"company": @[@"company", @"company_name"],
             @"data": @"other_data",
             @"recmdTitle": @"recmd_title",
             @"subTitle": @"sub_title",
             @"vipFlag": @"vip_flag",
             @"authFlag": @"auth_flag",
             @"recmdCompanyInfo": @"recmd_company_info",
             @"company": @[@"company", @"cname"],
             @"connectionInfo": @"connection_renmai_info",
             @"recmdTags": @"tags",
             @"connectionStatus": @"is_contact",
             @"avatar" : @"logo",
             @"cid" : @"id",
             };
}


@end
