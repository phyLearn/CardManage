//
//  myMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "myMainView.h"
#import "myImport.h"

@interface myMainView()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@end
@implementation myMainView

static NSString * const myMainCellIdentify = @"myMainCell";

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.myMainTableView];
    }
    return self;
}

- (UITableView *)myMainTableView{
    if(!_myMainTableView){
        _myMainTableView = [[UITableView alloc] initWithFrame:self.frame];
        _myMainTableView.delegate = self;
        _myMainTableView.dataSource = self;
        _myMainTableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        _myMainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_myMainTableView registerNib:[UINib nibWithNibName:myMainCellIdentify bundle:nil] forCellReuseIdentifier:myMainCellIdentify];
        _myMainTableView.scrollEnabled = NO;
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 120)];
        headView.backgroundColor = [UIColor clearColor];
        _myMainTableView.tableHeaderView = headView;
    }
    return _myMainTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

#pragma mark-cell的复用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myMainCell *cell = [tableView dequeueReusableCellWithIdentifier:myMainCellIdentify];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
