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
@property (nonatomic, assign) CGFloat headViewHeight;

@end

@implementation firstHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    loginMainViewController *login = [[loginMainViewController alloc] init];
//    [self.navigationController pushViewController:login animated:YES];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.headViewHeight = HeadViewHeight;
    [self.view addSubview:self.headMainBtnView];
    
    UIButton * billBtn = [[UIButton alloc] initWithFrame:CGRectMake(AppScreenWidth - 80, 0, 80, HeadViewHeight)];
    [billBtn setTitle:@"账单" forState:UIControlStateNormal];
    [billBtn addTarget:self action:@selector(billAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:billBtn];
    
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


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        tableView.tableHeaderView = self.mainBtnView;
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

//快速还款
-(void)fastPayment{
    NSLog(@"点击了快速还款");
}

//完美还款
-(void)perfectPayment{
    NSLog(@"点击了完美还款");
}

//信用卡
-(void)creditCard{
    NSLog(@"点击了信用卡");
}

//自己借
-(void)byMyself{
    NSLog(@"点击了自己借");
}

//账单
-(void)billAction{
    NSLog(@"点击了账单");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if([scrollView isKindOfClass:[scrollView class]]){
        CGFloat offset_Y = self.mainTableView.contentOffset.y;
        NSLog(@"offset_Y:%lf",offset_Y);
        if(offset_Y > 0 && offset_Y < self.headViewHeight){
            if(offset_Y > self.headViewHeight/2){
                [self.mainTableView setContentOffset:CGPointMake(0, 200) animated:YES];
            }else{
                __weak typeof(self) weakSelf = self;
                [weakSelf.mainTableView setContentOffset:CGPointMake(0,0) animated:YES];
            }
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = self.mainTableView.contentOffset.y;
    CGFloat originY = 0;
    CGFloat otherOffsetY = 0;
    if (offsetY <= self.headViewHeight)
    {
        originY = -offsetY;
        if (offsetY < 0)
        {
            otherOffsetY = 0;
        }else{
            otherOffsetY = offsetY;
        }
    }else{
        originY = -self.headViewHeight;
        otherOffsetY = self.headViewHeight;
    }
    
    UITableView* contentView = self.mainTableView;
    CGPoint offset = CGPointMake(0, otherOffsetY);
    if ([contentView isKindOfClass:[UITableView class]])
    {
        if (contentView.contentOffset.y < self.headViewHeight || offset.y < self.headViewHeight)
        {
            self.headMainBtnView.alpha = offset.y / self.headViewHeight;
            self.mainBtnView.alpha = 1- offset.y / self.headViewHeight;
            if(self.headMainBtnView.alpha > 0){
                self.headMainBtnView.hidden = NO;
            }else{
                self.headMainBtnView.hidden = YES;
            }
            if(self.mainBtnView.alpha <= 0.1){
                self.mainBtnView.hidden = YES;
            }else{
                self.mainBtnView.hidden = NO;
            }
            [contentView setContentOffset:offset animated:NO];
            self.mainTableView.contentOffset = offset;
        }
    }

}

- (HeadMainBtnView *)mainBtnView{
    if (!_mainBtnView) {
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

- (HeadMainBtnView *)headMainBtnView{
    if (!_headMainBtnView) {
        _headMainBtnView = [[HeadMainBtnView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, self.headViewHeight) place:@" "];
        _headMainBtnView.alpha = 0;
        _headMainBtnView.hidden = YES;
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
