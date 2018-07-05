//
//  HeadMainBtnView.h
//  CardManage
//
//  Created by shanbao on 2018/7/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

//判断iponeX的不同逻辑
#define HeadViewHeight ({\
int tmp = 0;\
if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {\
if (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)) {\
tmp = [UIScreen mainScreen].bounds.size.height * 0.125;\
}else{\
tmp = [UIScreen mainScreen].bounds.size.height * 0.110;\
}\
}else{\
tmp = [UIScreen mainScreen].bounds.size.height * 0.110;\
}\
tmp;\
})

typedef void (^mainBtnActionBlock)(NSString *selector);

@interface HeadMainBtnView : UIView

/** 用于跳转 */
@property (nonatomic, copy) mainBtnActionBlock mainBtnActionBlock;

- (id)initWithFrame:(CGRect)frame place:(NSString *)place;

@end
