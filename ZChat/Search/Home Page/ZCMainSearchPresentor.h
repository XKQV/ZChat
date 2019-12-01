//
//  ZCMainSearchPresentor.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCPresentorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^Success)(NSDictionary *dic);
typedef void(^Failure)(NSDictionary *dic);

@interface ZCMainSearchPresentor : NSObject

@property (nonatomic, strong) NSArray *recommendPersonArray;
@property (nonatomic, weak) id<ZCPresentorProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
