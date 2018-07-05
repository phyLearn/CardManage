//
//  likeLoginBtn.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/7/5.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "likeLoginBtn.h"

#define commonColor [UIColor grayColor]
#define selectColor [UIColor redColor]

#define myCornerRadius 5
@implementation likeLoginBtn

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.layer.cornerRadius = myCornerRadius;
    [self setBackgroundColor:commonColor];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
}

@end
