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

- (void)viewDidLoad {
    [super viewDidLoad];
    //需要隐藏导航栏
    self.navigationController.delegate = (id)self;
    [[myLogicManager shared] startLogicManagerWithViewController:self];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[appRoute shared] loginAbountWithVC:self Complete:nil];
}

@end
