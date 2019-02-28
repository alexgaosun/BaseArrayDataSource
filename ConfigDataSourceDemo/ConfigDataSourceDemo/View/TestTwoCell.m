//
//  TestTwoCell.m
//  ConfigDataSourceDemo
//
//  Created by 高莹莹 on 2019/2/28.
//  Copyright © 2019年 高莹莹. All rights reserved.
//

#import "TestTwoCell.h"
#import "Masonry.h"
#import "TestModel.h"
@implementation TestTwoCell

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
- (void)initView
{
    UIImageView *bigImgView = [UIImageView new];
    bigImgView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:bigImgView];
    [bigImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
    }];
    
}
- (void)setModel:(id)model
{
    if ([model isKindOfClass:[TestModel class]]) {
        
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
