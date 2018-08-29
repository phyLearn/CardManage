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
    self.navigationController.delegate = (id)self;
    [[appRoute shared] loginAbountWithVC:self Complete:^{
        
    }];
}

@end
