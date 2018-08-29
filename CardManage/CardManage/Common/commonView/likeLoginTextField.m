//
//  likeLoginTextField.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "likeLoginTextField.h"

@implementation likeLoginTextField

- (void)awakeFromNib{
    [super awakeFromNib];
}

//改变字体颜色
- (void)drawPlaceholderInRect:(CGRect)rect{
    // 计算占位文字的 Size
    CGSize placeholderSize = [self.placeholder sizeWithAttributes:
                              @{NSFontAttributeName : self.font}];
    
    [self.placeholder drawInRect:CGRectMake(0, (rect.size.height - placeholderSize.height)/2, rect.size.width, rect.size.height) withAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor],
       NSFontAttributeName : self.font}];
}

@end
