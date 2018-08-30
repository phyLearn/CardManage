//
//  appRoute+CertificationRoute.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "appRoute+CertificationRoute.h"

@implementation appRoute (CertificationRoute)

- (void)routeToCertificationCenterWithParam:(NSDictionary *)dict belongVC:(UIViewController *)belongVC{
    //构建输入参数模型
    CertificationInputParamsModel *inputParamsModel = [[CertificationInputParamsModel alloc] init];
    CertificationCenterViewController *centerVC = [[CertificationCenterViewController alloc] init];
    centerVC.inputParamsModel = inputParamsModel;
    [belongVC.navigationController pushViewController:centerVC animated:YES];
}

@end
