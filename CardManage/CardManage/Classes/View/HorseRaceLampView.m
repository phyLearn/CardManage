//
//  HorseRaceLampView.m
//  CardManage
//
//  Created by shanbao on 2018/7/9.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "HorseRaceLampView.h"

@implementation HorseRaceLampView{
    UILabel * messageLab;
    /** 控制跑马灯的timer */
    CADisplayLink * displayLink;
    NSInteger count;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // UI搭建
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    self.clipsToBounds = YES;
    
    UILabel * titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, self.frame.size.height)];
    titleLab.text = @"消息";
    [titleLab setFont:[UIFont boldSystemFontOfSize:15]];
    titleLab.textColor = [UIColor whiteColor];
    [titleLab setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLab];
    
    UIView * messageView = [[UIView alloc] initWithFrame:CGRectMake(80, 0, self.frame.size.width - 100, self.frame.size.height)];
    messageView.clipsToBounds = YES;
    [self addSubview:messageView];
    
    messageLab = [[UILabel alloc] initWithFrame:messageView.bounds];
    messageLab.textColor = [UIColor whiteColor];
    messageLab.font = [UIFont systemFontOfSize:15];
    [messageView addSubview:messageLab];
    
    
}

#pragma mark - 赋值跑马灯文本数组
/** 赋值跑马灯文本数组 */
- (void)setMessageTextArr:(NSArray *)messageTextArr {
    _messageTextArr = messageTextArr;
    
    // 默认展示第一条
    [self setMessageText:_messageTextArr.firstObject];
    // 从最右边开始移动
    messageLab.x = messageLab.superview.width;
    
    if (displayLink) {
        [displayLink invalidate];
        displayLink = nil;
    }
    
    count = 0;
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refreshMarqueeLabelFrame)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

/** 改变label位置 */
- (void)refreshMarqueeLabelFrame {
    messageLab.x -= 1;
    if (messageLab.x <= 0) { // 当前信息跑完
        count ++;
        messageLab.x = self.width - 140; // 回到最右边
        [self setMessageText:_messageTextArr[count % self.messageTextArr.count]];
    }
}

/** 赋值跑马灯文本 */
- (void)setMessageText:(NSString *)messageText {
    messageLab.text = messageText;
    [messageLab sizeToFit];
    messageLab.centerY = self.height / 2;
}

@end
