//
//  ZCMainSearchTableView.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCMainSearchTableView.h"
#import "ZCMainSearchTableViewCell.h"
#import "ZCMainSearchPresentor.h"
#import "ZCMainSearchDataSource.h"
#import "ZDSearchPersonModel.h"

static NSString *const reuserId = @"reuserId";

@interface ZCMainSearchTableView ()<ZCPresentorProtocol>

@property (nonatomic, strong) ZCMainSearchDataSource *tableViewDataSource;
@property (nonatomic, strong) ZCMainSearchPresentor *presentor;

@end

@implementation ZCMainSearchTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    
    self.presentor = [[ZCMainSearchPresentor alloc] init];
    self.backgroundColor = [UIColor redColor];
    self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableViewDataSource = [[ZCMainSearchDataSource alloc] initWithIdentifier:reuserId configureBlock:^(ZCMainSearchTableViewCell *cell, ZDSearchPersonModel *model, NSIndexPath *indexpath) {
        cell.nameLabel.text = model.name;
        cell.positionCompanyLabel.text = [NSString stringWithFormat:@"%@ | %@", model.company, model.position];
        
    } selectedBlock:^(NSIndexPath * _Nonnull indexPath) {
    
    } refreshBlock:^{
        [self reloadData];
    }];
    
    
    self.dataSource = self.tableViewDataSource;
    self.delegate = self.tableViewDataSource;
    self.presentor.delegate = self;
    [self registerClass:[ZCMainSearchTableViewCell class] forCellReuseIdentifier:reuserId];
}

- (void)reloadUI {
    [self.tableViewDataSource addDataArray:self.presentor.recommendPersonArray];
    [self reloadData];
}
@end
