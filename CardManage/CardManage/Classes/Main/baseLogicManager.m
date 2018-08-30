//
//  baseLoginManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "baseLogicManager.h"

@implementation baseLogicManager

- (void)removeAllObserWithDele:(id)delegate{
    [[NSNotificationCenter defaultCenter] removeObserver:delegate];
}

@end
