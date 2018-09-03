//
//  LikeLinkManMainCell.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikeLinkManMainCell : UIView

@property (weak, nonatomic) IBOutlet UIView *backMainView;
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet UITextField *threeTextField;

//初始化样式
- (void)startCellWithParam:(NSDictionary *)dict;

@end
