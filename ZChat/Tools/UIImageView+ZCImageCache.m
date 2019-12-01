//
//  UIImageView+ZCImageCache.m
//  ZChat
//
//  Created by 董志玮 on 2019/11/27.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "UIImageView+ZCImageCache.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (ZCImageCache)

- (void)zc_setImageWithURLString:(NSString *)urlString {
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@%@",[NSString baseImageString], urlString, @".t190u"]];
    NSString *cacheString = [[SDWebImageManager sharedManager] cacheKeyForURL:imageUrl];
//    UIImage *
    
    [self sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"google"]];
}

@end
