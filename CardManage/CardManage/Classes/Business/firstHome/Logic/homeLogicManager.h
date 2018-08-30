//
//  homeLogicManager.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "baseLogicManager.h"

@interface homeLogicManager : baseLogicManager

//注册通知
- (void)registerObserWithDele:(id)delegate;
//销毁通知
- (void)removeAllObserWithDele:(id)delegate;
@end
