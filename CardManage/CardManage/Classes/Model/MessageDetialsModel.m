//
//  MessageDetialsModel.m
//  CardManage
//
//  Created by shanbao on 2018/7/10.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "MessageDetialsModel.h"

@implementation MessageDetialsModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        [self initWithData:dictionary];
    }
    return self;
}

-(void)initWithData:(NSDictionary *)dic{
    self.time = [dic objectForKey:@"time"];
    self.messageDetail = [dic objectForKey:@"message"];
   
    self.timeLabHeight = [self.time boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-70, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size.height;
    
    self.messageDetailLabHeight = [self.messageDetail boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-35, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size.height;
    
}

@end
