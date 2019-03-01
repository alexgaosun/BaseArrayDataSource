//
//  TestModel.m
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/2/28.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import "TestModel.h"
#import "TestOneCell.h"
#import "TestTwoCell.h"
@implementation TestModel
- (Class)configCellTypeModel:(id)model 
{//通过业务逻辑判断代码，区分Cell类型
    if ([model isKindOfClass:[TestModel class]]) {
        TestModel *tmpModel = model;
        if (tmpModel.type % 2 == 0) {
            return [TestOneCell class];
        }else{
            return [TestTwoCell class];
        }
        
    }
    return nil;
}
@end
