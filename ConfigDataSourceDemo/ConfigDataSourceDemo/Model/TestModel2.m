//
//  TestModel2.m
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/3/4.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import "TestModel2.h"
#import "TestOneCell.h"
#import "TestTwoCell.h"
#import "TestThreeCell.h"
@implementation TestModel2
- (Class)configCellTypeModel:(id)model
{//通过业务逻辑判断代码，区分Cell类型
    if ([model isKindOfClass:[TestModel2 class]]) {
        TestModel2 *tmpModel = model;
        if (tmpModel.type % 2 == 0) {
            return [TestOneCell class];
        }else if (tmpModel.type == 5){
            return [TestThreeCell class];
            
        }else{
            return [TestTwoCell class];
        }
        
    }
    return nil;
}
@end
