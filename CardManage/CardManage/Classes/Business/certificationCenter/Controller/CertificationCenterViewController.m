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
}

@end
