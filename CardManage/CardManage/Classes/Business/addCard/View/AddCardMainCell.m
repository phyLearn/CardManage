//
//  AddCardMainCell.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "AddCardMainCell.h"
#import "LikeLinkManMainCell.h"

@implementation AddCardMainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self startMainView];
    }
    return self;
}

- (void)startMainView{
    self.backgroundColor = [UIColor clearColor];
    LikeLinkManMainCell *mainCell = [[NSBundle mainBundle] loadNibNamed:@"LikeLinkManMainCell" owner:self options:0][0];
    [self addSubview:mainCell];
    
    [mainCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(self);
    }];
    
    [mainCell startCellWithParam:@{
                                   @"headTitle":@"添加您的银行卡用于收款",
                                   @"firstText":@"持卡人",
                                   @"secondText":@"选择银行",
                                   @"threeText":@"卡号"
                                   }];
}

@end
