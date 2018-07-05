//
//  secondHomeViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/6/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "secondHomeViewController.h"

@interface secondHomeViewController ()

@end

@implementation secondHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = (id)self;
}

#pragma mark --- 配置相关 ---

@end
