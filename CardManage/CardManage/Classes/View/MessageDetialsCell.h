//
//  MessageDetialsCell.h
//  CardManage
//
//  Created by shanbao on 2018/7/10.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageDetialsModel.h"

@interface MessageDetialsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *messageDetailsLab;

-(void)showViewWithModelData:(MessageDetialsModel *)dataModel;//初始化视图

@end
