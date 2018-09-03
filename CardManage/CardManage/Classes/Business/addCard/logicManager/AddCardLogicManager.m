//
//  AddCardLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "AddCardLogicManager.h"
#import "AddCardImport.h"

@implementation AddCardLogicManager

+(instancetype)shared{
    static AddCardLogicManager *logicManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logicManager = [[AddCardLogicManager alloc] init];
    });
    return logicManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    vc.title = @"添加银行卡";
    AddCardMainView *addCardView = [[AddCardMainView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, AppScreenWidth, AppScreenHeight)];
    [vc.view addSubview:addCardView];
}

@end
