//
//  NSObject+TableCellModeSerialize.h
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/3/1.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TableCellModeSerialize)
- (Class)configCellTypeModel:(id)model;//在和Cell匹配的，Model类中重写此方法,加入业务逻辑
@end

NS_ASSUME_NONNULL_END
