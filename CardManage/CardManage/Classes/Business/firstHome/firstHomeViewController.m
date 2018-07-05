//
//  firstHomeViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/6/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "firstHomeViewController.h"
#import "loginMainViewController.h"

@interface firstHomeViewController ()

@end

@implementation firstHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    loginMainViewController *login = [[loginMainViewController alloc] init];
    [self.navigationController pushViewController:login animated:YES];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = (id)self;
}

@end
