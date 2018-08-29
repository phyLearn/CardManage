//
//  appRoute.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "appRoute.h"
#import "RouteImport.h"

@implementation appRoute

+(instancetype)shared{
    static appRoute *route = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        route = [[appRoute alloc] init];
    });
    return route;
}

- (void)loginAbountWithVC:(UIViewController *)vc Complete:(void(^)(void))complete{
    //判断是否登录，没有登录则需要跳转
    [AppDatabase islogin:^(BOOL isLogin) {
        if(isLogin){
            if(complete)
                complete();
            return;
        }
        //没有登录直接跳转登录页
        loginMainViewController *loginVC = [[loginMainViewController alloc] init];
        [vc presentViewController:loginVC animated:YES completion:nil];
    }];
}

@end
