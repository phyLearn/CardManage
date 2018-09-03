//
//  LinkManMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "LinkManMainView.h"
#import "LinkManMainCell.h"

@interface LinkManMainView()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *linkManTableView;

@end
@implementation LinkManMainView

static NSString *const linkMainCell = @"LinkManMainCell";

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.linkManTableView];
    }
    return self;
}

- (UITableView *)linkManTableView{
    if(!_linkManTableView){
        _linkManTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _linkManTableView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        _linkManTableView.delegate = self;
        _linkManTableView.dataSource = self;
        _linkManTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_linkManTableView registerClass:[LinkManMainCell class] forCellReuseIdentifier:linkMainCell];
    }
    return _linkManTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}

#pragma mark-cell的复用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   LinkManMainCell *cell = [tableView dequeueReusableCellWithIdentifier:linkMainCell];
    return cell;
}
@end
