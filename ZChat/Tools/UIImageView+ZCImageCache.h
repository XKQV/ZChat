//
//  UIImageView+ZCImageCache.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/27.
//  Copyright © 2019 XKQ. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ZCImageCache)

- (void)zc_setImageWithURLString:(NSString *)urlString;
    
@end

NS_ASSUME_NONNULL_END
