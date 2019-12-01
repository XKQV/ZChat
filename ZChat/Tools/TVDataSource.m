//
//  TVDataSource.m
//  架构设计
//
//  Created by XKQ on 2019/11/21.
//  Copyright © 2019 XKQ. All rights reserved.
//


#import "TVDataSource.h"

@interface TVDataSource ()

@property (nonatomic, copy) CellConfigure configureBlock;
@property (nonatomic, strong) CellSelected selectedBlock;
@property (nonatomic, strong) NSString *cellIdentifier;

@end


@implementation TVDataSource

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(void (^)(id _Nonnull cell, id _Nonnull model, NSIndexPath * _Nonnull indexpath))configBlock selectedBlock:(CellSelected)selectedBlock refreshBlock:(RefreshTableView)refreshBlock {
    if (self = [super init]) {
        _cellIdentifier = identifier;
        _configureBlock = [configBlock copy];
        _selectedBlock = [selectedBlock copy];
        _refreshBlock = [refreshBlock copy];
    }
    return self;
}


- (void)addDataArray:(NSArray *)datas{
    if(!datas) return;
    
    if (self.dataArray.count>0) {
        [self.dataArray removeAllObjects];
    }

    [self.dataArray addObjectsFromArray:datas];
    
}

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
    
}

- (void)refreshTableView {
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

#pragma mark UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return !self.dataArray  ? 0: self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if(self.configureBlock) {
        self.configureBlock(cell, model,indexPath);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectedBlock) {
        self.selectedBlock(indexPath);
    }
}

@end

