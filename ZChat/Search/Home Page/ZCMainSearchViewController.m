//
//  ZCMainSearchViewController.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCMainSearchViewController.h"
#import "ZCSearchViewController.h"
#import "ZCMainSearchTableView.h"

@interface ZCMainSearchViewController ()

@property (nonatomic, strong) UIView *searchBarView;
@property (nonatomic, strong) ZCMainSearchTableView *tableView;

@end

@implementation ZCMainSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.searchController = [[ZCSearchViewController alloc] init];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    self.tableView = [[ZCMainSearchTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (UIView *)searchBarView {
    if (!_searchBarView) {
        ZCSearchViewController *searchViewController = [[ZCSearchViewController alloc] init];
        _searchBarView = searchViewController.searchBar;
        _searchBarView.tintColor = [UIColor clearColor];
        _searchBarView.userInteractionEnabled = YES;
    }
    return _searchBarView;
}

@end
