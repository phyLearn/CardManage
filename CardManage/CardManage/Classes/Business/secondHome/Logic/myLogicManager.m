//
//  myLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "myLogicManager.h"
#import "myImport.h"

@implementation myLogicManager

+(instancetype)shared{
    static myLogicManager *myManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myManager = [[myLogicManager alloc] init];
    });
    return myManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    myMainView *mainView = [[myMainView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, AppScreenHeight-kTabBarHeight)];
    [mainView addHeadView];
    [vc.view addSubview:mainView];
}

@end
