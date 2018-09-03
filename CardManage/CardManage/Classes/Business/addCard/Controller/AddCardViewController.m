//
//  AddCardViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "AddCardViewController.h"
#import "AddCardImport.h"

@interface AddCardViewController ()

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AddCardLogicManager shared] startLogicManagerWithViewController:self];
}

@end
