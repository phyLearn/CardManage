//
//  loginMainView.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
//返回按钮点击
typedef void (^backBtnClick)(void);
//登录点击
typedef void (^loginBtnClick)(NSDictionary *loginInfo);

@interface loginMainView : UIView

@property (nonatomic, copy) backBtnClick backBtnClick;
@property (nonatomic, copy) loginBtnClick loginBtnClick;

@end
