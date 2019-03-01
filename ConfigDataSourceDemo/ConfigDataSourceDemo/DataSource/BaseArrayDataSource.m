//
//  BaseArrayDataSource.m
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/2/28.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import "BaseArrayDataSource.h"
#import "NSObject+TableCellModeSerialize.h"
@interface BaseArrayDataSource()
@property (nonatomic, copy) NSArray *cellIdentifiers;                // 多cell样式选择
@property (nonatomic, copy) NSArray *items;

@property(nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;/**< block */
@end
@implementation BaseArrayDataSource
- (instancetype)init {
    return  nil;
}

- (id)initWithItems:(NSArray *)items
    cellIdentifiers:(NSArray *)cellIdentifiers
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock{
    
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifiers = cellIdentifiers;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return  self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(NSUInteger) indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (self.cellIdentifiers.count) {
        id item = [self itemAtIndexPath:indexPath];
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([item configCellTypeModel:item])];
        if (self.configureCellBlock) {
            self.configureCellBlock(cell, item);
        }
        
        return cell;
    }else{
        return nil;
    }
    
}
#pragma mark
@end
