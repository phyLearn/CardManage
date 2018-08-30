//
//  appRoute+CertificationRoute.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "appRoute.h"

@interface appRoute (CertificationRoute)

/**进入认证中心  param:需要传入的数据 belongVC:所属控制器*/
- (void)routeToCertificationCenterWithParam:(NSDictionary *)dict belongVC:(UIViewController *)belongVC;

//认证中心列表跳转
- (void)routeToCertificationCenterWithTag:(NSInteger)tag belogVC:(UIViewController *)belongVC;
@end
