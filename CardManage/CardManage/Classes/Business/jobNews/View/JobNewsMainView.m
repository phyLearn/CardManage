//
//  JobNewsMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "JobNewsMainView.h"
#import "JobNewsHeaderView.h"
#import "JobNewsBottomView.h"

@interface JobNewsMainView()

@property (nonatomic, strong) UIScrollView *backMainScrollView;

@end
@implementation JobNewsMainView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self startMainView];
    }
    return self;
}

- (void)startMainView{
    JobNewsHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"JobNewsHeaderView" owner:self options:0][0];
    headerView.frame = CGRectMake(0, 0, self.frame.size.width, 300);
    [self.backMainScrollView addSubview:headerView];
    
    JobNewsBottomView *bottomView = [[NSBundle mainBundle] loadNibNamed:@"JobNewsBottomView" owner:self options:0][0];
    bottomView.frame = CGRectMake(0, CGRectGetMaxY(headerView.frame), self.frame.size.width, 200);
    [self.backMainScrollView addSubview:bottomView];
}

- (UIScrollView *)backMainScrollView{
    if(!_backMainScrollView){
        _backMainScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _backMainScrollView.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        _backMainScrollView.contentSize = CGSizeMake(0, AppScreenHeight + 50);
        [self addSubview:_backMainScrollView];
    }
    return _backMainScrollView;
}
@end
