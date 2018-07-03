//
//  CustomMainbBtn.m
//  CardManage
//
//  Created by shanbao on 2018/7/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CustomMainbBtn.h"

@implementation CustomMainbBtn

+ (instancetype)markButton
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 背景
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = contentRect.size.width * 0.00;
    CGFloat imageX = contentRect.size.width * 0.15;
    CGFloat imageW = contentRect.size.width * 0.7;
    CGFloat imageH = contentRect.size.height * 0.48;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * 0.53;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleX = 0;
    CGFloat titleH = contentRect.size.height * 0.3;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
