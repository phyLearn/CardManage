//
//  CertificationMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationMainView.h"
#import "CertificationHeaderView.h"
#import "CertificationRowView.h"
#import "likeLoginBtn.h"

@implementation CertificationMainView

- (instancetype)initWithFrame:(CGRect)frame data:(NSDictionary *)inputDict{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
        [self createMainViewWithData:inputDict];
    }
    return self;
}

//创建主视图
- (void)createMainViewWithData:(NSDictionary *)dict{
    NSArray *listArr = dict[@"listArr"];
    NSInteger colCount = 3;
    CGFloat margin = 10;
    CGFloat rowWidth = (self.frame.size.width - ((colCount + 1) * margin)) / colCount;
    CGFloat rowHeight = rowWidth * 0.67;
    CGFloat headViewHeight = 50;
    
    for(NSInteger j = 0; j < listArr.count; j++){
        NSDictionary *listOneDict = listArr[j];
        CGFloat headViewY = 0;
        if(j > 0){
            headViewY = headViewHeight + (rowHeight + margin) * 3;
        }
        CGRect rect = CGRectMake(0, headViewY, self.frame.size.width, headViewHeight);
        [self createHeaderViewWithDict:listOneDict frame:rect];
        //添加子视图
        NSArray *listArr = listOneDict[@"listArr"];
        for(NSInteger i = 0; i < listArr.count; i++){
            NSInteger row = i / colCount;
            NSInteger col = i % colCount;
            
            CGFloat picX = margin + (rowWidth + margin) * col;
            CGFloat picY = rect.size.height + rect.origin.y + (rowHeight + margin) * row;
            [self createRowViewWithDict:listArr[i] frame:CGRectMake(picX, picY, rowWidth, rowHeight)];
        }
    }
    
    //添加提交审核按钮,找到最后一个子视图的位置然后添加
    UIView *lastView = self.subviews.lastObject;
    CGFloat putBtnWidth = self.frame.size.width - 20;
    CGFloat putBtnHeight = putBtnWidth * 0.14;
    likeLoginBtn *putBtn = [[likeLoginBtn alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lastView.frame) + 20, putBtnWidth, putBtnHeight)];
    [putBtn setTitle:@"提交审核" forState:UIControlStateNormal];
    [self addSubview:putBtn];
}

//添加顶部视图
- (void)createHeaderViewWithDict:(NSDictionary *)dict frame:(CGRect)rect{
    CertificationHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"CertificationHeaderView" owner:self options:0][0];
    headerView.frame = rect;
    [headerView refreshUI:dict];
    [self addSubview:headerView];
}

//添加子视图
- (void)createRowViewWithDict:(NSDictionary *)dict frame:(CGRect)rect{
    CertificationRowView *listView = [[NSBundle mainBundle] loadNibNamed:@"CertificationRowView" owner:self options:0][0];
    listView.frame = rect;
    [listView refreshUI:dict];
    [self addSubview:listView];
}
@end
