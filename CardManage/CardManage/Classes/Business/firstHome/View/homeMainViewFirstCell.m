//
//  homeMainViewFirstCell.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeMainViewFirstCell.h"
@interface homeMainViewFirstCell()

@property (weak, nonatomic) IBOutlet UIView *backgroundMainView;

@end
@implementation homeMainViewFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundMainView.layer.cornerRadius = 10;
}

@end
