//
//  ViewController.m
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/2/28.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TestOneCell.h"
#import "TestTwoCell.h"
#import "BaseArrayDataSource.h"
#import "TestModel.h"
@interface ViewController ()
@property(nonatomic, strong) NSMutableArray * arr;/**< array */
@property(nonatomic, strong) BaseArrayDataSource* dateSource;/**< dataSource */
@property (nonatomic, strong) NSMutableArray *cellIdentifiers;  // cell样式标示
@end

@implementation ViewController
#pragma mark - Live Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.rowHeight = 200;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    // cell复用设置
    _cellIdentifiers = [[NSMutableArray alloc] init];
    [_cellIdentifiers addObject:NSStringFromClass([TestOneCell class])];
    [tableView registerClass:[TestOneCell class] forCellReuseIdentifier:NSStringFromClass([TestOneCell class])];
    
    [_cellIdentifiers addObject:NSStringFromClass([TestTwoCell class])];
    [tableView registerClass:[TestTwoCell class] forCellReuseIdentifier:NSStringFromClass([TestTwoCell class])];

    TableViewCellConfigureBlock configureCell =^(UITableViewCell *cell, id item) {
        
    };
    self.dateSource  = [[BaseArrayDataSource alloc] initWithItems:self.arr cellIdentifiers:_cellIdentifiers configureCellBlock:configureCell];
    tableView.dataSource = self.dateSource;
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - Getter And Setter Method
- (NSArray *)arr {
    
    if (!_arr) {
        _arr = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            TestModel *tmpModel = [TestModel new];
            tmpModel.type = i;
            [_arr addObject:tmpModel];
        }
    }
    return _arr;
}
#pragma mark - Public Method
#pragma mark - Private Method
#pragma mark - Delegate
#pragma mark - Dealloc
@end
