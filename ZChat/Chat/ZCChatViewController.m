
//
//  ZCChatViewController.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/14.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCChatViewController.h"
#import "ZCSearchViewController.h"

@interface ZCChatViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZCChatViewController

- (void)loadView {
    [super loadView];
    self.navigationController.title = @"找到";
    self.navigationItem.searchController = [[ZCSearchViewController alloc] init];
    UIBarButtonItem *moreItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStyleDone target:self action:@selector(moreAction)];
    self.navigationItem.rightBarButtonItem = moreItem;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
     _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)moreAction {

}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//
//        _tableView.tableHeaderView = [[ZCSearchViewController alloc] init].searchBar;
    }
    return _tableView;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
