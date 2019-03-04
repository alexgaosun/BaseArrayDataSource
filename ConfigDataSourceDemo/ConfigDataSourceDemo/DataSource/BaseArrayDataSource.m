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
- (instancetype)init {
    return  nil;
}

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

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_itemSections) {
        NSArray *itemSection = _itemSections[indexPath.section];
        return itemSection[(NSUInteger) indexPath.row];
    }else{
        return self.items[(NSUInteger) indexPath.row];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_itemSections.count) {
        return _itemSections.count;
    }else{
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_itemSections) {
        if (_itemSections.count) {
            NSArray *itemSection = _itemSections[section];
            return itemSection.count;
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
