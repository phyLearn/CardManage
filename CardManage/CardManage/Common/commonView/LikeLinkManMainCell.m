//
//  LikeLinkManMainCell.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "LikeLinkManMainCell.h"

@interface LikeLinkManMainCell()

@property (weak, nonatomic) IBOutlet UILabel *headTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;

@end
@implementation LikeLinkManMainCell

- (void)startCellWithParam:(NSDictionary *)dict{
    self.headTitleLabel.text = dict[@"headTitle"];
    self.firstLabel.text = dict[@"firstText"];
    self.secondLabel.text = dict[@"secondText"];
    self.threeLabel.text = dict[@"threeText"];
    [self aboutBackMainView];
}

//背景样式
- (void)aboutBackMainView{
    self.backMainView.layer.cornerRadius = self.backMainView.frame.size.width / 20;
    self.backMainView.layer.borderColor = [UIColor colorWithHexString:@"#F0F0F0"].CGColor;
    self.backMainView.layer.borderWidth = 1;
    self.backMainView.layer.masksToBounds = YES;
}

@end
