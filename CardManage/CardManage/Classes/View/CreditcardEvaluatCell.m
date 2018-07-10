//
//  CreditcardEvaluatCell.m
//  CardManage
//
//  Created by shanbao on 2018/7/7.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.

#import "CreditcardEvaluatCell.h"

@implementation CreditcardEvaluatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.cornerRadius = 10;
    self.iconImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
