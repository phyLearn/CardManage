//
//  appRoute.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RouteImport.h"

@interface appRoute : NSObject

+(instancetype)shared;

//需要判断登录状态，只有登录成功了才能继续往下走
- (void)loginAbountWithVC:(UIViewController *)vc Complete:(void(^)(void))complete;

@end
