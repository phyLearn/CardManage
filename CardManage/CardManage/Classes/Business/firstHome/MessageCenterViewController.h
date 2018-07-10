//
//  MessageCenterViewController.h
//  CardManage
//
//  Created by shanbao on 2018/7/10.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "AppBaseViewController.h"

@interface MessageCenterViewController : AppBaseViewController

@property (weak, nonatomic) IBOutlet UITableView *messageTableView;
/** 保存跑马灯数据数组 */
@property (nonatomic, strong) NSArray *messageTextArr;
@end
