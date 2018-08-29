//
//  UIMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeMainView.h"
#import "homeMainViewSecondCell.h"
#import "homeMainViewFirstCell.h"

@interface homeMainView()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@end
@implementation homeMainView

static NSString * const firstCellIdentify = @"homeMainViewFirstCell";
static NSString * const secondCellIdentify = @"homeMainViewSecondCell";

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //整体接口应该是一个tableview然后增加一个layer作为底，这样就有一个插入的效果
        [self addSubview:self.homeMainTableView];
    }
    return self;
}

//初始化tableview
- (UITableView *)homeMainTableView{
    if(!_homeMainTableView){
        _homeMainTableView = [[UITableView alloc] initWithFrame:self.frame];
        _homeMainTableView.delegate = self;
        _homeMainTableView.dataSource = self;
        _homeMainTableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        _homeMainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_homeMainTableView registerNib:[UINib nibWithNibName:firstCellIdentify bundle:nil] forCellReuseIdentifier:firstCellIdentify];
        [_homeMainTableView registerNib:[UINib nibWithNibName:secondCellIdentify bundle:nil] forCellReuseIdentifier:secondCellIdentify];
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
        headView.backgroundColor = [UIColor clearColor];
        _homeMainTableView.tableHeaderView = headView;
    }
    return _homeMainTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 200;
            break;
        case 1:
            return 250;
            break;
        default:
            return 200;
            break;
    }
}

#pragma mark-cell的复用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            homeMainViewFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:firstCellIdentify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            }
            break;
        case 1:{
            homeMainViewSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:secondCellIdentify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        default:{
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            return cell;
        }
            break;
    }
}
@end
