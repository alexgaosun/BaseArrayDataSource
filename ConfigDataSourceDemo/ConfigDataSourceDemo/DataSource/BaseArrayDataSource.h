//
//  BaseArrayDataSource.h
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/2/28.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
//配置Cell的回调
typedef void (^AlexDidSelBlock)(id obj);
typedef void (^TableViewCellConfigureBlock)(id cell, id item);
//获取Cell类型的Block 在Controller下完成
@interface BaseArrayDataSource : NSObject<UITableViewDataSource>
/*
 items为独立数组
 */
- (id)initWithItems:(NSArray *)items
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;
/*
 itemSections为多分组数组，一个controller类下可有多个数据源作为分组
 */
- (id)initWithItemSections:(NSArray *)itemSections
    configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;
@property (nonatomic, copy) AlexDidSelBlock cellSelectedBlock;   // cell点击事件
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;//通过角标获取Model
@end

NS_ASSUME_NONNULL_END
