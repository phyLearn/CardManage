//
//  CertificationHeaderView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationHeaderView.h"

@interface CertificationHeaderView()

@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
@implementation CertificationHeaderView

- (void)refreshUI:(NSDictionary *)dict{
    
    self.logoView.backgroundColor = [UIColor colorWithHexString:dict[@"color"]];
    self.titleLabel.text = dict[@"title"];
    self.descLabel.text = dict[@"desc"];
    
}

@end
