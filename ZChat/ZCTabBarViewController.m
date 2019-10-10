//
//  ZCTabBarViewController.m
//  ZChat
//
//  Created by XKQ on 2019/10/10.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCTabBarViewController.h"

@interface ZCTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation ZCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewContorller];
//    self.selectedViewController = [self.viewControllers objectAtIndex:XKQTabBarControllerHome];
}

#pragma mark - 添加子控制器
- (void)addChildViewContorller {
    NSArray *childArray = @[
                            @{ZCClassKey  : @"ZCHomeViewController",
                              ZCTitleKey  : @"首页",
                              ZCImageKey  : @"tabr_02_up"},
                            
                            @{ZCClassKey  : @"XKQHomeViewController",
                              ZCTitleKey  : @"首页",
                              ZCImageKey  : @"tabr_02_up"},
                            
                            ];
//    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        UIViewController *vc = [NSClassFromString(dict[MallClassKey]) new];
//        DCNavigationController *nav = [[DCNavigationController alloc] initWithRootViewController:vc];
//        UITabBarItem *item = nav.tabBarItem;
//        item.image = [UIImage imageNamed:dict[MallImgKey]];
//        item.selectedImage = [[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);//（当只有图片的时候）需要自动调整
//        [self addChildViewController:nav];
//
//        // 添加tabBarItem至数组
//        [self.tabBarItems addObject:vc.tabBarItem];
//    }];
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
