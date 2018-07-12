//
//  updownView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/7/6.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "updownView.h"


@implementation updownView

- (id)initWithFrame:(CGRect)frame withInfoDict:(NSDictionary *)infoDict{
    self = [super initWithFrame:frame];
    if(self){
        NSString *imageName = infoDict[@"imageName"];
    }
    return self;
}

//添加头部btn
- (void)addUpView{
    CGFloat width = self.frame.size.width * 0.5;
    CGFloat heihgt = width;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(width * 0.5, 0, width, heihgt);
    [self addSubview:btn];
    [self addDownViewWithUpFrame:btn.frame];
}

//添加底部label
- (void)addDownViewWithUpFrame:(CGRect)frame{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height - frame.size.height;
    UILabel *bottomLable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(frame), width, height)];
    [self addSubview:bottomLable];
}

@end
