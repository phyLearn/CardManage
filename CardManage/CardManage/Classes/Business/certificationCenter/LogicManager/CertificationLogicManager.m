//
//  CertificationLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationLogicManager.h"
#import "certificationImport.h"

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
    NSDictionary *inputParamsDict = @{@"listArr":[CertificationListData getCertificationListArr]};
    CertificationMainView *certificationView = [[CertificationMainView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, AppScreenWidth, AppScreenHeight) data:inputParamsDict];
    [vc.view addSubview:certificationView];
}

//注册通知
- (void)registerObserWithDele:(id)delegate{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [[NSNotificationCenter defaultCenter] addObserver:delegate selector:@selector(certificationRowAction:) name:@"REGISTERCERROWBTN" object:nil];
#pragma clang diagnostic pop
}

@end
