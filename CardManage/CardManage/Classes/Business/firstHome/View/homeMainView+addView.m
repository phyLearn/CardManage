//
//  homeMainView+addView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeMainView+addView.h"

@implementation homeMainView (addView)

- (void)addHeadScrollLabelView{
    NSArray *scrollTexts = @[@"用户尾号6492刚刚卖出一部iPhoneX,获得1000元",
                             @"用户尾号3292刚刚卖出一部iPhoneX,获得1000元",
                             @"用户尾号3232刚刚卖出一部iPhoneX,获得10000元"];
    TXScrollLabelView *scrollLabelView = [TXScrollLabelView scrollWithTextArray:scrollTexts type:TXScrollLabelViewTypeFlipNoRepeat velocity:2 options:UIViewAnimationOptionLayoutSubviews inset:UIEdgeInsetsZero];
    scrollLabelView.frame = CGRectMake(0,10, AppScreenWidth, 30);
    scrollLabelView.font = [UIFont systemFontOfSize:14];
    scrollLabelView.backgroundColor = [[UIColor colorWithHexString:@"#DCDCDC"] colorWithAlphaComponent:0.5];
    [self addSubview:scrollLabelView];
    [scrollLabelView beginScrolling];
}

//添加tableview的头视图
- (void)addTableViewHeadView{
    UIImage *image = [UIImage imageNamed:@"shouxin_375x603_"];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, self.frame.size.width, 140);
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.contents = (id)image.CGImage;
    layer.zPosition = -1;
    [self.homeMainTableView.layer addSublayer:layer];
}


@end
