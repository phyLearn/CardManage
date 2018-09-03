//
//  JobNewsLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "JobNewsLogicManager.h"
#import "JobNewsImport.h"

@implementation JobNewsLogicManager

+(instancetype)shared{
    static JobNewsLogicManager *logicManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logicManager = [[JobNewsLogicManager alloc] init];
    });
    return logicManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    vc.title = @"工作信息";
    JobNewsMainView *jobNewView = [[JobNewsMainView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, AppScreenHeight)];
    [vc.view addSubview:jobNewView];
}

@end
