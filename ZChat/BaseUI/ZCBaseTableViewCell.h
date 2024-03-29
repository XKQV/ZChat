//
//  ZCBaseTableViewCell.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZCBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *positionCompanyLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

NS_ASSUME_NONNULL_END
