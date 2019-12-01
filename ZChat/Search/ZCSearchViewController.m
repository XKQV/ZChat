//
//  ZCSearchViewController.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/14.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCSearchViewController.h"

@interface ZCSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchControllerDelegate>

// 全部的数据源数组
@property (strong, nonatomic) NSArray *dataArr;
// 搜索结果的数据源数组:搜索结果在本控制器展示的时候根据searchController的激活状态判断展示此数组还是dataArr数组
@property (strong, nonatomic) NSMutableArray *resultArrM;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UISearchController *searchController;

// 也可以将搜索结果传递到一个单独的控制器展示
//@property (strong, nonatomic) ResultViewController *resultVC;

@end

@implementation ZCSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    self.dataArr = @[@"hi", @"hi", @"hi", @"hi",];
}

- (void)configureUI {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.searchController.searchBar.frame = CGRectMake(0, 0, kScreenWidth, 44);
}

- (UISearchController *)searchController{
    if (!_searchController) {
        /*
         初始化的时候可以选择搜索结果展示在哪个控制器。
         1、可以传nil，展示在当前控制器，根据searchController.isActive判断，如果是激活状态就使用搜索结果数组作为数据源，否则用全部数的数组作为数据源
         2、也可以单独创建一个控制器作为搜索结果的展示界面，将搜索结果传递到展示的控制器进行展示和数据操作等
         */
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.delegate = self;
        self.definesPresentationContext = YES;
        // 是否添加半透明覆盖
        _searchController.obscuresBackgroundDuringPresentation = YES;
        // 是否隐藏导航栏
        _searchController.hidesNavigationBarDuringPresentation = YES;

        // 可以通过此种方式修改searchBar的背景颜色
        /*
        _searchController.searchBar.barTintColor = [UIColor redColor];
        UIImageView *barImageView = [[[_searchController.searchBar.subviews firstObject] subviews] firstObject];
        barImageView.layer.borderColor = [UIColor redColor].CGColor;
        barImageView.layer.borderWidth = 1;
        */

        // 可以通过此种方式可以拿到搜索框，修改搜索框的样式
        /*
        UITextField *searchField = [[[_searchController.searchBar.subviews firstObject] subviews]lastObject];
        searchField.backgroundColor = [UIColor yellowColor];
        searchField.placeholder = @"请输入搜索内容";
        */


        // kvc设置取消按钮样式
        /*
        _searchController.searchBar.showsCancelButton = YES;
        UIButton *canceLBtn = [_searchController.searchBar valueForKey:@"cancelButton"];
        [canceLBtn setTitle:@"取消" forState:UIControlStateNormal];
        [canceLBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        */

        /*
        // 通过遍历子控件也可以拿到取消按钮，设置其样式
        // 设置取消按钮开始的时候就展示出来，而不是在搜索的时候才出来
        _searchController.searchBar.showsCancelButton = YES;
        UIView * view = _searchController.searchBar.subviews[0];
        for (UIView *subView in view.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *cancelBtn = (UIButton *)subView;
                [cancelBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
                [cancelBtn setTitle:@"哈哈" forState:UIControlStateNormal];
            }
        }
         */

    }
    return _searchController;
}

// 开始进行搜索
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{

    [self.resultArrM removeAllObjects];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",searchController.searchBar.text];
    self.resultArrM = [NSMutableArray arrayWithArray:[self.dataArr filteredArrayUsingPredicate:predicate]];

//    // 将关键词传入结果控制器可以在展示的时候通过富文本将关键词变成特别的样式
//    self.resultVC.keyWord = searchController.searchBar.text;
//    self.resultVC.resultArr = self.resultArrM.copy;

    // 如果展示在当前控制器则刷新界面
    [self.tableView reloadData];
}

- (void)willPresentSearchController:(UISearchController *)searchController{
    NSLog(@"SearchController即将present");
}
- (void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"SearchController已经present完成");
}
- (void)willDismissSearchController:(UISearchController *)searchController{
    NSLog(@"SearchController即将Dismiss");
}
- (void)didDismissSearchController:(UISearchController *)searchController{
    NSLog(@"SearchController已经Dismiss完成");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.searchController.isActive ? self.resultArrM.count : self.dataArr.count;
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 如果将搜索结果展示当前界面可以根据searchController是激活状态来判断展示结果
    if (self.searchController.isActive) {
        cell.textLabel.text = self.resultArrM[indexPath.row];
    }else{
        cell.textLabel.text = self.dataArr[indexPath.row];
    }

    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
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
