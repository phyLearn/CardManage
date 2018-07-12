//
//  MessageDetialsModel.h
//  CardManage
//
//  Created by shanbao on 2018/7/10.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageDetialsModel : NSObject

@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * messageDetail;
@property (nonatomic, assign) CGFloat timeLabHeight;
@property (nonatomic, assign) CGFloat messageDetailLabHeight;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
