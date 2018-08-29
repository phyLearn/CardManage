//
//  myMainView+addView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "myMainView+addView.h"
#define headHeight  160

@implementation myMainView (addView)

//添加顶部信息
- (void)addHeadView{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, -20, self.frame.size.width, headHeight);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.zPosition = -1;
    [self.myMainTableView.layer addSublayer:layer];
    
    CATextLayer *titleLayer = [CATextLayer layer];
    titleLayer.frame = CGRectMake(layer.width / 4, 30, layer.width / 2, 30);
    titleLayer.contentsScale = [UIScreen mainScreen].scale;
    titleLayer.fontSize = [UIFont systemFontOfSize:14].pointSize;
    titleLayer.foregroundColor = [UIColor whiteColor].CGColor;
    titleLayer.alignmentMode = kCAAlignmentCenter;
    titleLayer.string = @"我的";
    [layer addSublayer:titleLayer];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake((layer.size.width - 50) / 2, CGRectGetMaxY(titleLayer.frame), 50, 50);
    UIImage *iconImage = [UIImage imageNamed:@"AppIcon"];
    imageLayer.backgroundColor = [UIColor redColor].CGColor;
    imageLayer.cornerRadius = 25;
    imageLayer.masksToBounds = YES;
    imageLayer.contents = (id)iconImage.CGImage;
    [layer addSublayer:imageLayer];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(layer.width / 4, CGRectGetMaxY(imageLayer.frame) + 10, layer.width / 2, 50);
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    textLayer.fontSize = [UIFont systemFontOfSize:14].pointSize;
    textLayer.foregroundColor = [UIColor whiteColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.string = @"18711093252";
    [layer addSublayer:textLayer];
}

@end
