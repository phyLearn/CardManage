//
//  AddCardMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "AddCardMainView.h"
#import "AddCardMainCell.h"

@interface AddCardMainView()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) UITableView *addCardMainTableView;

@end
@implementation AddCardMainView

static NSString *const addCardMainCell = @"AddCardMainCell";

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.addCardMainTableView];
    }
    return self;
}

- (UITableView *)addCardMainTableView{
    if(!_addCardMainTableView){
        _addCardMainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _addCardMainTableView.delegate = self;
        _addCardMainTableView.dataSource = self;
        _addCardMainTableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        _addCardMainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_addCardMainTableView registerClass:[AddCardMainCell class] forCellReuseIdentifier:addCardMainCell];
    }
    return _addCardMainTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}

#pragma mark-cell的复用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddCardMainCell *cell = [tableView dequeueReusableCellWithIdentifier:addCardMainCell];
    return cell;
}
@end
