//
//  TestOneCell.m
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/2/28.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import "TestOneCell.h"
#import "Masonry.h"
#import "TestModel.h"
@implementation TestOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
        
    }
    return self;
}

- (void)setModel:(id)model
{
    if ([model isKindOfClass:[TestModel class]]) {
        
    }
}
- (void)initView
{
    UIImageView *bigImgView = [UIImageView new];
    bigImgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:bigImgView];
    [bigImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
