//
//  JobNewsViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "JobNewsViewController.h"
#import "JobNewsImport.h"

@interface JobNewsViewController ()

@end

@implementation JobNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[JobNewsLogicManager shared] startLogicManagerWithViewController:self];
}

@end
