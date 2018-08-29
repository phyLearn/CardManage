//
//  loginLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "loginLogicManager.h"
#import "loginImport.h"

@implementation loginLogicManager

+(instancetype)shared{
    static loginLogicManager *homeManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        homeManager = [[loginLogicManager alloc] init];
    });
    return homeManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    loginMainView *loginView = [[NSBundle mainBundle] loadNibNamed:@"loginMainView" owner:self options:0][0];
    loginView.frame = vc.view.frame;
    [vc.view addSubview:loginView];
    
    loginView.backBtnClick = ^{
        //退出控制器
        [vc dismissViewControllerAnimated:YES completion:nil];
    };
    
    loginView.loginBtnClick = ^(NSDictionary *loginInfo){
        [self loginBtnActionWithInfo:loginInfo];
    };
}

- (void)loginBtnActionWithInfo:(NSDictionary *)loginInfo{
    //将登录信息存储下来,可以以后做缓存登录，或者判断登录状态
    [AppDatabase saveUserLoginInfo:loginInfo];
    [self.belongVC dismissViewControllerAnimated:YES completion:nil];
}

@end
