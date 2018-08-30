//
//  CertificationLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationLogicManager.h"

@implementation CertificationLogicManager

+(instancetype)shared{
    static CertificationLogicManager *logicManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logicManager = [[CertificationLogicManager alloc] init];
    });
    return logicManager;
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    vc.title = @"认证中心";
}

@end
