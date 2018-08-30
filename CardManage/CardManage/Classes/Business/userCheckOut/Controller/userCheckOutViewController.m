//
//  userCheckOutViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "userCheckOutViewController.h"
#import "userCheckOutImport.h"

@interface userCheckOutViewController ()

@end

@implementation userCheckOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[userCheckOutLogicManager shared] startLogicManagerWithViewController:self];
    [[userCheckOutLogicManager shared] registerObserWithDele:self];
}

//人脸识别点击事件
- (void)faceBtnAction{
    [[appRoute shared] routeToFaceCheckWithBelongVC:self];
}

- (void)dealloc{
    [[userCheckOutLogicManager shared] removeAllObserWithDele:self];
}

@end
