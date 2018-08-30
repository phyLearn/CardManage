//
//  homeLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeLogicManager.h"
#import "homeImport.h"

@implementation homeLogicManager

+(instancetype)shared{
    static homeLogicManager *homeManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        homeManager = [[homeLogicManager alloc] init];
    });
    return homeManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    homeMainView *mainView = [[homeMainView alloc] initWithFrame:CGRectMake(0, 10, AppScreenWidth, AppScreenHeight-kTabBarHeight - 10)];
    //添加跑马灯
    [mainView addHeadScrollLabelView];
    [mainView addTableViewHeadView];
    [vc.view addSubview:mainView];
}

//注册通知
- (void)registerObserWithDele:(id)delegate{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [[NSNotificationCenter defaultCenter] addObserver:delegate selector:@selector(estimateBtnAction) name:@"REGISTERESTIMATEBTN" object:nil];
#pragma clang diagnostic pop
}

@end
