//
//  TVDataSource.h
//  架构设计
//
//  Created by XKQ on 2019/11/21.
//  Copyright © 2019 XKQ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^CellConfigure)(id cell, id model, NSIndexPath * indexPath);
typedef void (^CellSelected)(NSIndexPath * indexPath);
typedef void (^RefreshTableView)(void);


@interface TVDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) RefreshTableView refreshBlock;

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(void (^)(id _Nonnull cell, id _Nonnull model, NSIndexPath * _Nonnull indexpath))configBlock selectedBlock:(CellSelected)selectedBlock refreshBlock:(RefreshTableView)refreshBlock;

- (void)addDataArray:(NSArray *)datas;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
