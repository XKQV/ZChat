//
//  ZCAppDelegateProtocol.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/25.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZCAppDelegateProtocol <NSObject>

- (void)execute;

@end

typedef id<ZCAppDelegateProtocol> DelegateCommand;

NS_ASSUME_NONNULL_END
