//
//  loginMainViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "loginMainViewController.h"
#import "loginImport.h"

@interface loginMainViewController ()

@end

@implementation loginMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //需要隐藏导航栏
    self.navigationController.delegate = (id)self;
    //开始界面
    [[loginLogicManager shared] startLogicManagerWithViewController:self];
}


@end
