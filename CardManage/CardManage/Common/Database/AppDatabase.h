//
//  AppDatabase.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/29.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDatabase : NSObject

/**存储用户登录信息 mobile:用户表名 infoDict:需要存储的信息*/
+ (void)saveUserLoginInfo:(NSDictionary *)infoDict;
+ (void)islogin:(void(^)(BOOL isLogin))complete;

@end
