//
//  CertificationRowView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationRowView.h"

@interface CertificationRowView()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cerFlagLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cerLogFlagImageView;

@end
@implementation CertificationRowView

- (void)addSubview:(UIView *)view{
    [super addSubview:view];
    
    self.layer.cornerRadius = self.frame.size.height * 0.1;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rowTap)];
    [self addGestureRecognizer:tap];
}

- (void)rowTap{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"REGISTERCERROWBTN" object:@{@"cerTag":[NSString stringWithFormat:@"%ld",self.tag]}];
}

- (void)refreshUI:(NSDictionary *)dict{
    
    self.titleLabel.text = dict[@"title"];
    self.tag = [dict[@"cerTag"] integerValue];
    self.cerFlagLabel.hidden = [dict[@"cerFlag"] integerValue];//已经认证则隐藏
    self.cerLogFlagImageView.hidden = ![dict[@"cerFlag"] integerValue];//已经认证则显示
}

@end
