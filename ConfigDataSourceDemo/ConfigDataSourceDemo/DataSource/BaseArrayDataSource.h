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
typedef void (^TableViewCellConfigureBlock)(id cell, id item);
//获取Cell类型的Block 在Controller下完成
typedef NSInteger (^GetCellTypeBlock)(id item);
/*
 GetCellTypeBlock getCellBlock = ^NSInteger(id  _Nonnull item) {
 NSLog(@"根据业务模型判断Cell样式");
 return 0;
 };
 */
@interface BaseArrayDataSource : NSObject<UITableViewDataSource>
/*
 items为独立数组，此项可为默认无对象数组
 */
- (id)initWithItems:(NSArray *)items
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)initWithItemSections:(NSArray *)itemSections
    configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;






@end

NS_ASSUME_NONNULL_END
