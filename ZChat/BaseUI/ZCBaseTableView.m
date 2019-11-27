//
//  ZCBaseTableView.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCBaseTableView.h"

@implementation ZCBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    
}

@end
