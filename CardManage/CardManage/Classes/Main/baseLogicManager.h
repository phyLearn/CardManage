//
//  baseLoginManager.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baseLogicManager : NSObject

//所属控制器
@property (nonatomic, strong) UIViewController *belongVC;

//新建对象
+(instancetype)shared;

//开始方法
- (void)startLogicManagerWithViewController:(UIViewController *)vc;
@end
