//
//  HeadMainBtnView.h
//  CardManage
//
//  Created by shanbao on 2018/7/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^mainBtnActionBlock)(NSString *selector);

@interface HeadMainBtnView : UIView

/** 用于跳转 */
@property (nonatomic, copy) mainBtnActionBlock mainBtnActionBlock;

- (id)initWithFrame:(CGRect)frame place:(NSString *)place;

@end
