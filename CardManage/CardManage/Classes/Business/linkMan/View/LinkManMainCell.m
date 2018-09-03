//
//  LinkManMainCell.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "LinkManMainCell.h"
#import "LikeLinkManMainCell.h"

@interface LinkManMainCell()


@end
@implementation LinkManMainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self startMainView];
    }
    return self;
}

- (void)startMainView{
    self.backgroundColor = [UIColor clearColor];
    LikeLinkManMainCell *mainCell = [[NSBundle mainBundle] loadNibNamed:@"LikeLinkManMainCell" owner:self options:0][0];
    [self addSubview:mainCell];
    
    [mainCell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.top.equalTo(self);
    }];
    
    [mainCell startCellWithParam:@{
                                   @"headTitle":@"直系亲属联系人",
                                   @"firstText":@"姓名",
                                   @"secondText":@"与本人关系",
                                   @"threeText":@"紧急联系人"
                                   }];
}

@end
