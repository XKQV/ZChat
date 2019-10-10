//
//  ZCMacros.h
//  ZChat
//
//  Created by XKQ on 2019/10/10.
//  Copyright © 2019 XKQ. All rights reserved.
//
/** 屏幕高度 */
#define ScreenH [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define ScreenW [UIScreen mainScreen].bounds.size.width

/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;


/******************    TabBar          *************/
#define ZCClassKey            @"rootVCClassString"
#define ZCTitleKey            @"title"
#define ZCImageKey            @"imageName"
#define ZCSelectedImgageKey   @"selectedImageName"
