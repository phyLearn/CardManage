//
//  homeViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeViewController.h"
#import "homeImport.h"
@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //需要隐藏导航栏
    self.navigationController.delegate = (id)self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //登录成功才能继续往下走
    [[homeLogicManager shared] startLogicManagerWithViewController:self];
    [[homeLogicManager shared] registerObserWithDele:self];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //需要判断登录状态
    [[appRoute shared] loginAbountWithVC:self Complete:nil];
}

- (void)dealloc{
    [[homeLogicManager shared] removeAllObserWithDele:self];
}

#pragma mark -- 需要跳转 ---
//评估按钮点击
- (void)estimateBtnAction{
    HYLog(@"评估按钮点击");
    [[appRoute shared] routeToCertificationCenterWithParam:@{} belongVC:self];
}
@end
