//
//  UIViewController+ZCTopViewController.m
//  ZChat
//
//  Created by 董志玮 on 2019/12/5.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "UIViewController+ZCTopViewController.h"

@implementation UIViewController (ZCTopViewController)

+ (UIViewController *)topViewController {
    UIWindow *mainWindow = nil;
    NSArray *windowArray = [UIApplication sharedApplication].windows;
    for (UIWindow *window in windowArray) {
        if (window.windowLevel == UIWindowLevelNormal) {
            mainWindow = window;
            break;
        }
    }
    UIViewController *rootViewController = mainWindow.rootViewController;
    UIViewController *frontViewController;
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarViewController = (UITabBarController *)rootViewController;
        frontViewController = [self topViewControllerOfViewController:tabBarViewController];
    } else {
        frontViewController = [self topViewControllerOfViewController:rootViewController];
    }
    
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationViewController = (UINavigationController *)rootViewController;
        frontViewController = navigationViewController.topViewController;
    }
    return frontViewController;
}

+ (UIViewController *)topViewControllerOfViewController:(UIViewController *)parentViewController {
    if (parentViewController.presentedViewController) {
        return [self topViewControllerOfViewController:parentViewController.presentedViewController];
    } else {
        return parentViewController;
    }
}

@end
