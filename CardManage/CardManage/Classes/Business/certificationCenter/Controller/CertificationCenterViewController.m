//
//  CertificationCenterViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationCenterViewController.h"

@interface CertificationCenterViewController ()

@end

@implementation CertificationCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[CertificationLogicManager shared] startLogicManagerWithViewController:self];
    [[CertificationLogicManager shared] registerObserWithDele:self];
}

- (void)certificationRowAction:(NSNotification *)noti{
    NSDictionary *userInfo = noti.object;
    //开始跳转
    [[appRoute shared] routeToCertificationCenterWithTag:[userInfo[@"cerTag"] integerValue] belogVC:self];
}

- (void)dealloc{
    [[CertificationLogicManager shared] removeAllObserWithDele:self];
}

@end
