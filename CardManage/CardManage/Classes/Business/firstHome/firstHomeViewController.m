//
//  firstHomeViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/6/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "firstHomeViewController.h"
#import "loginMainViewController.h"
#import "HeadMainBtnView.h"

@interface firstHomeViewController ()

@property (nonatomic, strong) HeadMainBtnView *mainBtnView;
@property (nonatomic, strong) HeadMainBtnView *headMainBtnView;

@end

@implementation firstHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    loginMainViewController *login = [[loginMainViewController alloc] init];
//    [self.navigationController pushViewController:login animated:YES];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = (id)self;
}

#pragma mark --- UITableViewDelegate ---
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 200;
    }else{
        return 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        tableView.tableHeaderView = _mainBtnView;
        return _mainBtnView;
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tipCellIdentifier = @"tipCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tipCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:tipCellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)fastPayment{
    NSLog(@"点击了快速还款");
}

-(void)perfectPayment{
    NSLog(@"点击了完美还款");
}

-(void)creditCard{
    NSLog(@"点击了信用卡");
}

-(void)byMyself{
    NSLog(@"点击了自己借");
}

-(HeadMainBtnView *)mainBtnView{
    if (_mainBtnView) {
        _mainBtnView = [[HeadMainBtnView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, 200) place:@"center"];
        __weak typeof(self) weakSelf = self;
        _mainBtnView.mainBtnActionBlock = ^(NSString *selector){
            if([weakSelf respondsToSelector:NSSelectorFromString(selector)]){
                [weakSelf performSelector:NSSelectorFromString(selector) withObject:nil];
            }
        };
    }
    return _mainBtnView;
}

-(HeadMainBtnView *)headMainBtnView{
    if (_headMainBtnView) {
        _headMainBtnView = [[HeadMainBtnView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, 200) place:@"center"];
        __weak typeof(self) weakSelf = self;
        _headMainBtnView.mainBtnActionBlock = ^(NSString *selector){
            if([weakSelf respondsToSelector:NSSelectorFromString(selector)]){
                [weakSelf performSelector:NSSelectorFromString(selector) withObject:nil];
            }
        };
    }
    return _headMainBtnView;
}

@end
