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
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@", @"5b87eedc"];
    [IFlySpeechUtility createUtility:initString];
}

@end
