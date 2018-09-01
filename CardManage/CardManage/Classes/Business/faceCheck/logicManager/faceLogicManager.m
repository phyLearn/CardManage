//
//  faceLogicManager.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "faceLogicManager.h"
#import "faceImport.h"

@implementation faceLogicManager

+(instancetype)shared{
    static faceLogicManager *logicManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logicManager = [[faceLogicManager alloc] init];
    });
    return logicManager;
}

//初始化科大讯飞人脸识别
- (void)startIFlyFace{
    //设置log等级，此处log为默认在app沙盒目录下的msc.log文件
    [IFlySetting setLogFile:LVL_ALL];
    //log开关
    [IFlySetting showLogcat:YES];
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [path objectAtIndex:0];
    //设置msc.log的保存路径
    [IFlySetting setLogFilePath:cachePath];
    //初始化
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@", @"5b87eedc"];
    [IFlySpeechUtility createUtility:initString];
}

//在控制器初始化整个页面
- (void)startLogicManagerWithViewController:(UIViewController *)vc{
    self.belongVC = vc;
    vc.title = @"人脸识别";
}

@end
