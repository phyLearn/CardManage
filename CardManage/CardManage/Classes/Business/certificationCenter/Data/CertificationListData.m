//
//  CertificationListData.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "CertificationListData.h"

@implementation CertificationListData

+ (NSArray *)getCertificationListArr{
    NSMutableArray *listArr = [NSMutableArray array];
    NSDictionary *sectionDict1 = @{
                                   @"title":@"必填",
                                   @"desc":@"请完整填写以下信息",
                                   @"color":@"#423232",
                                   @"listArr":@[
                                           @{@"title":@"身份认证",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"1",
                                             @"cerTag":@"0"
                                             },
                                           @{@"title":@"紧急联系人",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"1",
                                             @"cerTag":@"1"
                                             },
                                           @{@"title":@"收款银行卡",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"1",
                                             @"cerTag":@"2"
                                             },
                                           @{@"title":@"手机运营商",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"1",
                                             @"cerTag":@"3"
                                             },
                                           @{@"title":@"工作信息",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"1",
                                             @"cerTag":@"4"
                                             },
                                           @{@"title":@"支付宝认证",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"0",
                                             @"cerTag":@"5"
                                             },
                                           @{@"title":@"社交信息",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"0",
                                             @"cerTag":@"6"
                                             }
                                           ]
                                   };
    NSDictionary *sectionDict2 = @{
                                   @"title":@"选填",
                                   @"desc":@"",
                                   @"color":@"#42adad",
                                   @"listArr":@[
                                           @{@"title":@"芝麻信用",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"0",
                                             @"cerTag":@"7"
                                             },
                                           @{@"title":@"京东认证",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"0",
                                             @"cerTag":@"8"
                                             },
                                           @{@"title":@"淘宝认证",
                                             @"imageUrl":@"www.baidu.com",
                                             @"cerFlag":@"0",
                                             @"cerTag":@"9"
                                             }
                                           ]
                                   };
    [listArr addObject:sectionDict1];
    [listArr addObject:sectionDict2];
    return [listArr copy];
}

@end
