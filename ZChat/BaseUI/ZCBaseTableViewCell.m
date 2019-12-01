//
//  ZCBaseTableViewCell.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCBaseTableViewCell.h"

@interface ZCBaseTableViewCell ()


@end

@implementation ZCBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.positionCompanyLabel];
    [self.contentView addSubview:self.timeLabel];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(@15);
        make.height.width.equalTo(@44);
    }];
    self.nameLabel.text = @"1111";
    [self.nameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.leading.equalTo(self.iconImageView.mas_trailing).offset(10);
    }];
    
    self.timeLabel.text = @"1111";
    [self.timeLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top);
        make.leading.greaterThanOrEqualTo(self.nameLabel.mas_trailing).offset(5);
        make.trailing.equalTo(@-15);
    }];
    
    self.positionCompanyLabel.text = @"1111";
    [self.positionCompanyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.height.equalTo(@20);
        make.leading.equalTo(self.nameLabel.mas_leading);
        make.trailing.equalTo(@-15);
        make.bottom.equalTo(@-15);
    }];
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.layer.cornerRadius = 2;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.clipsToBounds = YES;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    }
    return _nameLabel;
}

- (UILabel *)positionCompanyLabel {
    if (!_positionCompanyLabel) {
        _positionCompanyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    }
    return _positionCompanyLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
        
    }
    return _timeLabel;
}

@end
