//
//  appRoute+userCheckOutRoute.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "appRoute.h"

@interface appRoute (userCheckOutRoute)

//跳转到面部识别页面
- (void)routeToFaceCheckWithBelongVC:(UIViewController *)belongVC;

@end
