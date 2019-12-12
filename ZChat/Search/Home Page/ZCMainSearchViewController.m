//
//  ZCMainSearchViewController.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCMainSearchViewController.h"
#import "ZCSearchResultViewController.h"
#import "ZCMainSearchTableView.h"

@interface ZCMainSearchViewController ()

@property (nonatomic, strong) UIView *searchBarView;
@property (nonatomic, strong) ZCMainSearchTableView *tableView;

@end

@implementation ZCMainSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[ZCMainSearchTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    ZCSearchResultViewController *searchResultViewController = [[ZCSearchResultViewController alloc] init];
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultViewController];
    self.navigationItem.searchController = searchController;
    
    searchController.searchBar.placeholder = @"Search";
    searchController.searchResultsUpdater = searchResultViewController;

}

//- (UIView *)searchBarView {
//    if (!_searchBarView) {
//        ZCSearchResultViewController *searchViewController = [[ZCSearchResultViewController alloc] init];
//        _searchBarView.tintColor = [UIColor clearColor];
//        _searchBarView.userInteractionEnabled = YES;
//    }
//    return _searchBarView;
//}

@end
