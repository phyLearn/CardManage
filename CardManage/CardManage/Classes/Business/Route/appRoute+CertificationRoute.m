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
    CertificationCenterViewController *centerVC = [[CertificationCenterViewController alloc] init];
    centerVC.inputParamsDict = @{};
    [belongVC.navigationController pushViewController:centerVC animated:YES];
}

- (void)routeToCertificationCenterWithTag:(NSInteger)tag belogVC:(UIViewController *)belongVC{
    switch (tag) {
        case 0:
        {
            HYLog(@"身份认证");
        }
            break;
        case 1:
        {
            HYLog(@"紧急联系人");
        }
            break;
        case 2:
        {
            HYLog(@"收款银行卡");
        }
            break;
        case 3:
        {
            HYLog(@"手机运营商");
        }
            break;
        case 4:
        {
            HYLog(@"工作信息");
        }
            break;
        case 5:
        {
            HYLog(@"支付宝认证");
        }
            break;
        case 6:
        {
            HYLog(@"社交信息");
        }
            break;
        case 7:
        {
            HYLog(@"芝麻信用");
        }
            break;
        case 8:
        {
            HYLog(@"京东认证");
        }
            break;
        case 9:
        {
            HYLog(@"淘宝认证");
        }
            break;
        default:
            break;
    }
}

@end
