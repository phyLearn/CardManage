//
//  appAppearInfo.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/7/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "appAppearInfo.h"

@implementation appAppearInfo

+ (NSDictionary *)getInfoDict{
    NSDictionary *dict = [LocalData getLocalJsonDataWithName:@"ChangeData.json"];
    return dict;
}
@end
