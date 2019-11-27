//
//  ZDSearchPersonModel
//  ZDao
//
//  Created by 李銮鑫 on 2019/06
//  Copyright © 2017年 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDSearchPersonModel : NSObject

#pragma mark - 通用字段
// 类型 relation_tag, person, ...
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSArray<NSString *> *images;

@property (nonatomic, assign) NSInteger utype;
// 头像
@property (nonatomic, copy) NSString *avatar;
// 姓名
@property (nonatomic, copy) NSString *name;
// 手机号
@property (nonatomic, copy) NSString *mobile;
// cp_id
@property (nonatomic, copy) NSString *cp_id;
// 公司id
@property (nonatomic, copy) NSString *cid;
// 公司名
@property (nonatomic, copy) NSString *company;
// 职位
@property (nonatomic, copy) NSString *position;
// key: value
@property (nonatomic, copy) NSArray<NSDictionary *> *highlight;
// 推荐标签
@property (nonatomic, copy) NSArray<NSString *> *recmdTitle;
// 推荐标签1
@property (nonatomic, copy) NSArray<NSString *> *recmdCompanyInfo;
// 推荐标签2
@property (nonatomic, copy) NSArray<NSString *> *recmdTags;
// 是否已被关注
@property (nonatomic, assign) BOOL relationStatus;
//认证状态
@property (nonatomic, assign) BOOL authFlag;
//vip状态
@property (nonatomic, assign) BOOL vipFlag;

/// 熟人可介绍信息
// 总体dictionary
@property (nonatomic, strong) NSDictionary *connectionInfo;
// 可介绍的人脉个数
@property (nonatomic, assign) NSInteger connectionPersonCount;
// 人脉的文案
@property (nonatomic, strong) NSString *connectionNote;
// 不会被压缩的文字
@property (nonatomic, strong) NSString *connectionNotCompressNote;

// 关注状态
@property (nonatomic, assign) NSInteger follow_status;
// 是否联系过
@property (nonatomic, assign) NSInteger connectionStatus;

// 第一行
@property (nonatomic, copy) NSString *title;
// 第二行
@property (nonatomic, copy) NSString *subTitle;
// 第三行
@property (nonatomic, copy) NSString *summary;
// 推荐类型，统计用
@property (nonatomic, copy) NSString *recmd_type;
// 推荐原因，显示用
@property (nonatomic, copy) NSString *recmd_reason;
// 是否热门用户
@property (nonatomic, strong) NSString *hot_user;
// 其他数据
@property (nonatomic, copy) NSDictionary *data;
// 统计数据
@property (nonatomic, copy) NSDictionary *logData;

#pragma mark - 人类型数据

- (NSString *) cp_id;
- (NSString *) senior_manage;
- (NSString *) last_active_text;

- (BOOL) outOfConnection;

- (BOOL)isAuth;
- (BOOL)isOnline;
- (BOOL)isVip;

// 推荐人脉用
@property (nonatomic, strong) NSNumber *last_active;
// log对应的活跃度记录
@property (nonatomic, strong) NSString *logActiveType;
// 用户是否已被关注 0/1
@property (nonatomic, assign) NSInteger relation_status;

#pragma mark - 关系标签数据

- (NSString *) industry_id;
- (NSArray<NSDictionary *> *) relation_tags;

@end
