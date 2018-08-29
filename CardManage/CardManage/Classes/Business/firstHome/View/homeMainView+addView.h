//
//  homeMainView+addView.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "homeMainView.h"
#import "TXScrollLabelView.h"

@interface homeMainView (addView)
<
    TXScrollLabelViewDelegate
>
//添加跑马灯
- (void)addHeadScrollLabelView;
//添加头部视图
- (void)addTableViewHeadView;
@end
