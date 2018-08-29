//
//  MessageCenterViewController.m
//  CardManage
//
//  Created by shanbao on 2018/7/10.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "MessageCenterViewController.h"
#import "MessageDetialsModel.h"
#import "MessageDetialsCell.h"

@interface MessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * messageArr;

@end

@implementation MessageCenterViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息中心";
    self.messageTableView.delegate = self;
    self.messageTableView.dataSource = self;
    
    self.messageArr = [NSMutableArray array];
    for (NSDictionary * dic in self.messageTextArr) {
        MessageDetialsModel * data = [[MessageDetialsModel alloc] initWithDictionary:dic];
        [self.messageArr addObject:data];
    }
    
    [self.messageTableView registerNib:[UINib nibWithNibName:@"MessageDetialsCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageDetialsModel * model = _messageArr[indexPath.row];
    return model.timeLabHeight + model.messageDetailLabHeight + 20;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tipCellIdentifier = @"cell";
    MessageDetialsCell *cell = [tableView dequeueReusableCellWithIdentifier:tipCellIdentifier];
    if (cell == nil){
        cell = [[MessageDetialsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tipCellIdentifier];
    }
    MessageDetialsModel * model = self.messageArr[indexPath.row];
    cell.timeLab.frame = CGRectMake(10, 5, AppScreenWidth - 20, model.timeLabHeight);
    cell.messageDetailsLab.frame = CGRectMake(10, 10+model.timeLabHeight, AppScreenWidth - 20, model.messageDetailLabHeight);
    [cell.timeLab setText:[NSString stringWithFormat:@"%@",model.time]];
    [cell.messageDetailsLab setText:[NSString stringWithFormat:@"%@",model.messageDetail]];
    
    return cell;
}



@end
