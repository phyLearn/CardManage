//
//  LinkManLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/1.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "LinkManLogicManager.h"
#import "LinkManImport.h"

@implementation LinkManLogicManager

+(instancetype)shared{
    static LinkManLogicManager *logicManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logicManager = [[LinkManLogicManager alloc] init];
    });
    return logicManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    vc.title = @"紧急联系人";
    LinkManMainView *linkManView = [[LinkManMainView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, AppScreenWidth, AppScreenHeight)];
    [vc.view addSubview:linkManView];
}

@end
