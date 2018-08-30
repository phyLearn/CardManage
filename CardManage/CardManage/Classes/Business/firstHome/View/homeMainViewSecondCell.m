//
//  homeMainViewSecondCell.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeMainViewSecondCell.h"

@interface homeMainViewSecondCell()

@property (weak, nonatomic) IBOutlet UIView *backgroundMainView;

@end
@implementation homeMainViewSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundMainView.layer.cornerRadius = 10;
}

- (IBAction)estimateBtnAction:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"REGISTERESTIMATEBTN" object:nil];
}


@end
