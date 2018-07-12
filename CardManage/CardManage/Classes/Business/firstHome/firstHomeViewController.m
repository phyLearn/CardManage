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
#import "CreditcardEvaluatCell.h"
#import "MessageCenterViewController.h"

@interface firstHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) HeadMainBtnView *mainBtnView;
@property (nonatomic, strong) HeadMainBtnView *headMainBtnView;
@property (nonatomic, assign) CGFloat headViewHeight;
@property (nonatomic, strong) NSMutableArray * messageArr;

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
<<<<<<< HEAD
=======
    
    UIButton * billBtn = [[UIButton alloc] initWithFrame:CGRectMake(AppScreenWidth - 80, 0, 80, HeadViewHeight)];
    [billBtn setTitle:@"账单" forState:UIControlStateNormal];
    [billBtn addTarget:self action:@selector(billAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:billBtn];
    
    self.mainTableView.tableHeaderView = self.mainBtnView;
    
>>>>>>> d9a54ea4555eef58208c11af67b8dfadcd883aff
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = (id)self;

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

#pragma mark --- UITableViewDelegate ---
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 120;
    }else{
        return 90;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSString * assetsIdentifer = @"CreditcardEvaluatCell";
        CreditcardEvaluatCell *cell = [tableView dequeueReusableCellWithIdentifier:assetsIdentifer];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditcardEvaluatCell"  owner:self options:nil] lastObject];
        }
        return cell;
    }else{
        static NSString *tipCellIdentifier = @"";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tipCellIdentifier];
        if (cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:tipCellIdentifier];
        }
        return cell;
    }
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

//跑马灯
-(void)horseRaceAction{
    MessageCenterViewController * ctl = [[MessageCenterViewController alloc] initWithNibName:@"MessageCenterViewController" bundle:nil];
    ctl.messageTextArr = self.messageArr;
    [self.navigationController pushViewController:ctl animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if([scrollView isKindOfClass:[scrollView class]]){
        CGFloat offset_Y = self.mainTableView.contentOffset.y;
        NSLog(@"offset_Y:%lf",offset_Y);
        if(offset_Y > 0 && offset_Y < self.headViewHeight){
            if(offset_Y > self.headViewHeight/2){
                [self.mainTableView setContentOffset:CGPointMake(0, 0) animated:YES];
            }else{
                [self.mainTableView setContentOffset:CGPointMake(0, self.headViewHeight) animated:YES];
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
        NSMutableArray * messageArr = [NSMutableArray array];
        for (NSDictionary * dic in self.messageArr) {
            if ([dic objectForKey:@"message"]) {
                [messageArr addObject:[dic objectForKey:@"message"]];
            }
        }
        _mainBtnView = [[HeadMainBtnView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, 180) place:@"center" messageArr:messageArr] ;
        __weak typeof(self) weakSelf = self;
        _mainBtnView.mainBtnActionBlock = ^(NSString *selector){
            if([weakSelf respondsToSelector:NSSelectorFromString(selector)]){
                [weakSelf performSelector:NSSelectorFromString(selector) withObject:nil];
            }
        };
        _mainBtnView.horseRaceBlock = ^(NSString *selector) {
            if([weakSelf respondsToSelector:NSSelectorFromString(selector)]){
                [weakSelf performSelector:NSSelectorFromString(selector) withObject:nil];
            }
        };
    }
    return _mainBtnView;
}

- (HeadMainBtnView *)headMainBtnView{
    if (!_headMainBtnView) {
        _headMainBtnView = [[HeadMainBtnView alloc] initWithFrame:CGRectMake(0, 0, AppScreenWidth, self.headViewHeight) place:@" " messageArr:nil];
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

- (NSMutableArray *)messageArr{
    if(!_messageArr){
        _messageArr = @[
                        @{@"time":@"2018-1-1 20:19",@"message":@"新华社北京7月10日电（记者王卓伦、赵修知）中阿合作论坛第八届部长级会议10日在人民大会堂开幕。国家主席习近平出席开幕式并发表题为《携手推进新时代中阿战略伙伴关系》的重要讲话，宣布中阿双方一致同意，建立全面合作、共同发展、面向未来的中阿战略伙伴关系。"},
                        @{@"time":@"2018-5-1 9:01",@"message":@"上午10时许，会议正式开幕。在热烈的掌声中，习近平走上讲台，发表讲话。"},
                        @{@"time":@"2018-8-1 12:09",@"message":@"增进战略互信。要坚持对话协商，坚守主权原则，倡导包容性和解，反对恐怖主义。习近平宣布，中方将设立“以产业振兴带动经济重建专项计划”，并向有关阿拉伯国家提供人道主义援助。"}
                        ];
    }
    return _messageArr;
}

@end
