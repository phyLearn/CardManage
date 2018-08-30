//
//  myViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "myViewController.h"
#import "myImport.h"

@interface myViewController ()

@end

@implementation myViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //需要隐藏导航栏
    self.navigationController.delegate = (id)self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[myLogicManager shared] startLogicManagerWithViewController:self];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[appRoute shared] loginAbountWithVC:self Complete:nil];
}

@end
