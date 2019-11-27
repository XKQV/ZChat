//
//  ZCMainSearchTableViewCell.h
//  ZChat
//
//  Created by 董志玮 on 2019/11/26.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import "ZCBaseTableViewCell.h"
#import "ZCPresentorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZCMainSearchTableViewCell : ZCBaseTableViewCell

@property (nonatomic,weak) id<ZCPresentorProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
