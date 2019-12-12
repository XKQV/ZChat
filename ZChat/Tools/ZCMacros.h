//
//  ZCMacros.h
//  ZChat
//
//  Created by XKQ on 2019/10/10.
//  Copyright © 2019 XKQ. All rights reserved.
//
#import <UIKit/UIKit.h>
/** 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;



/******************    TabBar          *************/
#define ZCClassKey            @"ZCClassKey"
#define ZCTitleKey            @"ZCTitleKey"
#define ZCImageKey            @"ZCTitleKey"
#define ZCSelectedImgageKey   @"ZCSelectedImgageKey"


static inline UIImage *ZCDefaultCompanyLogo() {
    return [UIImage imageNamed:@"google"];
}
