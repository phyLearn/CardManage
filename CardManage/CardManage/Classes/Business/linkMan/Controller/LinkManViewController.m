//
//  LinkManViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/1.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "LinkManViewController.h"
#import "LinkManImport.h"

@interface LinkManViewController ()

@end

@implementation LinkManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[LinkManLogicManager shared] startLogicManagerWithViewController:self];
}

@end
