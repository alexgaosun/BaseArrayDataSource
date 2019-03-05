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
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSArray *itemSections;
@property(nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;/**< block */
@end
@implementation BaseArrayDataSource
// 初始化
- (id)initWithItems:(NSArray *)items
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock{
    
    self = [super init];
    if (self) {
        self.items = items;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return  self;
}

- (id)initWithItemSections:(NSArray *)itemSections
        configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock{
    
    self = [super init];
    if (self) {
        _itemSections= itemSections;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return  self;
}
#pragma marr getter&setter
- (void)setItems:(NSArray *)items //数据在经常变动时 及时更新
{
    _items = items;
}
- (void)setItemSections:(NSArray *)itemSections{
    _itemSections  = itemSections;
}
- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.itemSections) {
        id itemSection = self.itemSections[indexPath.section];
        if ([itemSection isKindOfClass:[NSArray class]]) {
            NSArray *itemSectionArr = itemSection;
            return itemSectionArr[indexPath.row];
        }else{
            NSArray *tmpArr = [itemSection configSectionTypeModel:itemSection];
            if (tmpArr && tmpArr.count) {
                return tmpArr[indexPath.row];
            }
            return nil;
        }
    }else{
        return self.items[indexPath.row];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_itemSections) {
        return _itemSections.count;
    }else{
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.itemSections.count) {
        if (self.itemSections.count) {
            id itemSection = self.itemSections[section];
            if ([itemSection isKindOfClass:[NSArray class]]) {
                NSArray *itemSectionArr = itemSection;
                return itemSectionArr.count;
            }else{
                NSArray *tmpArr = [itemSection configSectionTypeModel:itemSection];
                if (tmpArr && tmpArr.count) {
                    return tmpArr.count;
                }
                return 0;
            }
        }else{
            return 0;
        }
    }else{
        if (self.items) {
            return self.items.count;
        }else{
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([item configCellTypeModel:item])];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, item);
    }
    return cell;
    
}
#pragma mark
@end
