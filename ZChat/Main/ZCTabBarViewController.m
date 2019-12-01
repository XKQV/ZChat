//
//  ZCTabBarViewController.m
//  ZChat
//
//  Created by XKQ on 2019/10/10.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCTabBarViewController.h"
#import "ZCNavigationController.h"

@interface ZCTabBarViewController ()<UITabBarControllerDelegate>
@end

@implementation ZCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewContorller];
    self.selectedViewController = [self.viewControllers objectAtIndex:2];

}

#pragma mark - 添加子控制器
- (void)addChildViewContorller {
    NSArray *childArray = @[
        @{ZCClassKey  : @"ZCChatViewController",
          ZCTitleKey  : @"找到",
          ZCImageKey  : @"tab"},
        @{ZCClassKey  : @"ZCChatViewController",
          ZCTitleKey  : @"电话本",
          ZCImageKey  : @"tab"},
        @{ZCClassKey  : @"ZCMainSearchViewController",
          ZCTitleKey  : @"搜索",
          ZCImageKey  : @"tab"},
        @{ZCClassKey  : @"ZCChatViewController",
          ZCTitleKey  : @"发现",
          ZCImageKey  : @"tab"},
        @{ZCClassKey  : @"ZCChatViewController",
          ZCTitleKey  : @"我",
          ZCImageKey  : @"tab"},
        
    ];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];

    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *vc = [NSClassFromString(dict[ZCClassKey]) new];
        ZCNavigationController *nav = [[ZCNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        
        item.titlePositionAdjustment = UIOffsetMake(0, -4);
        item.title = dict[ZCTitleKey];
        item.image = [UIImage imageNamed:dict[ZCImageKey]];
        item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        [self addChildViewController:nav];
    }];
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
